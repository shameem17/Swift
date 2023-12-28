import UIKit

//initialization
print("-----Initialization------>")
// key, value

var userInfo: Dictionary<Int, String> = [:]
var phoneNUmber: [Int: [String]] = [:]
userInfo = [1: "b", 2: "a"]
userInfo[102] = "c"
print(userInfo)

print("-----old value------>")


if let oldValue = userInfo.updateValue("d", forKey: 1){
    print("oldValue = \(oldValue) replaced by \(userInfo[1]!)")
}

print("------remove--------")
userInfo[2] = nil //forKey 2 will be removed
print("after removing 2:",userInfo)

userInfo.removeValue(forKey: 102)
print("removing 102:",userInfo)

print("-------iteration------->")
//inserting some new value
userInfo[2] = "c"
userInfo[3] = "d"
userInfo[4] = "e"
userInfo[5] = "f"
userInfo[6] = "g"
userInfo[7] = "h"
userInfo[8] = "i"
//dictionary is unordered
for (key,value) in userInfo{
     
    print("key=\(key), value= \(value)")
}

//sorted by key

for key in userInfo.keys.sorted() {
    print("key=\(key)")
}

//sorted by value

for value in userInfo.values.sorted() {
    print("key=\(value)")
}

//keys are hashable
