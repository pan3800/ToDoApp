import UIKit

//1. 여러개의 인자 넘기기 - Tuple1
func convertImage(item: String) -> (String, String) {
    let image = "image"
    let uiImage = "uiImage"
    return (image, uiImage)
}

let result = convertImage(item: "item")
let image = result.0
let uiImage = result.1

//2. 여러개의 인자 넘기기 - Tuple2
func convertImage2(item: String) -> (image: String, uiImage: String) {
    let image = "image"
    let uiImage = "uiImage"
    return (image, uiImage)
}

let result2 = convertImage2(item: "item")
let image2 = result2.image
let uiImage2 = result2.uiImage




//3. 여러개의 인자 넘기기 - 모델 만들기
func convertImage2(item: String) -> ImageSelection {
    let image = "image"
    let uiImage = "uiImage"
    
    let imageSelection = ImageSelection(image: image, uiImage: uiImage)
    
    return imageSelection
}

let result3 = convertImage3(item: "item")
let image3 = result3.image
let uiImage = result3.uiImage





