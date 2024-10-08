import UIKit

//extension Date {
//    func relativeTimeString() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy년 M월 d일"
//        return dateFormatter.string(from: self)
//    }
//}


//let nowDate = Date()
//print(nowDate.description)
//
//print(nowDate.relativeTimeString())

//M: 1~12
//MM: 01, 12
//MMM: Jan, Feb
//MMMM: January
//d: 1, 31
//m: 0~59
//mm: 00, 01
//D: 그해의 몇번째 날인지 1~365(366)

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"     //예: 2023-03-17
dateFormatter.dateFormat = "MMM d, yyyy"    //예: Mar 17, 2023
dateFormatter.dateFormat = "MMMM d, yyyy"   //예: March 17, 2023
dateFormatter.dateFormat = "HH:mm"          //예: 15:24 (시간과 분)
dateFormatter.dateFormat = "yyyy D"         //예: 2023 76 (연중 76일째)


