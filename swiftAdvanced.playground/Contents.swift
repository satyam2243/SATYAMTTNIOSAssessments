import UIKit




//1. What is extension?
/*
  Swift Extension is a useful feature that helps in adding more functionality to an existing Class, Structure, Enumeration or Protocol type. This includes adding functionalities for types where you don’t have the original source code too (extensions for Int, Bool, String etc. types).
 
 (i)-> Add computed instance properties and computed type properties.
 (ii)-> Define instance methods and type methods.
 (iii)-> Provide new initialisers
 (iv)-> Define subscripts
 (v)-> Define and use new nested types
 (vi)-> Make an existing type conform to a protocol

 Note: Stored Properties can’t be added to Extensions. Swift Extensions don’t support overriding properties and method implementations.
 
 

 <<-syntax->>
 
 extension ClassStructEnumOrProtocolNameGoesHere {
         //add functionality to the above type
     }


 */





//
//2. Create a class and write the delegate of UITextField in extension of that class.
//


//3. Write a protocol and create an extension of the protocol. In extension create a function
//
//     func sayHello() {
//
//      print(“Hello!”)
//
//}
//





//4.Write an enum and create an extension of the enum.
//
enum Direction: String {
    case east
    case west
    case north
    case south
}

extension Direction {
    var value: String {
        return self.rawValue
    }
    
    func printDirection() {
        switch self {
        case .east:
            print("Alpha Team, We are moving to east direction")
        case .north:
            print("Beta Team, We are moving to north direction")
        case .south:
            print("gamma Team, We are moving to south direction")
        case .west:
            print("Delta Team, We are moving to west direction")
        }
    }
}

print(Direction.west.value)
Direction.south.printDirection()





//5. What is Generic?

/*
 
1-  Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define. You can write code that avoids duplication and expresses its intent in a clear, abstracted manner.

2-  more clearely, we can make such kind of functions and types , which can work with any type like (int, string, struct, etc....).

3-  with Generic we can write a function once and use it on different types.
 
*/





//6. Explain generic with an example?

// swapping values with Generic--
func swapTwoValues<T>(_ a: inout T, _ b: inout T){
    let tempA = a
    a = b
    b = tempA
}

var val1 = 29
var val2 = 20

print("val1 is currently \(val1), and val2 is currently \(val2)")
swapTwoValues(&val1, &val2)
print("val1 is now \(val1), and val2 is now \(val2)")


var nameStr = "satyam"
var sureNameStr = "Dixit"

print("nameStr is currently \(nameStr), and surNameStr is currently \(sureNameStr)")
swapTwoValues(&nameStr, &sureNameStr)
print("nameStr is now \(nameStr), and surNameStr is now \(sureNameStr)")






//7. Explain the difference between map and compactMap with an example.

///============================******************* ======================///
                                 /*map*/
///============================*********************======================///

var numArr = [1,2,3,4,5,6]

// Map1
var newNumArr1 = numArr.map({(value: Int) -> Int in
    return value + 30
})

print(newNumArr1)


//Map2
var newNumArr2 = numArr.map{(value: Int) in
    return value + 80
}
print(newNumArr2)


//Map3
var newNumArr3 = numArr.map{ value in
    return value * 3
}
print(newNumArr3)


// map4
var newNumArr4 = numArr.map{
    return $0 * 2
}
print(newNumArr4)



///======================************************======================///
                            /*compactMap*/
///======================************************======================///

let newArray5 = numArr.compactMap({(value: Int) -> Int in
    return value * 3
})
print(newArray5)

let nameArray1: [String?] = ["Joyce", "Rob", "Marie"]
let validNames1 = nameArray1.compactMap{$0}
print(validNames1)

//Implemented on optionals : Removes nil from the collection.

let nameArray: [String?] = ["Joyce", nil, "Rob", nil, "Marie"]
let validNames = nameArray.compactMap{$0}
print(validNames)






//8. Write an example of reduce function with initial value 1000.

//example-1 reduce
let values = [3, 4, 5]
let sum = values.reduce(1000, +)
print(sum)

//example -2 reduce
let values2 = [7, 3, 10]
let newValues = values2.reduce(1000) {
    print("\($0) + \($1) = \($0 + $1)")
    return $0 + $1
}




//9. - Find all person whose age is more than 25 using filter function.

struct Person {
    
    var name : String
    var age : Int
}

let person1 = Person(name: "Sam", age: 23)
let person2 = Person(name: "John", age: 30)
let person3 = Person(name: "Rob", age: 27)
let person4 = Person(name: "Luke", age: 20)

let personArray = [person1, person2, person3, person4]

let ageCompare = personArray.filter { $0.age > 25 }

print(ageCompare)







//10. Make a property wrapper @nonNegative and use it to make values to 0 if any negative value added to a variable.

@propertyWrapper
struct NonNegative<Value: BinaryInteger> {
    var value: Value
    
    init(wrappedValue: Value) {
        if wrappedValue < 0 {
            self.value = 0
        }else {
            self.value = wrappedValue
        }
    }
    
    var wrappedValue: Value {
        get { value }
        set {
            if newValue < 0 {
                value = 0
            }else {
                value = newValue
            }
        }
    }
}

struct User {
    @NonNegative var score = 0
}

var user = User()
user.score += 10
print("When value is nonnegative then score is " + "\(user.score)")


user.score -= 40
print("When value is negative then score is " + "\(user.score)")
