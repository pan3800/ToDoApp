import UIKit

//print("시작")
//print("1.쓰레드:", Thread.current)
//
//Task {
//    print("2.쓰레드:", Thread.current)
//    var number = 0
//    for i in 0...200000 {
//        number += i
//    }
//    print("결과:", number)
//}
//
//print("끝")
//print("3.쓰레드:", Thread.current)

Task {
    print("시작")
    await Task.sleep(2_000_000_000)
    print("끝")
}
