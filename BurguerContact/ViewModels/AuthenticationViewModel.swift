//
//  LoginViewModel.swift
//  BurguerContact
//
//  Created by Samuel Cíes Gracia on 3/5/24.
//

import Foundation

class AuthenticationViewModel: ObservableObject {
    
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    @Published var signUpError: Error?
    @Published var signUpSuccess: Bool = false
    @Published var user: User?
    
    init(){
        getCurrentUser()
    }
    
    func getCurrentUser(){
        self.user = FirebaseDataSource.shared.getCurrentUser()
    }
    
    func login(email: String, password: String) {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter both email and password"
            return
        }
        
        FirebaseDataSource.shared.login(email: email, password: password) { result in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.isLoggedIn = true
                    self.user = user
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func signUp(email: String, password: String) {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter both email and password"
            return
        }
        
        FirebaseDataSource.shared.signUp(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self?.user = user
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func logout(){
        do{
            try FirebaseDataSource.shared.logout()
            self.user = nil
        }catch{
            print("Error logout")
        }
    }
    
    
}
