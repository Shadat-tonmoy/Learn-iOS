//
//  StrongSelfTest.swift
//  SwiftConcurrencyLearning
//
//  Created by Shadat Tonmoy on 8/1/23.
//

import SwiftUI


class StrongSelfDataManager {
    
    func getData() async -> String {
        return "Test data from get data method"
        
    }
    
}

class StrongSelfViewModel : ObservableObject {
    
    @Published var text = "Hello World"
    
    private var dataManager = StrongSelfDataManager()
    
    func fetchData() {
        // accessing text with a strong reference of viewmodel class
        Task {
            text = await dataManager.getData()
        }
    }
    
    func fetchData2() {
        // accessing text with a strong reference of viewmodel class
        Task {
            self.text = await self.dataManager.getData()
        }
    }
    
    func fetchData3() {
        // accessing text with a strong reference of viewmodel class
        Task { [self] in
            self.text = await self.dataManager.getData()
        }
    }
    
    func fetchData4() {
        // accessing text with a weak reference of viewmodel class
        Task { [weak self] in
            if let data = await self?.dataManager.getData() {
                self?.text = data
            }
        }
    }
    
    
    
}

struct StrongSelfTest: View {
    
    @StateObject private var viewModel : StrongSelfViewModel = StrongSelfViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.text)
        }
        .onAppear {
            viewModel.fetchData4()
            
        }
    }
}

struct StrongSelfTest_Previews: PreviewProvider {
    static var previews: some View {
        StrongSelfTest()
    }
}
