//
//  SwiftUIList.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/26/23.
//

import SwiftUI

struct SwiftUIList: View {
    @State var fruits : [String] = ["Apple", "Banana", "Orange", "Peach", "Pineapple", "Grape"]
    
    @State var vegetables : [String] = ["Brinjal", "Carrot", "Ladies Finger", "Cucumber", "Tomato", "Potato"]
    
    var body: some View {
        NavigationView {
            List{
                FruitSection(fruits: $fruits)
                VegetableSection(vegetables: $vegetables)
            }
            .navigationTitle("Grocery List")
            .navigationBarItems(leading: EditButton(),
                                trailing: Button("Add", action : {
                fruits.append("Coconts")
                
                                })
            )
            .listStyle(.insetGrouped)
                    }
        .accentColor(.purple)
    }
    
    
}

struct SwiftUIList_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIList()
    }
}

struct FruitSection: View {
    
    @Binding var fruits : [String]
    
    var body: some View {
        Section(content: {
            ForEach(fruits, id: \.self, content: { fruit in
                Text(fruit)
                    .font(.body)
                    .padding(.vertical, 8)
                    
                    .foregroundColor(.white)
            }).onDelete(perform: { index in
                removeFruit(index: index)
            })
            .onMove(perform: moveFruit)
            .listRowBackground(Color.green)
        }, header: {
            Text("Fruits")
                .font(.headline)
            
        })
    }
    
    func moveFruit(indices : IndexSet, newOffset : Int){
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    
    func removeFruit(index : IndexSet){
        fruits.remove(atOffsets: index)
    }
}


struct VegetableSection : View{
    
    @Binding var vegetables : [String]
    
    var body: some View{
        
        Section(content: {
            ForEach(vegetables, id: \.self, content: { vegetable in
                Text(vegetable)
            })
            .onDelete(perform: { indexSet in
                removeVegetable(index: indexSet)
                
            })
            .onMove(perform: { indexSet, newOffSet in
                moveVegetables(indices: indexSet, newOffset: newOffSet)
            })
        }, header: {
            Text("Vegetables")
                .font(.headline)
            
        })
        
    }
    
    func moveVegetables(indices : IndexSet, newOffset : Int){
        vegetables.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    
    func removeVegetable(index : IndexSet){
        vegetables.remove(atOffsets: index)
    }
}
