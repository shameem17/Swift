
//Protocols

//blueprint/interface that defines functions, variables
//classes, structs, enums can conform to it
//conform means satifsfies/implements methods/variables
//protocols can be extended by other protocols

//example: Person protocol(Base class). Student and Teacher can conform to it

protocol PersonProtocol{
    //implementing class will implement these
    var name: String {get set} //read write
    var discription: String {get} //read only
    func locate()
    //pass by value so mutating need to change the property values
    //protocol methos must not have body
    mutating func update()
}


protocol StudentProtocol: PersonProtocol{
    var studentId: String {get set}
}

//struct/classes can conform to multiple protocols
struct Student: PersonProtocol, StudentProtocol {
    var name: String
    var studentId: String
    var discription: String{
        return "\(name) is a Student with id \(studentId)"
    }
    
    func locate() {
        
    }
    mutating func update() {
        
    }
}

let student: StudentProtocol = Student(name: "Asif", studentId: "453")

print(student.discription)
 
struct UndergraduateStudent: StudentProtocol{
    var studentId: String
    
    var name: String
    
    var discription: String{
        return "\(name) UG Student."
    }
    
    func locate() {
        print(self.discription)
    }
    
   mutating func update() {
        self.name = "Updated Name"
    }
    
}

var ugStudent = UndergraduateStudent(studentId: "21", name: "Rifat")
print(ugStudent)
ugStudent.update()
ugStudent.locate()

//class can inherit multiple protocols and classes

protocol CarProtocol{
    
}
class Vehicle{
    
}
class Car: Vehicle, CarProtocol{
    
}


//enum can also conform protocls
protocol StudentEnumProtocol{
    //mutating means function updates state of instance.
    //classes don't need to have mutating when conforming to the protocol
    mutating func update()
}

enum StudentEnum: StudentEnumProtocol{
    case underGraduate
    case graduate
    
    mutating func update() {
        self = .underGraduate
    }
}


//protocol initializers example
protocol PlaneProtocol{
    var capacity: Int {get set}
    var mileage: Int? {get set}
    
    //initializers
    init(capacity: Int)
    // ? making failable initializers
    //i.e. initialization may fail (optional)
    
    init?(capacity: Int, mileage: Int)
    
    var discription: String {get}
}

class PassengerPlane: PlaneProtocol{
    var capacity: Int
    var mileage: Int?
    var discription: String{
        return "Passenger Plane"
    }
    
    required init(capacity: Int) {
        self.capacity = capacity
    }
    required init?(capacity: Int, mileage: Int) {
        if mileage < 0{
            return nil
        }
        self.mileage = mileage
        self.capacity = capacity
    }
}


//Delegate protocol
//class-only protocol: Only classes can conform to it
// i.e. protocols inherits from AnyObject
protocol AirportDelegate: AnyObject{
    func register(_ plane: PlaneProtocol)
}

class AirportController: AirportDelegate{
    func register(_ plane: PlaneProtocol) {
        print("plane \(plane) arrived")
    }
}

//protocol as a type

struct Airport {
    var planes: [PlaneProtocol] = []
    //recommended to use weak in case of using Delegate
    weak var airportDelegate: AirportDelegate?
    
    mutating func planeArrived(_ plane: PlaneProtocol){
        planes.append(plane)
        airportDelegate?.register(plane)
    }
}
 
let plane: PlaneProtocol = PassengerPlane(capacity: 100)
let airportController = AirportController()
var airport = Airport()
airport.airportDelegate = airportController
airport.planeArrived(plane)

print("airport = \(airport)")


//Extension: Conformance to protocol
//adding extra behaviour to an existing protocol
protocol Flyable{
    func fly(to: String, from: String)
}
extension PassengerPlane: Flyable{
    func fly(to: String, from: String) {
        print("plane is flying \(from) to \(to)")
    }
}


//conditional conforming to protocol
extension Array: Flyable where Element: Flyable{
    func fly(to: String, from: String) {
        for object in self{
            object.fly(to: to, from: from)
        }
    }
}

var arrayOfFlyablePlanes: [PassengerPlane] = []
let passengerPlane = PassengerPlane(capacity: 234)
arrayOfFlyablePlanes.append(passengerPlane)
arrayOfFlyablePlanes.fly(to: "Dhaka", from: "Khulna")


//synthesized implementation
//built in protocol
//e.g. Equatable, Hashable, Comparable
//Equatable/Hashable (synthesized implementation): Stuructures with stored
//properties conforming to Equatable

struct Ball: Equatable, Hashable{
    var radius: Int
    var color: String
}

let greenBall = Ball(radius: 10, color: "green")
let redBall = Ball(radius: 23, color: "red")
let anotherBall = Ball(radius: 10, color: "green")

if greenBall == redBall{
    print("Redball greenball are equal")
}else if greenBall == anotherBall{
    print("Greenball anotherball are same")
}

//enum

enum BallType: Equatable, Hashable, Comparable{
    case kids
    case socer
    case cricket
    case football
}
let kidsBall = BallType.cricket
let footBall = BallType.football

print(kidsBall < footBall) //comparison. uses raw value


//protocol Types
var planes: [PlaneProtocol] = []

let passengerPlaneA = PassengerPlane(capacity: 63)
planes.append(passengerPlaneA)



class CargoPlane: PlaneProtocol {
    var capacity: Int
    var mileage: Int?
    
    required init?(capacity: Int, mileage: Int) {
        if capacity < 0{
            return nil
        }
        self.capacity = capacity
        self.mileage = mileage
    }
    required init(capacity: Int) {
        self.capacity = capacity
    }
    var discription: String{
        return "Cargo Plane"
    }
}

let cargoPlane = CargoPlane(capacity: 89)
if let cargoPlaneA = CargoPlane(capacity: 362, mileage: 83774){
    planes.append(cargoPlaneA)
}
planes.append(cargoPlane)

for plane in planes{
    print("iterating over \(plane.discription), capacity \(plane.capacity) and mileage \(plane.mileage ?? 0)")
}


//protocol inheritance

protocol Landable: Flyable{
    func land(at ariport: Airport)
}

extension CargoPlane: Landable{
    func fly(to: String, from: String) {
        print("Cargo plane is flying from \(from) to \(to) ")
    }
    
    func land(at ariport: Airport) {
        print("Landing at \(airport)")
    }
}

var cargoPlaneB = CargoPlane(capacity: 30, mileage: 34)
cargoPlaneB?.fly(to: "Khulna", from: "Dhaka")
cargoPlaneB?.land(at: airport)


//composition
//combining several protocol together
func process(_ plane: PlaneProtocol & Flyable){
    print("\(plane) is processed at airport")
}
//cargoPlane conforms both PlaneProtocol & Flyable protocol
process(cargoPlane)


//protocol conformance check
// - is: checks whether a type conforms to a certain protocol
// - as?: downcast operator. it will return an optional of protocol type if the object confirms to the protocol
// -as!: downcast operator, similar to as? but forces downcast and if it fails then runtime error will occur

//check whether passengerPlane conforms PlaneProtocol
if passengerPlane is PlaneProtocol{
    print("passengerPlane conforms to PlaneProtocol")
}

if passengerPlane is Landable{
    print("passengerPlane conforms Landable")
}else{
    print("PassengerPlane doesn't conform landable")
}

//will be nil if it don't conform the protocol
let testAriport = airport as? Flyable
print("testAriprot = \(testAriport)")

if let testPlane = passengerPlane as? PlaneProtocol{
    print("TestPlane = \(testPlane.capacity)")
}

//forced casting
//let forcedCasting = passengerPlane as! Airport
//print(forcedCasting)


//optional Protocol Requirements
//@objc is required and optional can be added
//@objc protocol: can be implemented by classes inheriting from Obj-C or @objc classes
//called with ? after function name

@objc protocol Countable{
    @objc optional func count() -> Int
}

extension PassengerPlane: Countable{
    func count() -> Int {
        return 31
    }
}
print("passengerPlane count = \(passengerPlane.count())")

protocol Driver {
    var name: String { get }
    func driveToDestination(_ destination: String, with food: String)
}

class DeliveryDriver: Driver {
    let name: String
    init(name: String) {
        self.name = name
    }
    func driveToDestination(_ destination: String, with food: String) {
        print("\(name) is driving to \(destination) to deliver \(food).")
    }
}

class LittleLemon {
    var deliveryDriver: Driver?
    func deliverFood(_ food: String, to destination: String) {
        if let deliveryDriver = deliveryDriver {
            deliveryDriver.driveToDestination(
                destination,
                with: food
            )
        } else {
            print("No delivery driver.")
        }
    }
}

let bob = DeliveryDriver(name: "Bob")
let alex = DeliveryDriver(name: "Alex")
let littleLemon = LittleLemon()
//no driver assigned
littleLemon.deliveryDriver = alex
littleLemon.deliverFood(
    "Super Spaghetti",
    to: "1 Spaghetti Lane"
)
littleLemon.deliveryDriver = bob
littleLemon.deliverFood(
    "Super Spaghetti",
    to: "2 Spaghetti Lane"
)


protocol P{
    var name: String { get } //read only
    var age: Int { get set } //read write
    func display()
}

class S: P{
    let name: String
    var age: Int

    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    func display(){
        print("\(name) is a Student")
    }
}

var s: P = S(name: "Joe", age: 23)
s.display()

protocol A{
    var a: String {get set}
}
protocol X{
    
}

@objc protocol DataCount{
    var number: Int {get set}
    @objc optional func dataCount() -> Int
}

class DataClass: DataCount{
    var number: Int
    init(number: Int){
        self.number = number
    }
    func dataCount() -> Int {
        return self.number
    }
    
}

var dataClass: DataClass = DataClass(number: 45)
let number: Int? = dataClass.dataCount()


