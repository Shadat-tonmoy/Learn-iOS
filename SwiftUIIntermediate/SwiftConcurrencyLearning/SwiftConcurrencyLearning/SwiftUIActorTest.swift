//
//  SwiftUIActorTest.swift
//  SwiftConcurrencyLearning
//
//  Created by Shadat Tonmoy on 7/27/23.
//

import SwiftUI

struct Screen1View : View {
    
    var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var text = "This is screen 1"
    
    private var dataManager = DataManager.instance
    
    private var dataManagerActor = DataManagerActor.instance
    
    var body: some View {
        VStack {
            Text(text)
        }
        .onReceive(timer, perform: { value in
//            if let randomText = dataManager.getRandomData() {
//                self.text = randomText
//            }
            Task {
                if let randomText = await dataManagerActor.getRandomData() {
                    await MainActor.run {
                        self.text = randomText
                    }
                    
                }
            }
            
        })
        
    }
}

struct Screen2View : View {
    
    var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var text = "This is screen 2"
    
    private var dataManager = DataManager.instance
    
    private var dataManagerActor = DataManagerActor.instance
    
    var body: some View {
        VStack {
            Text(text)
        }
        .onReceive(timer, perform: { _ in
            
//            if let randomText = dataManager.getRandomData() {
//                self.text = randomText
//            }
            
            Task {
                if let randomText = await dataManagerActor.getRandomData() {
                    await MainActor.run {
                        self.text = randomText
                    }
                }
            }
            
        })
    }
}

class DataManager {
    
    static let instance = DataManager()
    
    private init(){}
    
    private var data : [String] = []
    
    
    func getRandomData() -> String? {
        
        data.append(UUID().uuidString)
        
        return data.randomElement()
    }
    
    
}


actor DataManagerActor {
    
    static let instance = DataManagerActor()
    
    private init(){}
    
    private var data : [String] = []
    
    
    func getRandomData() async -> String? {
        
        data.append(UUID().uuidString)
        
        return data.randomElement()
    }
    
    
}


struct SwiftUIActorTest: View {
    
    var body: some View {
        TabView{
            Screen1View()
                .tabItem{
                    Label("Screen 1", systemImage: "house.fill")
                }
            
            Screen2View()
                .tabItem{
                    Label("Screen 2", systemImage: "magnifyingglass")
                }
        }
    }
}



struct SwiftUIActorTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIActorTest()
    }
}
