//swift string
import UIKit

//declare a string
print("----------String Variable-------------")
//1. with explicit type
let firstName: String = "Shameem"

//without indicating type
let lastName = "Ahammed"

//print string
print("firstName=",firstName)
print("lastName=",lastName)

//puncuations, emoji and other characters can also be used
let fileName = "MyPhoto.png"
let ratings = "⭐️⭐️⭐️"
print("fileName= \(fileName)")
print("Rating=",ratings)

//using quotes

let quote = "He says, \"I am ill\"."


//concatenating string
//1.
print("----------Concatenating-----------")
let name = firstName + " " + lastName
print(name)

//2.
let fullName = "\(firstName) \(lastName)"
print(fullName)

//more string component can be added using second method
//interpolation of string
print("----------Interpolation-------------")
let message = "Hello world! I am \(firstName) \(lastName)"
print(message)

//complex operation
print("----------Complex Operation Concatenation-------------")
var userName = "shameem17"
var url = "https://www.github.com/"
url+=userName
print(url)

print("-----------MultiLine Stirng------------")
//multi Line Stirng
//1.
var address = "Mohakhali DOHS\nDhaka-1216\nBangladesh"
print(address)

//2. """ is used for multi line string
//what you see, what you get method
print("-----------MultiLine Stirng 3 cotation ------------")
address = """
Mohakhali DOHS
Dhaka-1216
Bangladesh
"""

print(address)

print("-----------ignoring new line------------")

address = #"Mohakhali DOHS\nDhaka-1216\nBangladesh"#
print(address)


//iteration over string
print("----------Iteration Over String-------------")
for char in name{
    print("The current character is \(char)")
}

//character
print("----------Character-------------")
let singleChar: Character = "A"
print(singleChar)

//array of character
print("----------Character Array-------------")
var arrayChar: [Character] = ["a", "b", "c"]

print(arrayChar)

//string to character array
//1.

var tempString = "This is a String"
let charArray = Array(tempString)
print("the character array is=\(charArray)")

//2.
let chars = [Character](tempString)
print("chars= \(chars)")

//append in string (concatanating)
tempString += " new adding"
print("tempString = \(tempString)")

//append new element to array
print("----------character array append-------------")
arrayChar.append("d") //don't forget to declare the array as var, not let to avoid error
print("new array = ",arrayChar)


//unicode
print("----------Unicode-------------")
let eAcute = "\u{E9}"  //é
print(eAcute)

/// Stirng Indexing

//subscripting is not allowed in swift
//name[0] will create an error

//name = Shameem Ahammed
print("----------Stirng Index-------------")
let startIndex = name.startIndex
let endIndex = name.endIndex
print(startIndex)
print(endIndex)
print("Character at startIndex= \(name[startIndex])")

//Runtime Error
//print("Character at endIned=\(name[endIndex])")
//endIndex points to the index after the string end
print("----------before end index-------------")
let beforeEnd = name.index(before: endIndex)
//last element of string is at beforeEnd
print("Character at endIned= \(name[beforeEnd])")//d

print("----------after start index-------------")
//after index
let afterIndex = name.index(after: startIndex)
print("afterIndex=",name[afterIndex])//h

print("----------offset index-------------")
//offset
let offsetIndex = name.index(startIndex, offsetBy: 3)
print("offset=",name[offsetIndex]) //m(4th element)

//iterate using index
print("-----------Interate Using Index-----------")

for id in name.indices{
    print("id=\(id) ",name[id])
}


//insertion

print("-----------String Insertion-----------")

//syntax array.insert("new element(character)", at: position)
var question = "What is your name"
question.insert("?", at: question.endIndex) //variable needed
print(question)


print("-----------String Remove-----------")

question.remove(at: question.index(before: question.endIndex)) //remove the last element(?)
print(question)


print("----------Stirng Range-------------")

//range
var range = question.index(question.endIndex, offsetBy: -4)..<question.endIndex
//remove the range
question.removeSubrange(range) //name will be removed
print(question)

range = question.startIndex..<question.index(question.startIndex, offsetBy: 4)
question.removeSubrange(range) //What will be removed
print(question)


//subStrting
print("----------SubString-------------")

let str = "Swift is fun!"

let index = str.firstIndex(of: " ") ?? str.endIndex //find the index of space
print(index)

let subStr = str[..<index] //begining to index
print(subStr) //Swift will be printed


print("----------String Comparison-------------")
//string comparison

//two strings are equal if their extended grapheme are canonically equivalent
// same linguistic meaning and appearance, even if underlaying unicode scalars are different
let string1 = "Cat"
let string2 = "cat"

if string1 == string2{
    print("Both strings are equal")
}else{
    print("The strings are not equal")
}
let cafe1 = "caf\u{E9}" //latin small letter e with acute
let cafe2 = "caf\u{65}\u{301}" //latin small letter e and combines acute accent

if cafe1 == cafe2{
    print("Both \(cafe1) and \(cafe2) are equal")
}else{
    print("Not equal")
}

//prefix suffix check

print("--------Suffix Prefix---------")
let countries = [
    "United States of America",
    "United Kingdom",
    "United Arab Emirates",
    "Bangladesh"
]

let prefix = "United"
let suffix = "America"
for country in countries{
    if country.hasPrefix(prefix){
        print("\(country) has prefix \(prefix)")
    }
    if country.hasSuffix(suffix){
        print("\(country) has suffix \(suffix)")
    }
}

//unicode representations
print("--------Unicode Representation--------")
for codeUnit in name.utf8{
    print(codeUnit)
}

//string other functions
print("-----length of string---------")
//1. Length
let sentence = "Swift is fun"
let numberofChar = sentence.count

print("\(sentence) contains \(numberofChar) letters(with Space).")

print("-------Upper case/Lower Case-------")
//2. Upper case
print("UpperCased =",sentence.uppercased())
//3. Lower case
print("Lower Case =", sentence.lowercased())

//append character
let ch: Character = "Z"
tempString += String(ch)
print(tempString)

//are the starting index of two string same?

let str1 = "Hello world"
let str2 = "Welcome to "
let s1 = str1.startIndex
let s2 = str2.startIndex

print("str1=\(s1), str2=\(s2)") //yes the raw bits are same
print(name.startIndex)

//is the end index same? if strings are same length?
print("\(str1.endIndex), \(str2.endIndex)") //yes
