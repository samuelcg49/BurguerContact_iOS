//
//  BurguerContactApp.swift
//  BurguerContact
//
//  Created by Samuel Cíes Gracia on 3/5/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct BurguerContactApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            if let _ = authenticationViewModel.user{
                    HomeView(authenticationViewModel: authenticationViewModel)
            }else{
                    LoginView(viewModel: authenticationViewModel)
            }
        }
    }
}
