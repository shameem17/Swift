import Cocoa

//boolean diclaration

let isActive = false
let isStudent = true
print(isActive)
print(isStudent)

var isAuthenticated = 1 //not a boolean type
//Int type variable


//if isAuthenticated{
//    print("Authenticated")
//}

//function return boolean values

var isMultiple = 120.isMultiple(of: 4)

if isMultiple{
    print("120 is multiple of 4")
}

//toggle
print("isMultiple= \(isMultiple)")
isMultiple = !isMultiple
print("isMultiple= \(isMultiple)")
isMultiple.toggle()
print("isMultiple= \(isMultiple)")

