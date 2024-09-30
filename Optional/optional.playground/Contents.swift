import Cocoa

//optional
//a representation of a value that may or may not have a value
//contains a value or nil
//prevent runtime error

//syntax: - var name: String? = "MyName"

//Unwrapping
//1. Optional Chaining
//example: student?.name (student object is a optional)
//2. Force Unwrapping
//example: address! (address variable is optional)
//3. Conditional Unwrapping
//example: if let name = student.name {.....}
//4. Nil - coalescing operator (??)
//example: short-circuti evaluation

var name: String?
name = "Alice"
print("name = \(name)") //print optional name value

//conditional unwrapping

if let name = name{
    print("Name after conditional Unwrapping = \(name)")
}

//guard used inside function for conditional unwrapping
func guardUnwrapping(){
    //name is a global variable
    guard let value = name else{
        return
    }
    print("Guard Unwrapped name = \(value)")
}

guardUnwrapping()

//force unwarpping
var age: Int?
age = 43
//if age is nill then force unwrapping will cause crush problem
print("Force Unwrapping = \(age!)")



//optional chaining
print("Length of name = \(name?.count)")
//name is optional and the count is also optional

if let lengthOfName = name?.count{
    print("Length of name(no optional) = \(lengthOfName)")
}

//Nil-coalescing Operator
//set a default value where it doesn't have a value

var firstName: String?
firstName = "First"

let finalName = firstName ?? "No Name"

print("Final name = \(finalName)")

let shortNum: Int? = Int("43")
let longNum: Optional<Int> = Int("43")
print(shortNum)
print(longNum)

let number:Int? = Optional.some(42)
let noNumber: Int? = Optional.none
 
print(number!)
print(noNumber)

var country: String?
print(country)


protocol MyProtocol{
    var name: String {get}
    var age: Int {get set}
    func display()
}

class Shameem: MyProtocol{
    var name: String
    
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    func display() {
        print("My name is \(name) and age \(age)")
    }
    
}

var shameem = Shameem(name: "Shameem", age: 34)
shameem.display()
shameem.name = "ahammed"
shameem.display()
