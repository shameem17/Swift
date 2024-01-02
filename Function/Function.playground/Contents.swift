import Cocoa



///function syntax
///func function_name(parameters )->return type(){
///}

//function with no return and no parameter
func welcome(){
    print("Welcome to Swift")
}
//function call
welcome()

//function with parameter
func welcomeMember(yourName: String){
    print("Welcome \(yourName) to Swift")
}
//function call with parameter
welcomeMember(yourName: "Shameem")

//multiple parameter and return value
func adder(num1: Int, num2: Int)-> Int{
    return num1 + num2
}

let result = adder(num1: 32, num2: 12)
print(result)
print(adder(num1: 3, num2: 6))

//multiple return value
func minMax(list: [Int]) -> (min: Int, max: Int){
    if var mn: Int = list.first, var mx = list.first{
        for num in list{
            if(num>mx)
            {
                mx=num
            }
            if(mn>num){
                mn=num
            }
        }
        return (min: mn, max: mx)
    }
   return (-1,-1)
}

let minMaxResult = minMax(list: [1,2,-4,3,233,43])
print("min value =",minMaxResult.min)
print("max value =",minMaxResult.max)

//implicit return

func multiplier(num1: Int, num2: Int) -> Int{
    num1*num2 //function should contain only one line of statement
}

print("multiplier=",multiplier(num1: 3, num2: 2))


//argument Label and parameter name
func greetPerson(with name: String) -> Void{  //name: parameter, with: argument label
    print("Hi \(name)")
}

//function call using argument label
greetPerson(with: "Alice")

//no argument label
func getArea(_ length: Int, _ width: Int) -> Void{
    print("The area is \(length*width)")
}
//don't need to specify the parameter name as argument label is not specified
// if there is no argument lable then paramenter name work as argument name
getArea(4, 3)

//default parameter value

func circleArea(radious: Double, pi: Double = 3.1416){
    print("The area of circle is: \(pi*radious*radious)")
}

//function can be called with specifiygin pi and without pi

circleArea(radious: 2)
circleArea(radious: 2, pi: 3.14)


//variadic parameters
//one or more same type of parameters

func average(numbers: Double...) ->Double{
    var sum: Double  = 0
    var n = numbers.count
    for num in numbers{
        sum+=num
    }
    return sum/Double(n)
}

print("avg=",average(numbers: 1,2,3,4,4,5))

//in-out function
//pass by reference
//modify content

var name = "Alice"
print("Name before update \(name)")
func updateName(name: inout String){
    name = "Bob"
}

updateName(name: &name)
print("Name after update \(name)")


//function type
//use as variable

func subtractTwoNumbers(num1: Int, num2: Int) -> Int{
    num1 - num2
}

//assign the function to a variable
let myFunc: (Int , Int) -> Int = subtractTwoNumbers

print("The subtraction function using variable = \(myFunc(30,4))")

//use as parameter types

func showResult(function: (Int, Int) -> Int, num1: Int, num2: Int){
    print("Result of function = \(function(num1,num2))")
}
//call the showResult by passing the subtraction function as parameter

showResult(function: subtractTwoNumbers, num1: 34, num2: 12)

//with return value

func retrunResult(function: (Int, Int) -> Int, num1: Int, num2: Int) ->Int{
    return function(num1,num2)
}
//call the showResult by passing the subtraction function as parameter

print("Returned value =",retrunResult(function: subtractTwoNumbers, num1: 34, num2: 78))


func divider(num1: Int, num2: Int) -> Int{
    return num1/num2
}

//return function
func calculator(sign: Character) -> (Int, Int) -> Int{
    if sign == "+"{
        return adder
    }
    else if sign == "-"{
        return subtractTwoNumbers
    }
    else if sign == "*"{
        return multiplier
    }
    return divider
}

var sign: Character = "+"
var getFunc = calculator(sign: sign)
print("Result of \(sign) function = \(getFunc(10,4))")


sign = "-"
getFunc = calculator(sign: sign)
print("Result of \(sign) function = \(getFunc(10,4))")

sign = "*"
getFunc = calculator(sign: sign)
print("Result of \(sign) function = \(getFunc(10,4))")

sign = "/"
getFunc = calculator(sign: sign)
print("Result of \(sign) function = \(getFunc(10,4))")


//nested function
//function inside a function

func function1(num1: Int){
    func function2(num: Int){
        print("Printing \(num) inside func2")
    }
    function2(num: num1)
}

function1(num1: 20)
