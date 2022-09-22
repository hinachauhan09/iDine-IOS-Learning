//
//  ItemDetails.swift
//  iDine
//
//  Created by Hina Chauhan on 19/09/22.
//

import SwiftUI

struct ItemDetails: View {
    @EnvironmentObject var order : Order
    let item : MenuItem
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .scaledToFit()
                    
                Text("Photo : \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                .font(.caption)
                    .foregroundColor(.white)
                    .offset(x:-5,y:-5)
                    
            }
            Text(item.description)
                .padding()
            Button("Order this"){
                order.add(item: item)
            }
            .font(.headline)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ItemDetails(item : MenuItem.example).environmentObject(Order())
        }
    }
}
