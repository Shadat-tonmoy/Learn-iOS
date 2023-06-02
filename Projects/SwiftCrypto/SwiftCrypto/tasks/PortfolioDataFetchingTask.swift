//
//  PortfolioDataFetchingTask.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 6/2/23.
//

import Foundation
import CoreData

class PortfolioDataFetchingTask{
    
    private let container : NSPersistentContainer
    private let containerName : String = "PortfolioContainer"
    private let portfolioEntityName : String = "PortfolioEntity"
    
    @Published var savedEntities : [PortfolioEntity] = []
    
    init(){
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores(completionHandler: { _, error in
            if let loadError = error {
                print("Error loading persitent stores. Error : \(loadError)")
            }
            
            self.getPortfolioEntity()
            
        })
    }
    
    // MARK: public sections
    
    func updatePortfolio(coin : CoinModel, amount : Double){
        if let savedEntitiy = savedEntities.first(where: { entity in
            entity.id == coin.id
        }) {
            if amount > 0 {
                update(entity: savedEntitiy, amount: amount)
            } else {
                delete(entity: savedEntitiy)
            }
            
        } else {
            add(coinModel: coin, amount: amount)
        }
    }
    
    
    // MARK: private sections
    
    private func getPortfolioEntity() {
        let fetchRequest = NSFetchRequest<PortfolioEntity>(entityName: portfolioEntityName)
        
        do {
            savedEntities = try container.viewContext.fetch(fetchRequest)
        } catch let error {
            print("Error fetching portfolio entities. Error : \(error)")
        }
    }
    
    private func add(coinModel : CoinModel, amount : Double){
        let portfolioEntitiy = PortfolioEntity(context: container.viewContext)
        portfolioEntitiy.id = coinModel.id
        portfolioEntitiy.quantity = amount
        applyChanges()
    }
    
    private func update(entity : PortfolioEntity, amount : Double){
        entity.quantity = amount
        applyChanges()
    }
    
    private func delete(entity : PortfolioEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save(){
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving data to portfolio container. Error : \(error)")
        }
    }
    
    private func applyChanges(){
        save()
        getPortfolioEntity()
    }
}
