//
//  CheckoutView.swift
//  iDine
//
//  Created by Hina Chauhan on 21/09/22.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order : Order
    let paymentTypes = ["Cash","Credit Card","iDine Points"]
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        VStack{
            Form{
                Section{
                    Picker("How do you want to pay?",selection: $paymentType){
                        ForEach(paymentTypes,id: \.self){
                            Text($0)
                        }
                    }
                    Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                    
                    if addLoyaltyDetails {
                        TextField("Enter your iDine ID", text: $loyaltyNumber)
                    }
                    
                    
                }
                Section(header: Text("Add a tip?")) {
                    Picker("Percentage:", selection: $tipAmount) {
                        ForEach(tipAmounts, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section(header : Text("Total : \(totalPrice)").font(.largeTitle)){
                    Button("Confirm Order"){
                        //place order
                        showingPaymentAlert.toggle()
                        
                    }
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert){
            Alert(title: Text("Order Confirmed"),
                  message: Text("Your Order Total is \(totalPrice) \nThank you for placing the order"),
                  dismissButton: .default(Text("OK"))
                  {
                order.items.removeAll()
                
            }
            )
        }
        
        
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
