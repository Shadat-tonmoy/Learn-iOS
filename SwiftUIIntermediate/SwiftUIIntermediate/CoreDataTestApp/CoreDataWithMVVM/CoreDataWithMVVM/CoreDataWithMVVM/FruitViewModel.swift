//
//  FruitViewModel.swift
//  CoreDataWithMVVM
//
//  Created by Shadat Tonmoy on 5/6/23.
//

import SwiftUI
import CoreData

class FruitViewModel : ObservableObject {
    
    let container : NSPersistentContainer
    
    @Published var fruitList : [Fruit] = []
    
    init(){
        container = NSPersistentContainer(name: "CoreDataWithMVVM")
        container.loadPersistentStores(completionHandler:  { (description, error) in
            if let error = error {
                print("Error is core data : \(error)")
            } else {
                print("Successfully Loaded CoreData")
            }
            
        })
    }
    
    func fetchFruits() {
        
        let request = NSFetchRequest<Fruit>(entityName: "Fruit")
        
        do {
            fruitList = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching data : \(error)")
        }
    }
    
    func addFruit(fruitName : String) {
        let newFruit = Fruit(context: container.viewContext)
        newFruit.name = fruitName
        newFruit.created_at = Date()
        saveData()
    }
    
    func deleteFruit(indexSet : IndexSet){
        guard let index = indexSet.first else { return }
        let fruitAtIndex = fruitList[index]
        container.viewContext.delete(fruitAtIndex)
        saveData()
    }
    
    func updateSelectedFruit(fruit : Fruit, newName : String) {
        fruit.name = newName
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error saving... \(error)")
        }
    }
    
}
