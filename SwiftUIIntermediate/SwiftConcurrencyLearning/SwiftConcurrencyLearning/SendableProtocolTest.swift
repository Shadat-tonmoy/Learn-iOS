//
//  SendableProtocolTest.swift
//  SwiftConcurrencyLearning
//
//  Created by Shadat Tonmoy on 7/28/23.
//

import SwiftUI


actor DataManagerSendable {
    
    static let instance = DataManagerSendable()
    
    private init(){
        
    }
    
    func getData() -> String {
        return "My Test String From Data Manager"
    }
    
    func updateData(userData : UserData) {
        
        
    }
    
}

struct UserData : Sendable {
    
    let name : String
    
}

final class UserDataClass : @unchecked Sendable {
    
    var name : String
    
    let queue = DispatchQueue(label: "com.learning.sendableProtocol")
    
    init(name: String) {
        self.name = name
    }
    
    func updateName(name : String) {
        queue.async {
            self.name = name
        }
        
    }
}

class SendableProtocolViewModel : ObservableObject {
    
    let dataManager = DataManagerSendable.instance
    
    func getData() async -> String {
        
        return await dataManager.getData()
        
    }
    
    func updateData() async {
        await dataManager.updateData(userData: UserData(name: "Name"))
    }
    
}


struct SendableProtocolTest: View {
    
    @StateObject private var viewModel : SendableProtocolViewModel = SendableProtocolViewModel()
    
    @State private var text = "Hello World!"
    
    var body: some View {
        VStack {
            Text(text)
            
            Button("Update Data", action: {
                Task {
                    await viewModel.updateData()
                }
                
            })
            .padding()
        }
        .task {
            text = await viewModel.getData()
            
        }
    }
}

struct SendableProtocolTest_Previews: PreviewProvider {
    static var previews: some View {
        SendableProtocolTest()
    }
}
