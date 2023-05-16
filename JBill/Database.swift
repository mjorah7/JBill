//
//  Database.swift
//  JBill
//
//  Created by Jorah on 2023/1/18.
//

import Foundation

var encoder = JSONEncoder()
var decoder = JSONDecoder()

func initUsrData() -> [Item]{
    formatter.dateFormat = "MM-dd HH:mm"
    
    var re: [Item] = []
    if let dataStored = UserDefaults.standard.object(forKey: "JBill1") as? Data {
        let data = try! decoder.decode([Item].self, from: dataStored)
        for item in data {
            re.append(Item(title: item.title, time: item.time, cost: item.cost, type: item.type, id: item.id))
        }
    }
    return re
}

class Database: ObservableObject {
    
    @Published var list: [Item]
    
    var totalSum: Double = 0
    
    var totalIncome: Double = 0
    
    var totalOutcome: Double = 0
    
    init() {
        list = []
        
        refresh()
    }
    
    init(data: [Item]) {
        list = []
        for item in data {
            list.append(Item(title: item.title, time: item.time, cost: item.cost, type: item.type, id: item.id))
        }
        
        refresh()
    }
    
    func add(data: Item) {
        list.append(Item(title: data.title, time: data.time, cost: data.cost, type: data.type, id: list.count))
        
        refresh()
    }
    
    func refresh() {
        sort()
        calc()
        storeData()
    }
    
    func calc() {
        totalSum = 0
        totalIncome = 0
        totalOutcome = 0
        for item in list {
            if item.cost > 0 {
                totalIncome += item.cost
            } else {
                totalOutcome -= item.cost
            }
            totalSum += item.cost
        }
    }
    
    func sort() {
        self.list.sort(by: {
            (data1, data2) in
            return data1.time.timeIntervalSince1970 > data2.time.timeIntervalSince1970
        })
        var i: Int = 0
        for item in list {
            item.id = i
            i += 1
        }
    }
    
    func storeData() {
        let dataStored = try! encoder.encode(self.list)
        UserDefaults.standard.set(dataStored, forKey: "JBill1")
    }
    
}
