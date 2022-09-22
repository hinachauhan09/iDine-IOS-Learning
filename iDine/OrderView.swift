//
//  OrderView.swift
//  iDine
//
//  Created by Hina Chauhan on 19/09/22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items){item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItems)
                    
                }
                Section{
                    NavigationLink(destination: CheckoutView()){
                        Text("Place Order")
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .listStyle(.insetGrouped)
            .toolbar{
                EditButton()
            }
        }
    }
    func deleteItems(at offset : IndexSet) {
        order.items.remove(atOffsets: offset)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
