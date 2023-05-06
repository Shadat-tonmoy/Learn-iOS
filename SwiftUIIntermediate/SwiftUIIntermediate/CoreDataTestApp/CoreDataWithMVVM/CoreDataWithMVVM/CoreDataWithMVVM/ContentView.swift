//
//  ContentView.swift
//  CoreDataWithMVVM
//
//  Created by Shadat Tonmoy on 5/6/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var fruitNameFieldValue : String = ""
    @State var selectedFruit : Fruit? = nil
    @State var fruitNameFieldState : NameFieldState = NameFieldState.NONE
    @StateObject var viewModel : FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack{
                
                if(fruitNameFieldState != NameFieldState.NONE) {
                    FruitNameFieldView(fruitNameFieldValue: $fruitNameFieldValue, selectedFruit: $selectedFruit, buttonClickListener: handleButtonClick)
                }
                
                FruitListView(fruitList: viewModel.fruitList, itemDelegate: self)
                
            }
            .toolbar {
                ToolbarItem(placement : .navigationBarTrailing) {
                    Button(action: showFruitNameFieldForAddItem) {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle("CoreData MVVM")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: {
            viewModel.fetchFruits()
        })
        
    }
    
    private func handleButtonClick(action : Int) {
        if (action == 2) {
            fruitNameFieldState = NameFieldState.NONE
            selectedFruit = nil
            fruitNameFieldValue = ""
        } else {
            if (selectedFruit != nil){
                updateSelectedFruit()
            } else {
                addItem()
            }
        }
        
    }
    
    private func showFruitNameFieldForAddItem(){
        selectedFruit = nil
        fruitNameFieldValue = ""
        fruitNameFieldState = NameFieldState.ADD
    }
    
    private func showFruitNameFieldForUpdateItem(fruit : Fruit){
        if let fruitName = fruit.name {
            fruitNameFieldValue = fruitName
        }
        selectedFruit = fruit
        fruitNameFieldState = NameFieldState.UPDATE
    }
    
    private func addItem() {
        withAnimation {
            viewModel.addFruit(fruitName: fruitNameFieldValue)
            resetField()
            
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            viewModel.deleteFruit(indexSet: offsets)
        }
    }
    
    private func updateSelectedFruit() {
        withAnimation{
            if let fruit = selectedFruit {
                viewModel.updateSelectedFruit(fruit: fruit, newName: fruitNameFieldValue)
                resetField()
            } else {
                print("Selected Fruit is null")
            }
        }
        
    }
    
    private func resetField(){
        fruitNameFieldValue = ""
        fruitNameFieldState = NameFieldState.NONE
    }
    
}

extension ContentView : FruitItemDelegate{
    
    func onFruitUpdate(fruit: Fruit?) {
        if let fruitToUpdate = fruit {
            selectedFruit = fruitToUpdate
            fruitNameFieldValue = fruitToUpdate.name!
            fruitNameFieldState = NameFieldState.UPDATE
        } 
    }
    
    func onFruitDelete(indexSet: IndexSet) {
        deleteItems(offsets: indexSet)
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
