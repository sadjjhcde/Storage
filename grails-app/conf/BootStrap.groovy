import storage.Perfume
import storage.User

class BootStrap {

    def init = { servletContext ->
        new Perfume(name: "ANGEL SCHLESSER", brand: "PIROUETTE", cost: 12.50, size: 100, amount: 2).save(failOnError: true)
        new Perfume(name: "NARCISO RODRIGUEZ", brand: "NARCISO", cost: 34, size: 50, amount: 10).save(failOnError: true)
        new Perfume(name: "INTERCITY BEAUTY COMPANY", brand: "AVATARE", cost: 27.30, size: 100, amount: 3).save(failOnError: true)
        new Perfume(name: "HUGO BOSS", brand: "BOTTLED SPORT", cost: 19.50, size: 100, amount: 70).save(failOnError: true)
		new User(login: "admin", permission: "read_and_write").save(failOnError: true)
		new User(login: "read-only", permission: "read").save(failOnError: true)
    }

    def destroy = {
    }
}
