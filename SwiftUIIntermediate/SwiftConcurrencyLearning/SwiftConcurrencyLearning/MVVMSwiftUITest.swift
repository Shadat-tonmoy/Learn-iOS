//
//  MVVMSwiftUITest.swift
//  SwiftConcurrencyLearning
//
//  Created by Shadat Tonmoy on 8/1/23.
//

import SwiftUI

final class MVVMDataManager {
    
    func getData() async throws -> String {
        return "Test Data From Data Manager at \(Date())"
    }
    
}

final actor MVVMDataActor {
    
    func getData() async -> String {
        return "Test Data From Data Actor"
    }
}


final class MVVMTestViewModel : ObservableObject {
    
    private var dataManager = MVVMDataManager()
    private var dataActor = MVVMDataActor()
    @Published var text = "Hello World"
    private var tasks : [Task<Void, Never>] = []
    
    func getData() {
        Task { [weak self] in
            if let data = try? await self?.dataManager.getData() {
                self?.text = data
            }
        }
    }
    
    func getDataCancellable() {
        let task = Task {
            if let data = try? await dataManager.getData() {
                text = data
            }
        }
        tasks.append(task)
        
    }
    
    func cancelTasks(){
        tasks.forEach{
            $0.cancel()
        }
        tasks = []
    }
    
}



struct MVVMSwiftUITest: View {
    
    @StateObject private var viewModel : MVVMTestViewModel = MVVMTestViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.text)
        }
        .onAppear {
            viewModel.getDataCancellable()
        }
        .onDisappear {
            viewModel.cancelTasks()
        }
        
    }
}

struct MVVMSwiftUITest_Previews: PreviewProvider {
    static var previews: some View {
        MVVMSwiftUITest()
    }
}
