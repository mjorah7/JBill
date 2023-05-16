//
//  Item.swift
//  JBill
//
//  Created by Jorah on 2023/1/18.
//

import Foundation

class Item: Decodable, Encodable, Identifiable {
    
    var title: String = ""
    
    var time: Date = Date()
    
    //cost > 0 --> income
    //cost < 0 --> outcome
    var cost: Double = 0.0
    
    var type: String = ItemType.DEFAULT
    
    var id: Int = 0;
    
    var isDeleted: Bool = false
    
    init(title: String, time: Date, cost: Double, type: String, id: Int) {
        self.title = title
        self.time = time
        self.cost = cost
        self.type = type
        self.id = id
    }
    
    func getIcon() -> String? {
        return ItemType.getItemTypeIcon(itemType: type)
    }
    
    func isIncome() -> Bool {
        return cost > 0
    }
    
}
