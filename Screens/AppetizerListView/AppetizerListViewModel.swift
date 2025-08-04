//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Pooja4 Bhagat on 29/06/25.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    
    @Published var alertItem: AlertItem?
    
    @Published var isLoading = false
    
    @Published var isShowingDetail = false
    
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true // This runs immediately on the MAIN THREAD, because getAppetizers is called from a view event (e.g. onAppear)
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result {
                case.success(let appetizers):
                    self.appetizers = appetizers
                    
                case.failure(let error):
                    switch error {
                    case.invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
}
/* So even though isLoading = true is not inside DispatchQueue.main.async, it is running on the main thread already because the function is typically triggered by SwiftUI lifecycle like .onAppear. */
// Code    Needs DispatchQueue.main.async?    Why?
// isLoading = true    ❌ (already on main thread)    Called from UI context directly
// isLoading = false (in closure)    ✅ Yes    Completion block is background thread
// getAppetizers called -> view redraws -> shows LodingView = true & then gets network response then it broadcasts the change in loadingview , variable listens and changes are accordingly redrawn
