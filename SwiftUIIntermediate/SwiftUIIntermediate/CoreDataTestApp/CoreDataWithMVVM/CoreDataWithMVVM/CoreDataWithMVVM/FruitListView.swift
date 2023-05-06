//
//  FruitListView.swift
//  CoreDataWithMVVM
//
//  Created by Shadat Tonmoy on 5/6/23.
//

import SwiftUI


protocol FruitItemDelegate {
    func onFruitUpdate(fruit : Fruit?)
    func onFruitDelete(indexSet : IndexSet)
}

struct FruitListView: View {
    
    let fruitList : [Fruit]
    let itemDelegate : FruitItemDelegate?
    
    var body: some View {
        List {
            ForEach(fruitList) { fruit in
                NavigationLink {
                    Text(fruit.name ?? "")
                } label: {
                    HStack{
                        Text(fruit.name ?? "")
                        Spacer()
                        Image(systemName: "pencil")
                            .padding(.horizontal)
                            .onTapGesture {
                                itemDelegate?.onFruitUpdate(fruit: fruit)
//                                showFruitNameFieldForUpdateItem(fruit: fruit)
                            }
                    }
                    
                }
            }
            .onDelete(perform: { indexSet in
                itemDelegate?.onFruitDelete(indexSet: indexSet)
                
            })
        }
        .listStyle(.plain)
    }
}

struct FruitListView_Previews: PreviewProvider {
    static var previews: some View {
        FruitListView(fruitList: [], itemDelegate: nil)
    }
}
