import UIKit

// functions

/*
 syntax:
 
    func functionName(param1: Type, param2: Type) -> ReturnType {
        // function body
        // logic goes here
 
        return value
    }
 */

// example 1
func printWelcome(){
    print("Example 1")
}
printWelcome()


// example 2
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

// greet(person: "Alice")
let message = greet(person: "Bob")
print(message)


// example 3
func add(number1:Int, number2:Int) -> Int {
    return number1 + number2
}
let n1 = 3
let n2 = 5
let sum = add(number1: n1, number2: n2)
print("The sum of \(n1) and \(n2) is \(sum)")

let result = add(number1: 10, number2: 20)
print(result)

// example 4: function with unnamed params
func multiply(_ x: Int, _ y: Int) -> Int {
    return x * y
}

print(multiply(4, 5))

// example 5
func deliveryTime(minutes: Int) -> String {
    "Your order will be ready in \(minutes) minutes."
}
let delivery = deliveryTime(minutes: 30)
print(delivery)

/* MiniChallenge
 1.  Define a function called welcomeStudent.
 2.  The function should take one parameter: name of type String.
 3.  The function should return a String.
 4.  Inside the function, build a message like: "Welcome, [name]! Ready to learn Swift?".
 5.  Call the function with a sample name and print the result.
*/

func welcomeStudent(name: String) -> String {
    let welcome = "Welcome " + name + "!, Ready to learn Swift?"
    return welcome
}

print(welcomeStudent(name: "Sofia"))

// class 102 3

func greetCustomer(_ name:String) {
    print("Welcome, \(name)!")
}
greetCustomer("Isai")

func printMenuItem(_ name: String, _ price: Double) {
    print("The dish \(name): $\(price)")
}
printMenuItem("Pizza", 9.99)

func totalWithTax(_ price: Double) -> Double {
    return price * 1.08
}
let amount = totalWithTax(100)
print(amount)

let menu = [
    "Pizza": 9.90,
    "Soup": 4.50,
    "Steak": 14.99
]

for (name, price) in menu {
    printMenuItem(name,price)
}

func renderRow(_ name: String, _ price: Double) {
    print ("Row -> \(name), $\(price)")
}

renderRow("Tacos", 7.50)
