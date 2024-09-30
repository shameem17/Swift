import Cocoa
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


let dictionary = [ 0:"Zero", 1:"One", 2:"Two", 3:"Three", 4:"Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]

let numbers = [15, 13, 780, 1]

let strings = numbers.map{ (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = dictionary[number % 10]! + output
        number/=10
    } while (number > 0)
    return output
}

print(strings)


func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen()
incrementByTen()
incrementByTen()


// closure example


func calcualtor(a: Int, b: Int) ->Int{
    return a-b
}

func adder(a: Int, b: Int)-> Int{
    return a+b
}

func subtractor(a: Int, b: Int)-> Int{
    return a-b
}
func multiplier(a: Int, b: Int)-> Int{
    return a*b
}

print(calcualtor(a: 34, b: 2))
//calcuator function with operation closure
/*
simplify the adder function it takes 2 Int and returns 1 Int.
 the function structure is: (Int, Int) -> Int
 it can be passed as an input of another function

*/
func closureCalcuator(a: Int, b: Int, calledOperator: (Int, Int) -> Int) ->Int{
    return calledOperator(a,b)
}
print(closureCalcuator(a: 35, b: 2, calledOperator: multiplier)) //multiplier function is passed


// closure syntax
/*
 { (parameters) -> return type in
    statement
 }
 
-> a function withou any name
 
 (a: Int, b: Int) -> Int{
    return a+b
 }
 -> and the starting '{' to the begining of the function
 { (a: Int, b: Int) -> Int
    return a+b
 }
 -> and a in keyword
 { (a: Int, b: Int) -> Int in
    return a+b
 }
 */

// replacing the calledOperator with closure

print(closureCalcuator(a: 21, b: 45, calledOperator: {(a: Int, b: Int) -> Int in
    return a + b
}))

//
/*
 1. swift comiler can automatically invoke the parameter data type.
 2. no need to mention the function as paramerter name. i.e: no need calledOperator
 3. parameters can be short. $0 and $1
 4. return in the same line
*/
// trailing closure:
print(closureCalcuator(a: 56, b: 9) { $0 / $1 })


// MARK: - Exercise

// 1. problem: add 1 to each no of an array

let numArrr = [1,4,5,8]

// solution 1:
// using for loop or forEach loop

// solution 2:
// use map (map transforms)

// map takes a function as input that transforms element of the array

func addOne(n: Int) -> Int{
    return n + 1
}

var newArr = numArrr.map(addOne)
print(newArr)

newArr = numArrr.map({(a: Int) -> Int in
    return a - 1
})
print(newArr)

newArr = numArrr.map({$0 * $0})
print(newArr)
