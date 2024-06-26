//
//  FirebaseDataSource.swift
//  BurguerContact
//
//  Created by Samuel Cíes Gracia on 3/5/24.
//

import Foundation
import FirebaseAuth

struct User {
    let email: String
}

class FirebaseDataSource{
    
    static let shared = FirebaseDataSource()
    
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else {
            return nil
        }
        return .init(email: email)
    }
    
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                
            } else if let user = result?.user {
                completion(.success(.init(email: user.email ?? "No email")))
                
            } else {
                let unknownError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error"])
                completion(.failure(unknownError))
            }
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("Error creating a new user \(error.localizedDescription)")
                completion(.failure(error))
                
            } else if let email = result?.user.email {
                print("usuario creado")
                completion(.success(.init(email: email)))
                
            } else {
                print("Error desconocido")
                completion(.failure(NSError(domain: "FirebaseDataSource", code: 500, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred"])))
            }
        }
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
    
    
}
