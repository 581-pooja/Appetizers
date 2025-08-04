//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Pooja4 Bhagat on 28/06/25.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    
    var body: some View {
        ZStack{
            NavigationStack{
                List(viewModel.appetizers){ appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                    
                }
                .listStyle(.plain)
                .navigationTitle("🥦 Appetizers")
                .disabled(viewModel.isShowingDetail)
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!,
                                    isShowingDetail: $viewModel.isShowingDetail)
            }
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(1.5)
            }
            
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
    
}

#Preview {
    AppetizerListView()
}

/* Notes:
 onAppear : Adds an action to perform before this view appears.
 StateObject: When initializing your view model
 ObservedObject: if you are passing the view model in from another previous view because u need data
 
 Important: 6.25 -> 6.26
 Important (Alert): 6.40 -> 6.41
 Today: 7.23 (Target Complete Loading view + remote Image + Notes + code clean up
 next day: start detail view
 */
