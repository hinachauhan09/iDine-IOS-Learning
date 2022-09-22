//
//  MainView.swift
//  iDine
//
//  Created by Hina Chauhan on 21/09/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                        Label("Menu",systemImage: "list.dash")
                }
            OrderView()
                .tabItem{
                    Label("Order",systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Order())
    }
}
