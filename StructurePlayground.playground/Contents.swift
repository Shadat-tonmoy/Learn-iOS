import UIKit

struct User {
    
    init(firstName : String, lastName : String, city : String, country : String, email : String) {
        self.firstName = firstName
        self.lastName = lastName
        self.city = city
        self.country = country
        self.email = email
        
    }
    var firstName : String
    var lastName : String
    var city : String
    var country : String
    var email : String
    
    func printInformation(){
        print("First Name : \(firstName), Last Name : \(lastName), City : \(city), Country : \(country), Email : \(email)")
    }
    
}

var user = User(firstName: "Shadat",lastName: "Tonmoy",city: "Sherpur",country: "Bangladesh",email: "shadat.tonmoy@gmail.com")
user.printInformation()
print("user first name is \(user.firstName)")
