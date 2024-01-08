//cocoa for macos
print("Closure")

//closure
//closure: - self contained block of functionality
// - passed around and used in code
// - captures and stores constants/variable form context


//global functions: closures with a name, but without capturing any values

func globalFunction(num1: Int, num2: Int) -> Int{
    return num1 + num2
}

// Nested functions: closures with a name, capturing values from enclosed function

func enclosingFunction(pram1: Int) ->String{
    
    func nestedFunction(param2: Bool)->Int{
        return 2
    }
    
    return ""
}

//Closure expressions: unnamed closures written with lightweight syntax, capture

var studentName = ["Alice", "Joe", "Boob", "Tom", "Alex", "Smith"]

func sortedReverse(name1: String, name2: String) -> Bool{
    return name1>name2
}

print(studentName.sorted(by: sortedReverse))

print(studentName.sorted{ (name1: String, name2: String) -> Bool in
    return name1 < name2
})



print(studentName.sorted{ name1, name2 in
    return name1 > name2
    
})

print(studentName.sorted{ name1, name2 in name2>name1 })


//sort-hand argument

print(studentName.sorted{ $1 < $0})

print(studentName.sorted(by: <))


//Trailing Closure
func aFuncWithClosure(closure: () ->Void){
    
}

aFuncWithClosure {
    //using trailing closure
}

aFuncWithClosure(closure: {
    //without using trailing closure
})

//multiple closures
func loadName(completion: (String) -> Void, onError: (Error) ->Void){
    //completion("Name")
    let error = NSError(domain: "Network Eroor", code: 404)
    onError(error)
}
//first closure's argument lable can be omitted
//capture value of global varibales and modifies

loadName{ name in
    print("\(name) is passed")
} onError: { error in
    print("\(error) error is passed")
}

//functions/closures are reference types
var completionClosure = { (name: String) -> Void in
    print("\(name) received successfully")
}
var onErrorClosure = { (error: Error) -> Void in
    print("\(error) occured")
}

loadName(completion: completionClosure, onError: onErrorClosure)


//Escaping Closure
//closure is executed later, after function returns
//e.g. there may be an asynchronous API call that comes back later and
//closure is executed at that time

func loadStudent(studentId: Int, completion: @escaping([String]) ->()){
    DispatchQueue.global().async {
        completion(["S1", "S2", "S3"])
    }
}

loadStudent(studentId: 34){ result in
    print(result)
}


//Auto Closure
//closure that
//- automatically wraps an expression
//- does not take parameters
//- returns a value of expression
//- braces can be omitted

var students = ["Alice", "Jennifer", "Alex", "Smit"]

func conductAppointmentForSduent(processor: @autoclosure() -> (String)){
    let student = processor()
    print("appointment with \(student) starting")
}

conductAppointmentForSduent(processor: students.removeFirst())
conductAppointmentForSduent(processor: students.removeFirst())
//

