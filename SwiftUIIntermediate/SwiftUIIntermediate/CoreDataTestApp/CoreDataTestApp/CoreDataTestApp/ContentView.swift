//
//  ContentView.swift
//  CoreDataTestApp
//
//  Created by Shadat Tonmoy on 5/5/23.
//

import SwiftUI
import CoreData


enum NameFieldState{
    case NONE
    case ADD
    case UPDATE
}

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    //    @FetchRequest(
    //        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    //        animation: .default)
    //    private var items: FetchedResults<Item>
    
    @State var fruitNameFieldValue : String = ""
    @State var selectedFruit : Fruit? = nil
    @State var fruitNameFieldState : NameFieldState = NameFieldState.NONE
    
    @FetchRequest(
        entity: Fruit.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Fruit.timestamp, ascending: false)]) private var fruits : FetchedResults<Fruit>
    
    var body: some View {
        NavigationView {
            
            VStack{
                
                if(fruitNameFieldState == NameFieldState.NONE) {
                    
                } else {
                    FruitNameFieldView(fruitNameFieldValue: $fruitNameFieldValue, selectedFruit: $selectedFruit, buttonClickListener: handleButtonClick)
                }
                
                
                List {
                    ForEach(fruits) { fruit in
                        NavigationLink {
                            Text(fruit.name ?? "")
                        } label: {
                            HStack{
                                Text(fruit.name ?? "")
                                Spacer()
                                Image(systemName: "pencil")
                                    .padding(.horizontal)
                                    .onTapGesture {
                                        showFruitNameFieldForUpdateItem(fruit: fruit)
                                    }
                            }
                            
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(.plain)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement : .navigationBarLeading) {
                    Button(action: showFruitNameFieldForAddItem) {
                        HStack{
                            Image(systemName: "plus")
                            Text("Add Item")
                        }
                    }
                }
            }
            .navigationTitle("CoreData Test App")
            //            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    private func handleButtonClick() {
        if (selectedFruit != nil){
            updateSelectedFruit()
        } else {
            addItem()
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
            //            let newItem = Item(context: viewContext)
            //            newItem.timestamp = Date()
            
            let newFruit = Fruit(context: viewContext)
            newFruit.name = fruitNameFieldValue
            newFruit.timestamp = Date()
            save()
            fruitNameFieldValue = ""
            fruitNameFieldState = NameFieldState.NONE
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            //            offsets.map { items[$0] }.forEach(viewContext.delete)
            //            offsets.map { fruits[$0]}.forEach(viewContext.delete)
            guard let index = offsets.first else { return }
            
            let fruit = fruits[index]
            viewContext.delete(fruit)
            save()
        }
    }
    
    private func updateSelectedFruit() {
        withAnimation{
            if (selectedFruit != nil) {
                selectedFruit?.name = fruitNameFieldValue
            }
            save()
            fruitNameFieldValue = ""
            fruitNameFieldState = NameFieldState.NONE
        }
        
    }
    
    private func save() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}



struct FruitNameFieldView: View {
    
    @Binding var fruitNameFieldValue : String
    @Binding var selectedFruit : Fruit?
    var buttonClickListener : () -> Void
    
    var body: some View {
        
        VStack{
            TextField("Enter Fruit Name Here", text: $fruitNameFieldValue)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.gray.opacity(0.2))
                )
                .padding(.horizontal)
            
            Button(selectedFruit != nil ? "Update Fruit" : "Add Fruits", action: {
                buttonClickListener()
                
            })
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.blue)
                
            )
            .foregroundColor(.white)
            .padding(.horizontal)
            
        }
        
    }
}
