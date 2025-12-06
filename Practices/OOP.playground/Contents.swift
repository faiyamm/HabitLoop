import UIKit

/*
 A class is used to define a custom type that groups together data (properties)
 and behavior (methods).
 It acts as a blueprint for creating objects, allowing us to model real-world
 entities like customers, books, dogs, etc.
 
 -----> SYNTAX <-----
 note: class name should be PascalCase
 
 class ClassName {
    var propertyName1: DataType
    var propertyName2: DataType
 
    init(propertyName1: DataType, propertyName2: DataType) {
        self.propertyName1 = propertyName1
        self.propertyName2 = propertyName2
    }
 
    // methods (optional inside class)
    func functionName() -> ReturnType {
        return ...
    }
 }
 
 */

// example 1
class Dog {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
//    func bark() -> String {
//        "\(name) says Woof!"
//    }
    
    func bark() {
        print("\(name) says Woof!")
    }
}

let myDog = Dog(name: "Doggy", age: 4)
let yourDog = Dog(name: "Max", age: 2)
myDog.bark()
yourDog.bark()

// example 2
class Customer {
    // properties
    var name: String
    var email: String
    var phoneNumber: Int
    var visits: Int
    
    // initializer
    init(name: String, email: String, phoneNumber: Int, visits: Int) {
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.visits = visits
    }
    
    // methods
//    func information() {
//        print("Name: \(name), Email: \(email), Visits: \(visits)")
//    }
    
    func greeting() -> String {
        return "Welcome back, \(name)"
    }
    
    func addVisit() {
        visits += 1
    }
    
    func summary() {
        "\(name) - Visits: \(visits)"
    }
    
    func contactCard() -> String {
        """
        Name: \(name)
        Email: \(email)
        Phone Number: \(phoneNumber)
        Visits: \(visits)
        """
    }
}

let customer1 = Customer(name: "Alice", email: "alice@example.com", phoneNumber: 12345678, visits: 5)
print(customer1.greeting())
print(customer1.visits)
print(customer1.email)
print(customer1.contactCard())
print("---------------------")

let customer2 = Customer(name: "Fai", email: "fai@example.com", phoneNumber: 12345678, visits: 2)
print(customer2.contactCard())
print("---------------------")

let customer3 = Customer(name: "Sam", email: "sam@example.com", phoneNumber: 12345678, visits: 10)
print(customer3.contactCard())
customer3.addVisit()
print("No. of visits \(customer3.visits)")

// mini challenge:
// 1. add phoneNumber property
// 2. create a method contactCard() and return all info
