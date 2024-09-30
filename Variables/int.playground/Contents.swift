import Cocoa

//normal int

let score = 10

//big int
/// use as (,) format like 1,000,000...

let bigInt = 10_000_000_000

//swift ignore (_). _ can be any number
print(bigInt)

var phoneNumber = 01____788____381_679

print(phoneNumber)
phoneNumber += 1
print(phoneNumber)

//type casting

let a = 10
let b = 31.3
let f = Int(34.999999)
let result = Double(a) + b
print(result)


//MARK: - functions on varibales

var num: Int = 36
var isMultipleOfFive: Bool = num.isMultiple(of: 5)
print(isMultipleOfFive)

print(num.description) //string representation

var str = "This is my string. and the number is:" + num.description
print(str)

print("number of bits in num=\(num.bitWidth)") //64bit int

var binaryNumber = 0b101
var octalNumber = 0o12
print(binaryNumber)
print(octalNumber)
var hexadecimalNumber = 0xAB
print(hexadecimalNumber)
