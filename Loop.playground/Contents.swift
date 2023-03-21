import UIKit

let names = ["Anna", "Alex", "Brain", "Jack"]

for name in names {
    print("Hello \(name)")
}


for number in 1...5 {
    print("number is \(number)")
}

let fruits = ["Apple", "Pear", "Orange"]

let contacts = ["Adam" : 123456, "James" : 987656, "Amy" : 23483]

let word = "Helloabcdefghijklkasdf"

let halfOpenRange = 1..<5

let closedRange = 1...5

for fruit in fruits{
    print("Fruit is : \(fruit)")
}

for pair in contacts {
    print("Person : \(pair.key) Number : \(pair.value)")
}

for letter in word{
    print("Letter is : \(letter)")
}

for i in halfOpenRange{
    print("index is : \(i)")
}
