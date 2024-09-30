import Cocoa

//Enumerations

//A structure that groups related values together
//type safe
//case can have int, string, double, float type

enum Color {
    case red
    case blue
    case green
    case pink
    case white
    case black
}

var color : Color = .red //same as:- var color = Color.red
switch color {
case .red:
    print("color is red")
    break
case .green:
    print("color is green")
    break
default:
    print("Other color")
}

//iteration over enum cases
enum Meal: CaseIterable{
    case chicken
    case rice
    case fish
    case desert
}

var meal : Meal = .chicken

for meal in Meal.allCases{
    print("meal = \(meal)")
}

//associated values
enum Trip{
    case Dhaka(Int)
    case Khulna(Int)
    case CoxsBazar(Int, String)
    case London
}

var aTrip = Trip.Dhaka(4)

print("aTrip = \(aTrip)")
aTrip = Trip.CoxsBazar(43, "CoxsToday")
switch aTrip{
case .Dhaka(let duration):
    print("Daka is \(duration)km away")
    break
case .CoxsBazar(let duration, let hotel):
    print("CoxsBazar \(duration)km, Hotel = \(hotel)")
default:
    break
}


//raw values

enum Letter: Character{
    case a = "A"
    case b = "B"
    case c = "C"
}

var aLetter = Letter.a
print("aLetter = \(aLetter)")
print("aLetter RawValue = \(aLetter.rawValue)")

//find keys
if let letter = Letter(rawValue: "C"){
    print("letter Key is = \(letter)")
}


//implicit raw values
enum Order: Int{
    case one
    case two = 5
    case three
    case four
}

let anOrder = Order.one
print("anOrder = \(anOrder)")
//raw value
print("anOrder = \(anOrder.rawValue)") //starts with 0 or specified value


//recursive enum

enum Arithmatic{
    case number(Int)
    indirect case add(Arithmatic, Arithmatic)
    indirect case multiply(Arithmatic, Arithmatic)
}

let num1 = Arithmatic.number(2)
let num2 = Arithmatic.number(3)
let num3 = Arithmatic.number(5)

func calculate(expression: Arithmatic) -> Int{
    switch expression{
    case .number(let value):
        return value
    case .add(let left, let right):
        return calculate(expression: left) + calculate(expression: right)
    case .multiply(let left, let right):
        return calculate(expression: left) * calculate(expression: right)
    }
}

//(num1 + num2) * num3
let sum = Arithmatic.add(num1, num2)
let product = Arithmatic.multiply(sum, num3)

let result = calculate(expression: product)
print("result = \(result)")

enum Ingredient: String {
    case lettuce = "Romain Lettuce"
    case croutons = "Salted Croutons"
    case chicken = "Free Range Chicken"
}

print("This is the ingredient enumeration value: \(Ingredient.lettuce)")
