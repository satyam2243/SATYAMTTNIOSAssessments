import UIKit
import Foundation
import CoreGraphics



//Question 1. Write a function called siftBeans(fromGroceryList:) that takes a grocery list (as an array of strings) and “sifts out” the beans from the other groceries. The function should take one argument that has a parameter name called list, and it should return a named tuple of the type (beans: [String], otherGroceries: [String]).


func siftBeans(arr : [String]) -> (beans : [String],otherGroceries : [String]){
    
    var beans = [String]()
    var groceries = [String]()
    
    for grocery in arr{
        if grocery.contains("beans"){
            beans.append(grocery)
        }else{
            groceries.append(grocery)
        }
    }
    
    return (beans,groceries)
}

var groceryList = ["green beans","milk","black beans","pinto beans","apples"]
let result = siftBeans(arr : groceryList)

print(result.beans)
print(result.otherGroceries)



// Question 2 - Make a calculator class with a function name “equals” that take an enum case as value like multiply, subtraction, addition, square root, division.

enum Operators {
    case multiply
    case substraction
    case addition
    case squareRoot
}

func equals(chooseOperator: Operators, value1: Double, value2: Double){
    
    switch chooseOperator {
    case .addition:
        print("addition of numbers is :--->  " + "\(value1 + value2)")
    case .substraction:
        print("substraction of numbers is :--->  " + "\(value1 - value2)")
    case .multiply:
        print("multiply of numbers is :--->  " + "\(value1 * value2)")
    case .squareRoot:
        print("squareRoot of firstNumber is :--->   " + "\(sqrt(value1))")
        print("squareRoot of SecondNumber is :--->   " + "\(sqrt(value2))")
    }
}

equals(chooseOperator: .addition, value1: 10, value2: 5)
equals(chooseOperator: .substraction, value1: 20, value2: 2)
equals(chooseOperator: .multiply, value1: 2, value2: 30)
equals(chooseOperator: .squareRoot, value1: 22, value2: 25)








// Question 3 - Make the same calculator using functions as an argument, define all type functions in a struct.

struct Calculator {
    
    // function for addition--
    func addValues(a: Double, b: Double) {
        print("addition of numbers is :--->  " + "\(a + b)")
    }
    
    // function for substraction--
    func substractValues(a: Double, b: Double) {
        print("substraction of numbers is :--->  " + "\(a - b)")
    }
    
    // function for multiplication--
    func multiplyValues(a: Double, b: Double) {
        print("multiplication of numbers is :--->  " + "\(a * b)")
    }
    
    // function for squareroot--
    func squareRootValues(a: Double, b: Double) {
        print("squareRoot of firstNumber is :--->   " + "\(sqrt(a))")
        print("squareRoot of SecondNumber is :--->   " + "\(sqrt(b))")
    }
   
}


Calculator().addValues(a: 300, b: 2)
Calculator().substractValues(a: 200, b: 56)
Calculator().multiplyValues(a: 100, b: 59)
Calculator().squareRootValues(a: 100, b: 64)
