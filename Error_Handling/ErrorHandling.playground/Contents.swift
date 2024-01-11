import Cocoa
import Foundation

//throws error when certain conditions are not meet.
//example empty userName in registration form is not accepted.

//create a custom error enum which conforms built in Error protocol

enum RegistrationFormError: Error{
    case emptyUserName
    case passwordTooShort
    case emptyPassword
    case emptyEmail
    case invalidEmail
    //may be more cases
}

func formValidation(userName: String, password: String, email: String) throws{
    if userName.count == 0{
        throw RegistrationFormError.emptyUserName
    }
    
    if password.count == 0{
        throw RegistrationFormError.emptyEmail
    }else if password.count <= 6{
        throw RegistrationFormError.passwordTooShort
    }
    
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    if email.count == 0{
        throw RegistrationFormError.emptyEmail
    }
    
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    if !emailPred.evaluate(with: email){
        throw RegistrationFormError.invalidEmail
    }
    
}

//error handling
//do catch
//catch block is like switch

let email: String = "shameem105455@gmail.com"
let userName: String = "adfasdfasd"
let password: String = "d"

do{
    //defer will run after all the code finishes running
    defer{
        print("Try Again")
    }
    try formValidation(userName: userName, password: password, email: email)
    print("Validate successfull")
    //if error is thrown then the lines after try will not execute
    //it can be solved using defer
    
}catch {
    let error = error
    switch error{
    case RegistrationFormError.emptyUserName:
        print("User Name can't be empty")
        break
    case RegistrationFormError.emptyPassword:
        print("Password can't be empty")
        break
    case RegistrationFormError.emptyEmail:
        print("Email can't be empty")
        break
    case RegistrationFormError.passwordTooShort:
        print("Password Too Short")
        break
    case RegistrationFormError.invalidEmail:
        print("Invalid Email")
        break
    default:
        print(error)
    }
}

func someThrowingFunction() throws -> Int {
    // ...
    throw RegistrationFormError.invalidEmail
   // return 3
}

//try?
//if error occurs then x will be nil
let x = try? someThrowingFunction()
print(x)

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    print("y is nil")
    y = nil
}

//try!
//sure that no error will be thrown
func loadImage(path: String){
    
}

let image = try! loadImage(path: "/path/image.jpg")
