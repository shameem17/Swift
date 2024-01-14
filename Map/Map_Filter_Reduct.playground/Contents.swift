import Cocoa

//map: maps value with another value.
//eg: String representation of numbers
//map is used to transform

var number: [Int] = [1,2,3,4,5]

let numToString = number.map { (aNumber) -> String in
    return String(aNumber)
}
print(numToString)

//short hand
let newNumber = number.map{ String($0)}
print(newNumber)

//filter is used to remove value
//used to implement conditions
//eg: return number greater than 3
var numGreaterThanThree = number.filter{(aNumber) -> Bool in
    return aNumber > 3
}
print(numGreaterThanThree)
numGreaterThanThree = number.filter{ $0 > 3}
print(numGreaterThanThree)

//reduce to return a value
//combines two value
//eg: sum of an array

let sumofAll = number.reduce(0){ (resultSoFar, currentNum) -> Int in
    return resultSoFar + currentNum
}
print(sumofAll)

//compact map
//compactMap is a special type of map that discards any nil values.
let urlsAsStrings = ["https://www.google.com", "not a valid url"]
let urlsOrNil = urlsAsStrings.map { URL(string: $0) }
let urls = urlsAsStrings.compactMap { URL(string: $0) }
print(urls)
print(urlsOrNil)

//flatMap
//The mapping closure returns an array of elements rather than just a single element, and
//The final resulting array must be a one-dimensional array.   This means that there must not be an array inside of an array.
struct User {
    let id: Int
    let name: String
    let languages: [String]
}

let users = [
    User(id: 1, name: "John", languages: ["English", "German"]),
    User(id: 2, name: "Tom", languages: ["Russian", "Spanish"]),
    User(id: 4, name: "Son", languages: ["Bangla", "English"])
]

let allLanguages = users.flatMap { $0.languages }
print(allLanguages)


//execcise: suppose an array contains order price and another array contains order location. you have to find the total order price of a certain place. Use map, filter and reduce

//solution:

class Order{
    let price: Int
    let location: String
    init(price: Int, location: String){
        self.price = price
        self.location = location
    }
}

func totalOrder(orders:[Order], location: String ) -> Int{
    let orderAtlocation = orders.filter{ $0.location == location}
    //print(orderAtlocation)
    let prices = orderAtlocation.map{order in
        return order.price
    }
    let totalPrice = prices.reduce(0) { $0 + $1 }
    return totalPrice
}

let orders: [Order] =
[ Order(price: 234, location: "Mirpur"),
 Order(price: 66, location: "Mirpur"),
 Order(price: 300, location: "Farmgate"),
Order(price: 323, location: "Mohammadpur")]

let location = "Mirpur"
print("Total Order at \(location) is \(totalOrder(orders: orders, location: location))")


//forEarch

orders.forEach{ order in
    print("\(order.price)  \(order.location)")
    
}

protocol NetworkManager {
    func getMealsList() -> [String]
}

class MenuManager {
    
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func allMeals() -> String {
        return networkManager.getMealsList().joined(separator: ",")
    }
}

