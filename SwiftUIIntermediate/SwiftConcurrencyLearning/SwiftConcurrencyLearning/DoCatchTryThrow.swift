//
//  DoCatchTryThrow.swift
//  SwiftConcurrencyLearning
//
//  Created by Shadat Tonmoy on 7/16/23.
//

import SwiftUI


class DoCatchTryThrowDataManager {
    
    var isActive = true
    
    func fetchTitle() -> (title : String?, error : Error?) {
        if isActive {
            return ("New Title At : \(Date())", nil)
        } else {
            return (nil, URLError(.badURL))
        }
        
    }
    
    func fetchTitle2() -> Result<String, Error> {
        if isActive {
            return Result.success("New Title At : \(Date())")
        } else {
            return Result.failure(URLError(.badServerResponse))
        }
    }
    
    func fetchTitle3() throws -> String {
        if isActive {
            return "New Title At : \(Date())"
        } else {
            throw URLError(.badServerResponse)
        }
    }
}

class DoCatchTryThrowViewModel : ObservableObject {
    
    let dataManager = DoCatchTryThrowDataManager()
    
    @Published var title = ""
    
    func fetchTitle() {
        let response = dataManager.fetchTitle()
        if let newTitle = response.title {
            title = newTitle
        } else if let error = response.error {
            title = error.localizedDescription
        }
        
    }
    
    func fetchTitle2() {
        let response = dataManager.fetchTitle2()
        
        switch response {
            case .success(let newTitle) :
                self.title = newTitle
                
            case .failure(let error) :
                self.title = error.localizedDescription
        }
    }
    
    func fetchTitle3() {
        
        do {
            // try? means if this line fails code will set a nil value to the response and continue to execute from the next line
            
            // try means if this line fails code will immediately move to catch block without executing the next lines of codes
            if let response = try? dataManager.fetchTitle3() {
                print("FetchTitle3 Response : \(response)")
                self.title = response
            }
            
            if let response = try? dataManager.fetchTitle3() {
                print("FetchTitle3 Response 2 : \(response)")
            }
            
            
        } catch let error {
            self.title = error.localizedDescription
        }
    }
    
}

struct DoCatchTryThrow: View {
    
    @StateObject private var viewModel : DoCatchTryThrowViewModel = DoCatchTryThrowViewModel()
    
    var body: some View {
        Text(viewModel.title)
            .frame(width: 200, height: 200)
            .background(.blue)
            .foregroundColor(.white)
            .onTapGesture {
                viewModel.fetchTitle3()
                
            }
    }
}

struct DoCatchTryThrow_Previews: PreviewProvider {
    static var previews: some View {
        DoCatchTryThrow()
    }
}
