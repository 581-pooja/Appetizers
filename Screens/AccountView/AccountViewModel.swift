//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Pooja4 Bhagat on 03/07/25.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    func saveChanges() {
        guard isValidForm else { return }
        // encode the user -> into data -> and save it in user defaults
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        }
        catch {
            alertItem = AlertContext.invalidUserData
        }
        
        
    }
    
    func retriveUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    
    
}

/*
UserDefaults
A built-in storage system used to save small pieces of data locally on the device.
Data persists between app launches, even if the app is closed or the device is restarted.
Best for storing simple data like:
Bool (e.g. isLoggedIn)
String (e.g. username)
 & It is not replacement for backend
 
 UserDefaults.standard.set(true, forKey: "isLoggedIn")
 let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
 
 🚀 AppStorage (SwiftUI)
 A SwiftUI property wrapper that is connected to UserDefaults.
 Automatically updates the SwiftUI view whenever the stored value changes.
 Great for storing user settings or preferences that affect the UI.
 
 @AppStorage("isDarkMode") var isDarkMode: Bool = false
 
 AppStorage key is user and it is storing data and variable is userData in program & in memory it is user
 
 AppStorage is like a state variable that watches userDefaults
 */
