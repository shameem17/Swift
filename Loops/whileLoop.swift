
//while loop


/// syntax
/// while(condition is true){
///     statement
///     }

var randomNumber = 2

while(randomNumber % 2 == 0){
  
    randomNumber = Int.random(in: 1...100)
    print(randomNumber)
}

//repead while

///syntax
/// repeat{
/// statement;
/// }
/// while (condition is true)

repeat{
    print("repeating=",randomNumber)
}while(randomNumber%2==0)
