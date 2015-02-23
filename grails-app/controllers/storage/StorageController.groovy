package storage

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.grails.plugins.excelimport.*
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import pl.touk.excel.export.WebXlsxExporter

class StorageController {

	def excelImportService
	def currentUser
	def canEdit
	
	def index() {
		render(view: "login")
	}
	
    def store() {        
		if (currentUser != null){
	        def allPerfumes = Perfume.list(sort: "name", order: "asc")
			def searchValue = params["search_value"] 
			if (searchValue != null && !searchValue.isEmpty()) {
				allPerfumes = Perfume.findAll { name =~ '%' + searchValue + '%'}			
			}else{
				allPerfumes = Perfume.list(sort: "name", order: "asc")
			}
	        render(view: "storage", model: [perfumes: allPerfumes, user: currentUser.login, canEdit: canEdit])
		}else{
			render(view: "login")
		}
    }

	def login() {
		def users = User.findAllByLogin(params["login_value"])
		if (users.size() != 0){
			currentUser = users[0]
			canEdit = currentUser.permission == "read_and_write"
			redirect(action: "store")
		}else{
			render(view: "login", model: [invalid: true])
		}
	}
	
	def logout() {
		currentUser = null
		render(view: "login")
	}
			
    def add() {
		if (canEdit){
	        if (params['cost'] != null){
				params['cost'] = params['cost'].replace(".", ",")
	        }
	        new Perfume(params).save(failOnError: true)
		}
        redirect(action: "store")
    }

    def importData() {		
		if (canEdit){
			Map CONFIG_BOOK_COLUMN_MAP = [
				sheet:'Sheet1',
				startRow: 0,
				columnMap:  [
				 'A':'name',
				 'B':'brand',
				 'C':'cost',
				 'D':'size',
				 'E':'amount',
				]
			]		
			MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
			CommonsMultipartFile file = (CommonsMultipartFile) mpr.getFile("file");	  
			Workbook workbook = WorkbookFactory.create(file.inputStream)
			def perfumeList = excelImportService.columns(workbook, CONFIG_BOOK_COLUMN_MAP)			
			perfumeList.each { item ->
				new Perfume(item).save()
			}		
		}
		redirect(action: "store")
    }
	
	def exportData() {
		def allPerfumes = Perfume.list(sort: "name", order: "asc")
		def headers = ['Name', 'Brand', 'Cost', 'Size', 'Amount']
		def withProperties = ['name', 'brand', 'cost', 'size', 'amount']		
		new WebXlsxExporter().with {
			setResponseHeaders(response)
			fillHeader(headers)
			add(allPerfumes, withProperties)
			save(response.outputStream)
		}
	}
	
	def endingProducts() {		
		if (currentUser != null){
			def endingPerfumes = Perfume.findAll { amount < 5 }	
			render(view: "ending", model: [perfumes: endingPerfumes, user: currentUser.login])
		}else{
			render(view: "login")
		}
	}
}
