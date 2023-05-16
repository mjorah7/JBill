//
//  Type.swift
//  JBill
//
//  Created by Jorah on 2023/1/18.
//

import Foundation

class ItemType {
    
    public static var DEFAULT: String = "Default"
    
    public static var FOOD: String = "Food"
    
    public static var ENTERTAINMENT: String = "Entertainment"
    
    public static var ACADEMY: String = "Academy"
    
    public static var AMENDMENT: String = "Amendment"
    
    public static func getItemTypeIcon(itemType: String) -> String? {
        if itemType == ItemType.DEFAULT {
            return "d.circle.fill"
        }
        if itemType == ItemType.FOOD {
            return "fork.knife.circle.fill"
        }
        if itemType == ItemType.ENTERTAINMENT {
            return "gamecontroller.fill"
        }
        if itemType == ItemType.ACADEMY {
            return "book.fill"
        }
        if itemType == ItemType.AMENDMENT {
            return "gearshape.fill"
        }
        return nil
    }
    
}
