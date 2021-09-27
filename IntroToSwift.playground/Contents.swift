import UIKit

//Q1 -->  create a third employee structure that contains the information from both based on common id.
//Sol:

enum CountryandBranch: String {
    case america = "America",
     india = "India",
     britain = "Britain",
     japan = "Japan",
     china = "China"
}

enum Department {
    case IOS
    case Android
    case JVM
    case FullStack
    case Web
}


// --- structure for personlInformation ---
struct EmployeePersonal {
    var employeeID: Int
    var name: String
    var country: CountryandBranch
    var address: String
    var hobbies: String?
}

// --- structure for professional information ---
struct EmployeeProfessional {
    var employeeID: Int
    var name: String
    var department: Department
    var branch: CountryandBranch
    var experience: Int
    
}

// --- structure containing both info based on employeeId ---
struct EmployeeCommonInfo {
    var employeeCommomId: Int
    var name: String
    var country: CountryandBranch
    var department: Department
    var branch: CountryandBranch
    var experience: Int
    var address : String
    var hobbies : String?
}

let emplPers1 = EmployeePersonal(employeeID: 10, name: "Satyam", country: CountryandBranch.india, address: "12 gandhi Nagar, Etawah", hobbies: "chess")
let emplPers2 = EmployeePersonal(employeeID: 11, name: "Chirag", country: CountryandBranch.america, address: "19 Ashok Nagar, Delhi", hobbies: "Guitar")
let emplPers3 = EmployeePersonal(employeeID: 12, name: "Saif", country: CountryandBranch.japan, address: "12D Gomti Nagar, Lucknow", hobbies: "Dance")
let emplPers4 = EmployeePersonal(employeeID: 13, name: "Talha", country: CountryandBranch.china, address: "123/74 Poytechnic, Lucknow", hobbies: "chess")
let emplPers5 = EmployeePersonal(employeeID: 14, name: "Raymon", country: CountryandBranch.britain, address: "868 Cant, Bareilly", hobbies: "Shooting")
let emplPers6 = EmployeePersonal(employeeID: 15, name: "Gaurav", country: CountryandBranch.india, address: "15 Miltery Nagar, Dehradun", hobbies: "Swimmimg")

var arrPer : [EmployeePersonal] = [emplPers1, emplPers2, emplPers3, emplPers4, emplPers5, emplPers6]


let emplPro1 = EmployeeProfessional(employeeID: 10, name: "Satyam", department: .IOS, branch: CountryandBranch.india, experience: 3)
let emplPro2 = EmployeeProfessional(employeeID: 11, name: "Chirag", department: .Android, branch: CountryandBranch.america, experience: 4)
let emplPro3 = EmployeeProfessional(employeeID: 12, name: "Saif  ", department: .FullStack, branch: CountryandBranch.japan, experience: 1)
let emplPro4 = EmployeeProfessional(employeeID: 13, name: "Talha ", department: .JVM, branch: CountryandBranch.china, experience: 2)
let emplPro5 = EmployeeProfessional(employeeID: 14, name: "Raymon", department: .IOS, branch: CountryandBranch.britain, experience: 3)
let emplPro6 = EmployeeProfessional(employeeID: 15, name: "Gaurav", department: .Web, branch: CountryandBranch.india, experience: 5)

var arrPro: [EmployeeProfessional] = [emplPro1, emplPro2, emplPro3, emplPro4, emplPro5, emplPro6]

var arrInfo = [EmployeeCommonInfo]()
var count = 0

for id in arrPer {
    count += 1
    if let i = arrPro.firstIndex(where: { $0.employeeID == id.employeeID }) {
        arrInfo.append(EmployeeCommonInfo(employeeCommomId: id.employeeID, name: id.name, country: id.country, department: arrPro[i].department, branch: arrPro[i].branch, experience: arrPro[i].experience, address: id.address, hobbies: id.hobbies))
    }
}

for info in arrInfo{
    print(info)
}





//Q2 : write a function that takes the two structure and give me list of all the employee that live in certain country
//Sol:

func employeeList(arr : [EmployeePersonal],country : CountryandBranch) -> [String]{
    var list0 = [String]()
    for i in arr{
        if case country = i.country{
            list0.append(i.name)
        }
    }
    return list0
}

var empList = employeeList(arr: arrPer, country: CountryandBranch.india)

for j in empList{
    print(j)
}





//Q3 :   write a function that give me list of all the employee that live in certain department
//Sol:
func departmentList(array : [EmployeeProfessional],dept : Department) -> [String]{
    var list1 = [String]()
    for empl in array{
        if(empl.department == dept){
            list1.append(empl.name)
        }
    }
    return list1
}

var deptList = departmentList(array: arrPro, dept: .IOS)
for i in deptList{
    print(i)
}





//Q4 : write a function that give me list of all the employee that live in same country and work in the same branch.
//Sol:

func CommonBandC(array : [EmployeeCommonInfo]) -> [String]{
    var list2 = [String]()
    for i in array{
        if case i.country = i.branch {
            list2.append(i.name)
        }
    }
    return list2
}

var samePlaceAndBranch = CommonBandC(array: arrInfo)

for j in samePlaceAndBranch{
    print(j)
}





//Q5 :  write a function that return me list of all the employee name that has a hobby and with their experience
//Sol:


func hobbyAndExperience(arr : [EmployeeCommonInfo]){
    for i in arr{
        if i.hobbies != nil{
            print("Name is \(i.name) and Experience is \(i.experience)")
        }
    }
}

hobbyAndExperience(arr: arrInfo)





//Q6 : write a function that return me list of all the employee name that starts with any “S”
//Sol:

func matchString(arr : [EmployeeProfessional]) -> [String]{
    var list3 = [String]()
    for i in arr{
        if i.name.contains("S") || i.name.contains("s"){
            list3.append(i.name)
        }
    }
    return list3
}

var empName = matchString(arr : arrPro)

for j in empName{
    print(j)
}
