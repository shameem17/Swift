
//array

//declare array
//1.
var cities: Array<String> = []

//2.
var districts: [String] = []

//3.
//array type is inferred to be [Int]
//but var array = [] is not possible
var array = [1,2,3,4,5] //integer array

//append elements
cities.append("Dhaka")
cities.append("Khulna")
districts.append("Barishal")
districts.append("Satkhira")

//print array
print("-------Print Array--------")
print(cities)
print(districts)
print(array)

print("-------Number of Elements in Array--------")
print("cities array have \(cities.count) elements")

//initialize array with same value or elements
print("-------Array Initialization with same number--------")
var age = Array(repeating: 10, count: 15) //15 elements added
print("There are \(age.count) elements in age")
print("The age array is: \(age)")

//concatenating arrays
print("-------Array concatenation--------")

var result = cities + districts //both array needs to be same data type
print(result)

//some built-in functions

print("------isEmpty-------")
var emptyArray: [String] = []

print("the emptyArray is empty? =",emptyArray.isEmpty)
print("the cities array is empty? =",cities.isEmpty)

//indexing in array
print("------indexing-------")
emptyArray.append("1st Data")
print(emptyArray[0]) //1st element

emptyArray.append("2nd Data")
emptyArray.append("3rd Data")
emptyArray.append("4th Data")
emptyArray.append("5th Data")
emptyArray.append("6th Data")
print(emptyArray)

emptyArray[1...5] = ["change 1", "change 2", "change 3", "change 4", "change 5"]
print(emptyArray)

emptyArray[2...4] = ["change 1", "change 2", "change 3", "change 4", "change 5"]
print(emptyArray) //replace the array within 2..3 index

//first element
print("First element is: \(emptyArray.first!)") //unwrap the optional value with "!"

print("Last value is: \(emptyArray.last!)")

//modify array
emptyArray[0...5] = ["changed"]
print(emptyArray)


print("------Insert, Delete--------")

emptyArray.insert("0", at: 0)
print(emptyArray)
emptyArray.insert(contentsOf: ["0","1"], at: 0)
print(emptyArray)

//remove

let removeElement = emptyArray.remove(at: 0)
print(emptyArray)


//iteration
print("------Iteration-------")
for values in emptyArray{
    print("Current element= \(values)")
}

//iteration with index

for (index, value) in emptyArray.enumerated(){
    print("index=\(index), value = \(value)")
}

// using n

let n = emptyArray.count

for i in 0..<n{
    print(emptyArray[i])
}
