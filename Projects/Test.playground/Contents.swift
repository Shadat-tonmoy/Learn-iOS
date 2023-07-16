import UIKit

var greeting = "Hello, playground"
func getFileExtension(fileTitle : String) -> String {
    let dotIndex = fileTitle.distance(from: fileTitle.startIndex, to: fileTitle.lastIndex(of: ".") ?? fileTitle.startIndex)
    let index = fileTitle.lastIndex(of: ".")
    if(dotIndex > 0 && index != nil){
        print("Dot Index : \(dotIndex), index : \(index)")
        let fileExtension = String(fileTitle[index!...])
        return fileExtension
    } else {
        return ""
    }
}


var extensions = getFileExtension(fileTitle : "test.mp4")
