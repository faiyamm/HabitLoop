import UIKit

// ARRAYS
let dishes = ["Pizza", "Pasta", "Gnocchi"] // creating the array
print(dishes[0]) // access to data
print(dishes[1])

// creating a mutable array
var orders = [String]()
orders.append("Soup")
orders.append("Burger")
print(orders)

// DICTIONARIES
let menuPrices = [
    "Pizza": 12.99,
    "Pasta": 10.99,
    "Gnocchi": 8.99
]

print(menuPrices["Pasta"]!)

// mini challenge 1 - create a dictionary for drinks
let drinks = [
    "Orange juice": 6.99,
    "Soda": 5.99,
    "Water": 3.99
]

print("orange juice price: ", drinks["Orange juice"]!)

// FOR EACH
let fruits = [
    "Apple": 1.50,
    "Banana": 0.58,
    "Mango": 2.30
]

fruits.forEach{ fruits, price in
    if price > 1 {
        print("\(fruits):  $\(price)")
    }
}

// mini challenge 2: print all the drinks using for each
drinks.forEach{ drinks, price in
        print("\(drinks): $\(price)")
}
