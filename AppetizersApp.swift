//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Pooja4 Bhagat on 28/06/25.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order : Order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
// we are injecting order in AppetizerTabView enviroment
