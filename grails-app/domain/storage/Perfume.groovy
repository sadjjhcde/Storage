package storage

class Perfume {
    String name
    String brand
    Double cost
    Integer size
    Integer amount

    static constraints = {
        name blank: false
        amount nullable: false
    }
}
