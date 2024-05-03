//
//  LoginViewModel.swift
//  BurguerContact
//
//  Created by Samuel Cíes Gracia on 3/5/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter both email and password"
            return
        }
        
        FirebaseDataSource.shared.login(email: email, password: password) { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.isLoggedIn = true
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
}
