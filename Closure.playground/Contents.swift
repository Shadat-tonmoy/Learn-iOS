import UIKit

var greeting = "Hello, playground"

func calculator(n1 : Int, n2 : Int, operation : (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}


func add(n1 : Int, n2 : Int) -> Int{
    return n1 + n2
}

func multiply(n1 : Int, n2 : Int) -> Int{
    return n1 * n2
}

func divide(n1 : Int, n2 : Int) -> Int{
    return n1 / n2
}

//calculator(n1: 5, n2: 7, operation: multiply(n1:n2:))
calculator(n1: 5, n2: 7, operation: {(n1 : Int, n2 : Int) -> Int in
    return n1 * n2
})

calculator(n1: 4, n2: 5, operation: { (n1, n2) -> Int in
    return n1 + n2
})

calculator(n1: 7, n2: 8, operation: { (n1, n2) in
    return n1 - n2
})

let array = [5,6,7,8,8]

let addedOne = array.map( {(n : Int) -> Int in
    return n + 1
    }
)

let addedTwo = array.map{$0 + 2}
print(addedTwo)
