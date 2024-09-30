import UIKit


//value type

struct Document{
    var text: String
    
    func display(){
        print("the text in the doc is:\n\(self.text)")
    }
}

let myDoc = Document(text: "this is my doc")
var friendsDoc = myDoc
friendsDoc.text = "my friend change the doc"
myDoc.display()
friendsDoc.display()

class Documents{
    var text: String
    init(text: String) {
        self.text = text
    }
    func display(){
        print("the text in the doc is:\n\(self.text)")
    }
}

var doc = Documents(text: "this is doc1")


var copyDoc = doc
copyDoc.text = "this is doc 2"

doc.display()
copyDoc.display()
