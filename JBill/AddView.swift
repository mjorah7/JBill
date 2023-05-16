//
//  AddView.swift
//  JBill
//
//  Created by Jorah on 2023/1/18.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var userData: Database
    
    @Environment(\.presentationMode) var presenation
    
    @State var title: String = ""
    
    @State var time: Date = Date()
    
    @State var cost:String = ""
    
    @State var type: String = ItemType.DEFAULT
    
    var barTitle: String = "unkonwn"
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("things")){
                    TextField("title", text: self.$title)
                    DatePicker(selection: self.$time, label: {Text("Time")})
                    TextField("cost", text: self.$cost)
                }
                
                Section(header: Text("options")) {
                    Button(action: {//confirm
                        if let c: Double = Double(cost){
                            if barTitle == "Income" {
                                userData.add(data: Item(title: title, time: time, cost: c, type: type, id: 0))
                            }
                            if barTitle == "Outcome" {
                                userData.add(data: Item(title: title, time: time, cost: (-1) * c, type: type, id: 0))
                            }
                        }
                        
                        self.presenation.wrappedValue.dismiss()
                    }){
                        Text("confirm")
                    }
                }
                
                Section(header: Text("cancel")) {
                    Button(action: {//cancel
                        self.presenation.wrappedValue.dismiss()
                    }){
                        Text("cancel")
                    }
                }
            }
            .navigationBarTitle(Text(barTitle))
        }
    }
}


//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddView()
//    }
//}
