import Cocoa

//struct and class
//stores properties and methods

struct Students{
    let id: Int
    var name: String
    var address: String
    func update(){
        
    }
    func display(){
        print("Student info\nName: \(self.name)\nId: \(self.id)\nAddress: \(self.address)")
    }
}

class University {
    let id: Int
    var name: String
    var students: [Students] = []
    
    init(id: Int, name: String, students: [Students]) {
        self.id = id
        self.name = name
        self.students = students
    }
    func display(){
        print("University Information\nId: \(self.id)\nName: \(name)\nStudents: \(self.students)")
    }
}

var student1 = Students(id: 1, name: "Student 1", address: "Dhaka, Bangladesh")

var university1 = University(id: 1, name: "Dhaka University", students: [student1])

//call methods
student1.display()
university1.display()

//change property
student1.name = "Alice"
student1.display()

//pass by vlaue
var studentCopy = student1
studentCopy.address = "Khulna"
print("student1 address = \(student1.address) & studentCopy Address = \(studentCopy.address)") // original object value not chaged

//pass by reference
var universityRef = university1
universityRef.name = "CU"
print("univesity1 name = \(universityRef.name) and universityRef name = \(universityRef.name)") //points to same instance

if university1 === universityRef{
    print("Both points to same instance")
}


//INHERITANCE

class Person{
    var name: String
    
    init(name: String) {
        self.name = name
    }
    var discription: String{
        return "hi \(name)"
    }
    func display(){
        print("the person name is \(name)")
    }
}
class Student: Person{
    var studentId: Int
 
    init(studentId: Int, name: String){
        self.studentId = studentId
        super.init(name: name)
    }
    override var discription: String{
        return "the \(name) is a student"
    }
}
class Teacher: Person{
    var teacherId: Int
    
    override func display() {
        print("the teacher name is \(name) and empId \(teacherId)")
    }
    init(teacherId: Int, name: String) {
        self.teacherId = teacherId
        super.init(name: name)
    }
    override var discription: String{
        return "\(name) is a teacher"
    }
}

var t1 = Teacher(teacherId: 32, name: "Teacher 1")
print("Discription = \(t1.discription)")
t1.display()

class UndergraduateStudent: Student{
    
}
class AssoicateProfessor: Teacher{
    
}

var student = Student(studentId: 54, name: "Bob")
var teacher: Person = Teacher(teacherId: 80, name: "Professor")


//base calss pointer
var genericStudent: Person = Student(studentId: 3, name: "Alex")
genericStudent.display()

//base class pointer can handel all inherited classes
func handelPerson(person: Person){
    print("-------")
    print(person.discription)
    
}

handelPerson(person: genericStudent)
handelPerson(person: student)
handelPerson(person: teacher)

//final class can't be inherited
//final property also can't be inherited
final class City{
    var name: String
    init(name: String){
        self.name = name
    }
}

//class Location: City {  //error
//    var locId: Int
//    init(id: Int, name){
//        self.locId = id
//        super.init(name: name)
//    }
//}




//didSet : notify us if the property is set

class Location{
    var locId: Int{
        willSet{
            print("The new value is = \(newValue)")
        }
        didSet{
            print("Location Id change from \(oldValue) to \(locId)")
        }
    }
    
    init(locId: Int){
        self.locId = locId
    }
}

var location = Location(locId: 894)
location.locId = 45 //didSet triggered


//access modifier

//5 access modifiers:-
// 1. pulbic : - Allows source files from other modules to access the code, however, other modules can’t subclass and override classes.
// 2. private : - Allow the code within a code definition to access the code
// 3. fileprivate :- allow the defining source file to access the code
// 4. internal :- allow source files from the defining module to acess the code
// 5. open :- allow source files from other modules to access the code. other modules can subclass and override classes


class BaseClass{
    var name: String
    var id: Int
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    internal func displayInfo(){
        print("Class = \(name) and classId = \(id)")
    }
}

class DerivedClass: BaseClass{
    
}

var derived  = DerivedClass(name: "Derived Class", id: 20)
derived.displayInfo()


//Type Casting

//identify and ensure instance type
// type check operators:
// 1. is- checks whether an instance is of a certain subclass type
// 2. as- cast an instance as a different type
print("--------")
class Customer{
    var id: Int
    init(id:Int){
        self.id = id
    }
}

class AllergyCustomer: Customer{
    let dishesToAvoid = [
        "Dish 4",
        "Dish 9"
    ]
    func emergencyCall(){
        print("call 999!")
    }
}

var customers: [Customer] = []

for _ in 0..<5{
    let randomNumber = Int.random(in: 1...100)
    let customer: Customer
    if randomNumber%2 == 0{
        customer = Customer(id: randomNumber)
    }
    else{
        customer = AllergyCustomer(id: randomNumber)
    }
    customers.append(customer)
}

for customer in customers{
    print("Customer id = \(customer.id)")
    if customer is AllergyCustomer{
        print("Welcome. Some food contains Allergy ingredients!")
    }else{
        print("Welcome")
    }
    
    //casting
    if let allergyCustomer = customer as? AllergyCustomer{
        print("Dises to avoid:")
        allergyCustomer.dishesToAvoid
        print("Emmergency Call:")
        allergyCustomer.emergencyCall()
    }
}

//polymorphism
//derived class property acts differently

//overriding

class A{
    fileprivate let id: Int
    var x: String{
        "A class"
    }
    init(id: Int){
        self.id = id
    }
    func display(){
        print(id)
    }

}
class B: A{
    override var x: String{
        "B class"
    }
    override func display(){
        super.display()
    }
}

var b = B(id: 67)
b.display()
print(b.x)
