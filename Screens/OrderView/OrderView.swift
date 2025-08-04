//
//  OrderView.swift
//  Appetizers
//
//  Created by Pooja4 Bhagat on 28/06/25.
//

import SwiftUI

struct OrderView: View {

    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("Order Placed")
                    } label: {
//                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(standardButtonStyle())
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order",
                               message: "You have no items in your order.\nPlease add an appetizer.")
                }
            }
            .navigationTitle("📝 Orders")
        }
    }
}

#Preview {
    OrderView()
}

//    @State private var orderItems = MockData.sampleOrderItems
// Swiftui: Once source of truth and setting up ui when data changes then ui should react accordingly
