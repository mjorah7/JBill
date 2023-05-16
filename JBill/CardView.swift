//
//  CardView.swift
//  JBill
//
//  Created by Jorah on 2023/1/18.
//

import SwiftUI

var formatter = DateFormatter()

struct CardView: View {
    
    @EnvironmentObject var userData: Database
    
    var index: Int
    
    var body: some View {
        
        HStack {
            Rectangle()
                .frame(width: 10)
                .foregroundColor(!userData.list[index].isIncome() ? .green : .red)
            
            Image(systemName: userData.list[index].getIcon()!)
                .font(.largeTitle)
                .padding(.horizontal)
                .foregroundColor(!userData.list[index].isIncome() ? .green : .red)
            
            VStack {
                HStack {
                    Text(userData.list[index].title)
                        .font(.title3)
                        .foregroundColor(.black)
                    Spacer()
                }
                HStack {
                    Text(formatter.string(from: userData.list[index].time))
                        .foregroundColor(.black)
                    Spacer()
                }
            }
            
            Spacer()
            
            Text(String(format: "%.2f", abs(userData.list[index].cost)))
                .padding(.trailing)
                .font(.title2)
                .foregroundColor(!userData.list[index].isIncome() ? .green : .red)
        }
        .frame(height: 60)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10, x:0, y:10)
        
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
