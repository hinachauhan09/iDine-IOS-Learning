//
//  ContentView.swift
//  iDine
//
//  Created by Hina Chauhan on 16/09/22.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(menu){ section in
                    //                    Text(section.name)
                    Section(header: Text(section.name)){
                        
                        ForEach(section.items){ item in
                            // Text(item.name)
                            NavigationLink(destination:ItemDetails(item: item)){
                                ItemView(item: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
