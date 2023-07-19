//
//  AsyncAwaitTest.swift
//  SwiftConcurrencyLearning
//
//  Created by Shadat Tonmoy on 7/18/23.
//

import SwiftUI


class AsyncAwaitTestViewModel : ObservableObject {
    
    @Published var data : [String] = []
    
    func addTitle1() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.data.append("New Title From Thread : \(Thread.current)")
        })
        
    }
    
    func addTitle2() {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2, execute: {
            self.data.append("New Title 2 From Thread : \(Thread.current)")
            
            DispatchQueue.main.async {
                self.data.append("New Title 3 From Thread : \(Thread.current)")
            }
            
        })
    }
    
    func addTitle3() async {
        
        self.data.append("New Title 3 Before Sleep")
        
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        await MainActor.run {
            self.data.append("New Title 4 From Thread : Async thread : \(Thread.current)")
        }
        
        
    }
    
}

struct AsyncAwaitTest: View {
    
    @StateObject private var viewModel = AsyncAwaitTestViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.data, id: \.self, content: { data in
                Text(data)
                
            })
        }
        .onAppear {
//            viewModel.addTitle1()
//            viewModel.addTitle2()
        }
        .task {
            await viewModel.addTitle3()
        }
    }
}

struct AsyncAwaitTest_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwaitTest()
    }
}
