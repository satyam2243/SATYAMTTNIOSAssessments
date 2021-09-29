import UIKit


//Q1:-What is Error Protocol. Create a custom error conforming to error protocol.
//Sol: Error Protocol is just a type for representing error values that can be thrown. Swift requires you to create a custom Error type. Typically an Enum is used which conforms to the Error Protocol.

enum CustomError: Error {
    // Throw when an invalid password is entered
    case invalidPassword

    // Throw when an expected resource is not found
    case notFound
}

let currPass = "29024kjn"

func checkPass(pass : String)throws -> Bool{

    if(currPass == pass){
        return true
    }else{
        if(pass == ""){
            throw CustomError.notFound
        }
        throw CustomError.invalidPassword
    }
}






//Q2:- Write a failable initialiser for a class which throws a error  “Object not able to initialise” description a initialisationFailed case, Catch the error and print its error description.
//Sol:

enum nameError: Error {
    // Throw when an object initialisation is failed
    case initialisationfailed
}
extension nameError : LocalizedError{

    public var errorDescription: String? {
            switch self {
            case .initialisationfailed:
                return NSLocalizedString("Error : Object not able to initailise", comment: "Invalid initialisation of object")
            }
    }
}

class ShowError{
    let major : String
    init?(string : String)throws {

        if string == ""{
            throw nameError.initialisationfailed
        }else{
            self.major = string
            print("Object initailised")
        }
    }
}


do {
    var obj = try ShowError(string: "")
}catch{
    print(error.localizedDescription)
}
 




/*Q3:-Explain the difference try, try?, try! , make sure to write a program to explain the difference.
Sol:
 try : The try keyword is used to indicate that a method can throw an error. To catch and handle an error, the throwing method call needs to be wrapped in a do-catch statement.

 try? : The try? specifies that If we use the try? keyword and an error is thrown, the error is handled by turning it into an optional value. This means that there is no need to wrap the throwing method call in a do-catch statement.
 
 try! : an exclamation mark always serves as a warning sign. By appending an exclamation mark to the try keyword, error propagation is disabled.This means that, if an error does get thrown, your application crashes as the result of a runtime error
 */


enum ThrowableError: Error {

    case badError(howBad: Int)
}

func doSomething(everythingIsFine: Bool = false) throws -> String {

  if everythingIsFine {
      return "Everything is ok"
  } else {
      throw ThrowableError.badError(howBad: 4)
  }
}


//example of try
do {
    let result1 = try doSomething()
}
catch ThrowableError.badError(let howBad) {
    // Here you know about the error
    // Feel free to handle or to re-throw

    // Handle
    print("Bad Error (How Bad Level: \(howBad)")

}

//example of try!--

//let result2 = try! doSomething()


//example of try?---

//if let result3 = try? doSomething() {
//    // doSomething succeeded, and result is unwrapped.
//    print("Everything is working fine")
//} else {
//    // Ouch, doSomething() threw an error.
//    print("Error!! caught" )
//}





//Q4:-Write a program which loads the data from a datasource of 10 employees looks like below, Program would help to give salary bonus to employees. Which is based on some conditions but if employee is not able to satisfy the condition program should throw the error with specific error condition and its description should be printed.
//Sol:
struct employee{
    var empID: Int
    var empName: String
    var empMail: String
    var empExperience: Float
    var isPresent: Bool
    var competency: String
    var attendancePresent: Int
}

var emp: [employee] = [employee(empID: 101, empName: "Muskan", empMail: "muskan@tothenew.com", empExperience: 3, isPresent: true, competency: "Jvm",                              attendancePresent: 85),
                       employee(empID: 102, empName: "Mithlesh", empMail: "mithlesh@tothenew.com", empExperience: 5, isPresent: true, competency: "iOS", attendancePresent: 90),
                       employee(empID: 103, empName: "Ankit", empMail: "ankit@tothenew.com", empExperience: 2.5, isPresent: false, competency: "BigData", attendancePresent: 88),
                       employee(empID: 104, empName: "Sachin", empMail: "sachin@tothenew.com", empExperience: 2, isPresent: true, competency: "android", attendancePresent: 78),
                       employee(empID: 105, empName: "Merry", empMail: "merry@tothenew.com", empExperience: 4, isPresent: true, competency: "BigData", attendancePresent: 89),
                       employee(empID: 106, empName: "Rahul", empMail: "Rahul@tothenew.com", empExperience: 5, isPresent: true, competency: "iOS", attendancePresent: 96),
                       employee(empID: 107, empName: "Aryan", empMail: "Aryan@tothenew.com", empExperience: 3, isPresent: true, competency: "Qe", attendancePresent: 57),
                       employee(empID: 108, empName: "Kavya", empMail: "Kavya@tothenew.com", empExperience: 2, isPresent: true, competency: "iOS", attendancePresent: 85),
                       employee(empID: 109, empName: "Srishti", empMail: "Srishti@tothenew.com", empExperience: 1.5, isPresent: false, competency: "android", attendancePresent: 98),
                       employee(empID: 110, empName: "Harsh", empMail: "Harsh@tothenew.com", empExperience: 0.5, isPresent: true, competency: "Jvm", attendancePresent: 90)
            ]

enum empBonusError: Error {
    case isPresent (String)
    case inExperienced(String)
    case avgCompetency(String)
    case avgAttendance(String)
    
    var reason: String{
        switch self {
        case .isPresent(let name):
            return name + " is not present"
        case .inExperienced(let name):
            return name + " has not completed a year with us"
        case .avgCompetency(let name):
            return name + " competency does not fall under bonus program"
        case .avgAttendance(let name):
            return name + "'s attendance is not upto the mark"
        }
    }

}

class BonusProgram{
    
    func allowedForBonus(empEmail: String) throws -> Void {
        
        var i: employee {
            var object: employee? = nil
            for obj in emp where empEmail == obj.empMail{
                object = obj
            }
            return object!
        }
        
            if i.isPresent == true {
                if i.empExperience > 1.0 {
                    if i.competency == "iOS" || i.competency == "android" || i.competency == "BigData" || i.competency == "AI" {
                        if i.attendancePresent > 80 {
                            print("\(i.empName) is eligible for bonus")
                        }else {
                            throw empBonusError.avgAttendance(i.empName)
                        }
                    }else {
                        throw empBonusError.avgCompetency(i.empName)
                    }
                }else {
                    throw empBonusError.inExperienced(i.empName)
                }
            }else {
                throw empBonusError.isPresent(i.empName)
            }
        
    }
    
}

let bonusProgram = BonusProgram()
do {
    
    let _ = try bonusProgram.allowedForBonus(empEmail: "merry@tothenew.com")
    let _ = try bonusProgram.allowedForBonus(empEmail: "mithlesh@tothenew.com")
    let _ = try bonusProgram.allowedForBonus(empEmail: "muskan@tothenew.com")
    

}catch empBonusError.isPresent(let name){
    print(name + " is absent")
}catch empBonusError.avgCompetency(let name){
    print(name + " competency does not fall under bonus program")
}catch empBonusError.inExperienced(let name){
    print(name + " has not completed a year with us")
}catch empBonusError.avgAttendance(let name){
    print(name + "'s attendance is less than 80")
}
