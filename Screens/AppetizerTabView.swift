//
//  ContentView.swift
//  Appetizers
//
//  Created by Pooja4 Bhagat on 28/06/25.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house"){
                AppetizerListView()
            }
            Tab("Account", systemImage: "person"){
                AccountView()
            }
            Tab("Order", systemImage: "bag"){
                OrderView()
            }
            .badge(order.items.count)
        }
        .tint(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
