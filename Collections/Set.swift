
//set
//contains unique elements

print("-----Declare Set-------")
//1
var sports = Set<String>()
var userName: Set<String> = []
print(sports)
print(userName)

print("--------Insert-------")

sports.insert("Cricket")
sports.insert("Football")
sports.insert("Hocky")
print("sports = \(sports)")
//insrting duplicate element
sports.insert("Football")
print("After adding duplicate element:",sports)

print("-------Delete---------")
sports.remove("Hocky")
sports.remove("unknown")
print("Removing Hocky: \(sports)")

//index based remove
sports.remove(at: sports.index(sports.startIndex, offsetBy: 1))
print(sports)
sports.insert("Cricket")
sports.insert("Football")
sports.insert("Hocky")


print("-----check if exist------")

print("Does Socer exist? \(sports.contains("Socer"))")
print("Does Cricket exist? \(sports.contains("Cricket"))")
print("Does football(small f) exist? \(sports.contains("football"))")
print("Empty check. Is empty?",sports.isEmpty)

//iteration
print("-------iteration----")

for sport in sports.sorted(){
    print("sprot=",sport)
}

//operations

print("----operations-------")
print("union-------->")
var oddNumbers:Set<Int> = [1,3,5,7,9]
let evenNumbers: Set<Int> = [2,4,6,8,10]

let unionSet = oddNumbers.union(evenNumbers)
print("union set=",unionSet) //set don't maintain order
print("intersection------->")
oddNumbers.insert(10) //adding 10 for testing
let intersectionSet = oddNumbers.intersection(evenNumbers)
print("intersection set=",intersectionSet)
oddNumbers.remove(10)
print("subtraction------>")
let primeNumbers: Set<Int> = [2,3,5,7]
let subtractionSet = oddNumbers.subtracting(primeNumbers)
let subtractionSet2 = primeNumbers.subtracting(oddNumbers)
print("odd - prime=",subtractionSet)
print("prime - odd=",subtractionSet2)

print("Symmetric Difference------->")
let symmetricDifferences = oddNumbers.symmetricDifference(evenNumbers)
print("symmetric diff=",symmetricDifferences)


print("-----------Membership-----------")
//subset
//superset
print("Subset Superset---->")
var isSubset = oddNumbers.isSubset(of: primeNumbers)
print("is primeNumbers subset of oddNumbers?=",isSubset)

isSubset = primeNumbers.isSuperset(of: oddNumbers)
print("is primeNumbers superset of oddNumbers=",isSubset)

let subSet: Set<Int> = [3,5,7]
isSubset = subSet.isSubset(of: oddNumbers)
print("is subSet subSet of oddNumbers=",isSubset)

isSubset = oddNumbers.isSuperset(of: subSet)
print("is oddNumbers superSet of subSet=",isSubset)

print("Disjoint---->")
//no similar element

var isDisjoint = subSet.isDisjoint(with: evenNumbers)
print("subSet is disjoint with evenNumbers? \(isDisjoint)")

isDisjoint = evenNumbers.isDisjoint(with: primeNumbers)
print("evenNumbers is disjoint with primeNumbers? \(isDisjoint)")

print("Equality----->")
//equality
if subSet == oddNumbers{
    print("subSet and oddNumbers are equal")
}else{
    print("Not equal")
}

print(subSet.isEmpty)

