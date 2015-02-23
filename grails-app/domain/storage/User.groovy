package storage

class User {

    String login
	String permission

    static constraints = {
        login blank: false
		permission blank: false, inList: ["read_and_write", "read"]
    }
}