import UIKit


func calculate(){
    let score = Int.random(in: 0...100)
    if score == 100 {
        print("That's awsome. The score is 100")
    } else if score >= 50 && score <= 80 {
        print("The score is in mid range. The score is \(score)")
    } else {
        print("The score is in high range. The score is \(score)")
    }
}

func calculateUsingSwitch(){
    let score = Int.random(in: 0...100)
    switch score {
    case ...40 :
        print("Range is upto 40")
        break
    case 41...80 :
        print("Range is between 41 and 80")
        break
    case 81..<90 :
        print("Half sided range...81 to 90")
        break
    default :
        print("Default")
    }
}

calculate()
calculateUsingSwitch()

var userName : String? = nil
print(userName)

