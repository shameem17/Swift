
//switch

let number = 68

switch number{
case 0..<33:
    print("Fail")
case 33..<40:
    print("D")
case 40..<50:
    print("C")
case 50..<60:
    print("B")
case 60..<70:
    print("A-")
case 70..<80:
    print("A")
case 80...100:
    print("A+")
default:
    print("Number out of range")
}

let coordinate = (0,8)

switch coordinate{
case (let x, 0):
    print("x(\(x)) is not 0")
case (0, let y):
    print("y(\(y)) is not 0")
case (_, _):
    print("both x and y are not 0")

}

//where
let point = (4 , 4)
switch point{

case (let x, let y) where x > y :
    print("x is greater than y")
case (let x, let y) where x < y :
    print("y is greater than x")
default:
    print("x==y")
}


//compound

var char = "a"
switch char{
case "a","A":
    print("The letter is a")
case "b","B":
    print("it is b")
default:
    print("neither a nor b")
}

//fallthrough
//match the next one

var ch = "A"
switch ch{
case "a","A":
    print("letter is a")
    fallthrough
case "b","B":
    print("it is b")
    fallthrough
case "c","C":
    print("it is c")
default:
    print("neither a nor b")
}
