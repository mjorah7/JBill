//
//  ContentView.swift
//  JBill
//
//  Created by Jorah on 2023/1/18.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userData: Database = Database(data: initUsrData())
    
    @State var showIncomePage: Bool = false
    
    @State var showOutcomePage: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack {
                ScrollView(.vertical, showsIndicators: true){
                    HStack {
                        Text("Summary")
                        Spacer()
                    }
                    .font(.title)
                    .padding(.leading)
                    .padding(.top)
                    .padding(.top)
                    
                    Rectangle()
                        .frame(height: 3)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                    
                    HStack {
                        Text("Blance")
                        Spacer()
                        Text(String(format: "%.2f", userData.totalSum))
                    }
                    .padding(.horizontal)
                    .font(.title2)
                    HStack {
                        Text("Total Income")
                        Spacer()
                        Text(String(format: "%.2f", userData.totalIncome))
                    }
                    .padding(.horizontal)
                    .font(.title2)
                    HStack {
                        Text("Total Outcome")
                        Spacer()
                        Text(String(format: "%.2f", userData.totalOutcome))
                    }
                    .padding(.horizontal)
                    .font(.title2)
                    
                    HStack {
                        Text("Details")
                        Spacer()
                    }
                    .font(.title)
                    .padding(.leading)
                    .padding(.top)
                    .padding(.top)
                    
                    Rectangle()
                        .frame(height: 3)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                    
                    VStack {
                        ForEach(userData.list){
                            item in
                            CardView(index: item.id)
                        }
                        .environmentObject(userData)
                    }
                    .padding(.horizontal)
                }
                
                //添加图标
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Spacer()
                        Button(action: {
                            self.showOutcomePage = true
                        }){
                            Image(systemName: "minus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                                .foregroundColor(.green)
                                .padding(.trailing)
                        }
                        .sheet(isPresented: self.$showOutcomePage, content: {
                            AddView(barTitle: "Outcome")
                                .environmentObject(self.userData)
                        })
                        Button(action: {
                            self.showIncomePage = true
                        }){
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                                .foregroundColor(.red)
                                .padding(.trailing)
                        }
                        .sheet(isPresented: self.$showIncomePage, content: {
                            AddView(barTitle: "Income")
                                .environmentObject(self.userData)
                        })
                    }
                }
                .navigationBarTitle(Text("JBill"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
