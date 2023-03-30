//
//  SwiftUIViewModel.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/31/23.
//

import SwiftUI

struct FruitModel : Identifiable {
    let id : String = UUID().uuidString
    let name : String
    let count : Int
}

class FruitsViewModel : ObservableObject{
    
    @Published var fruits : [FruitModel] = []
    @Published var isLoading : Bool = false
    
    init(){
        getFruits()
    }
    
    func moveItem(indexSet : IndexSet, newIndex : Int){
        fruits.move(fromOffsets: indexSet, toOffset: newIndex)
    }
    
    func deleteFruit(indexSet : IndexSet){
        fruits.remove(atOffsets: indexSet)
    }
    
    func getFruits(){
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.fruits.append(FruitModel(name: "Apple", count: 6))
            self.fruits.append(FruitModel(name: "Guava", count: 8))
            self.fruits.append(FruitModel(name: "Watermelon", count: 9))
            self.fruits.append(FruitModel(name: "Orange", count: 3))
            self.fruits.append(FruitModel(name: "Pineapple", count: 16))
            self.fruits.append(FruitModel(name: "Mango", count: 44))
            self.fruits.append(FruitModel(name: "Black Berry", count: 23))
            self.isLoading = false
            
        })
        
    }
    
}

struct SwiftUIViewModel: View {
    
//    @State var fruits : [FruitModel] = []
//    @ObservedObject var viewModel : FruitsViewModel = FruitsViewModel()
    @StateObject var viewModel : FruitsViewModel = FruitsViewModel()
    
    var body: some View {
        NavigationView{
            
            ZStack {
                List{
                    ForEach(viewModel.fruits, content: { fruit in
                        NavigationLink(destination : FruitDetails(fruit: fruit)) {
                            HStack{
                                
                                Text(fruit.name)
                                
                                Spacer()
                                
                                Text("\(fruit.count)")
                                    .padding(4)
                                    .padding(.horizontal,8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.green)
                                            
                                    )
                                    .foregroundColor(.white)
                            }
                        }
                    })
                    .onDelete(perform: { indexSet in
                        viewModel.deleteFruit(indexSet: indexSet)
                    })
                    .onMove(perform: { indexSet, newIndex in
                        viewModel.moveItem(indexSet: indexSet, newIndex: newIndex)
                        
                    })
                }
                .navigationTitle("Fruit List")
                .listStyle(.automatic)
                
                if(viewModel.isLoading){
                    VStack(spacing : 15) {
                        ProgressView()
                        Text("Please wait while fetching data! This may take a while")
                    }
                }
            }
            
            
        }
//        .onAppear{
//            viewModel.getFruits()
//        }
    }
    
    
}

struct FruitDetails : View {
    
    let fruit : FruitModel
    
    var body: some View{
        NavigationView{
            ZStack{
                VStack{
                    VStack {
                        Text("\(fruit.count)")
                            .font(.custom("", size: 40))
                            .foregroundColor(.white)
                        
                        Text("\(fruit.name)")
                            .font(.custom("", size: 50))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .padding(.vertical,50)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.green)
                            
                    )
                    .padding()
                    .padding(.horizontal)
                    Spacer()
                        
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
        
    }
}

struct SwiftUIViewModel_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewModel()
//        FruitDetails(fruit: FruitModel(name: "Apple", count: 60))
    }
}
