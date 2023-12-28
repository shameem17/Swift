
//for loop

print("less than n loop")

for index in 1..<5{
    print(index)
}

print("equal to n loop")
for index in 1...5{
    print(index)
}

print("Array interation using for loop")
let array = [0,1,2,3,4]
for value in array{
    print(value)
}
let char = ["a", "b", "c", "d"]

for (index, letter) in char.enumerated(){
    print("\(index), \(letter)")
}

//dictionary

let info = ["roll": "name", "101": "s1", "102": "s2"]

for (roll, name) in info{
    print("roll=\(roll), name=\(name)")
}

//stride
// 0..<101 step by 10
for i in stride(from: 0, to: 101, by: 10){
    print("i = \(i)")
}

