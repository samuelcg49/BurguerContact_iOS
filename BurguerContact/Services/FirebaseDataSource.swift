//
//  FirebaseDataSource.swift
//  BurguerContact
//
//  Created by Samuel Cíes Gracia on 3/5/24.
//

import Foundation
import FirebaseAuth

class FirebaseDataSource{
    
    static let shared = FirebaseDataSource()
        
        private init() {}
        
        func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    completion(.failure(error))
                    
                } else if let user = result?.user {
                    completion(.success(user))
                    
                } else {
                    let unknownError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error"])
                    completion(.failure(unknownError))
                }
            }
        }
}
