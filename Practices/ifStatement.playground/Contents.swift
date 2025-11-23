import UIKit

// if - else if - else

/*
 ------- syntax -------
 if condition1 {
    this block runs if condition is true
 } else if condition2 {
    this block runs if condition1 is false and condition2 is true
 } else {
    this block runs if none of the above conditions are true
 }
 
 */

// ------- example 1 -------
var guests = 7
let capacity = 10

if guests > capacity {
    print("over capacity!!!")
} else {
    print("We can seat this party.")
}

// ------- example 2 -------
let rating = 4.2

if rating >= 4.5 {
    print("Excellent")
} else if rating >= 3.5 {
    print("Good")
} else {
    print("Needs improvement")
}

// ------- example 3: boolean operators -------
let isOpen = true
let hasOutdoorSeating = true

if isOpen && hasOutdoorSeating {
    print("Open with outdoor seating!")
} else if isOpen && !hasOutdoorSeating {
    print("Open indoor only")
} else {
    print("Closed")
}

// ------- example 4 -------
// == compare values

let userName = "fai"

if userName == "Fai" {
    print("Hello Fai!!")
} else {
    print("Unkown user")
}

// ------- example 5: ternary -------
let price = 12.0
let label = price > 10 ? "Premium" : "Regular"
print(label)

// ------- example 6 -------
let children = 2
let groupSize = 5

if groupSize >= 8 {
    print("Large group - call manager")
} else if children > 0 {
    print("Offer kids menu")
} else {
    print("Standard seating")
}

// Mini Challenge
// show one message if user is Vip, and another if not
var isVip = false

if !isVip {
    print("VIP user")
} else {
    print("Non vip user")
}
