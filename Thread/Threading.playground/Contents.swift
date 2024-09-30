import UIKit

// serial + async - ordered
// serial + sync - ordered
// concurrent + sync - ordered
// concurrent + async - unordered


let mySerialQueue = DispatchQueue(label: "My.serial.queue")

//mySerialQueue.sync {
//    print("thread 1 start")
//    for i in 0...3{
//        print(i)
//    }
//    print("thread 1 end")
//}
//
//mySerialQueue.sync {
//    print("thread 2 starts")
//    for i in 0...3{
//        print(i)
//    }
//    print("thread 2 end")
//}

mySerialQueue.async {
    print("async thread 1 start")
    for i in 0...3{
        print(i)
    }
    print("async thread 1 end")
}

mySerialQueue.async {
    print("async thread 2 starts")
    for i in 0...3{
        print(i)
    }
    print("async thread 2 end")
}

let myConcurrentQueue = DispatchQueue(label: "My.concurrent.queue",
                                      attributes: .concurrent)

//myConcurrentQueue.sync {
//    print("concurent-sync thread 1 start")
//    for i in 0...3{
//        print("form 1 concurrent-sync =\(i)")
//    }
//    print("concurrent-sync thread 1 end")
//}
//
//myConcurrentQueue.sync {
//    print("concurrent-sync thread 2 starts")
//    for i in 0...3{
//        print("form 2 concurrent-sync =\(i)")
//    }
//    print("concurrent-sync thread 2 end")
//}

myConcurrentQueue.async {
    print("concurent-async thread 1 start")
    for i in 0...10{
        print("form 1 concurrent-sync =\(i)")
    }
    print("concurrent-async thread 1 end")
}

myConcurrentQueue.async {
    print("concurrent-async thread 2 starts")
    for i in 0...10{
        print("form 2 concurrent-sync =\(i)")
    }
    print("concurrent-async thread 2 end")
}
