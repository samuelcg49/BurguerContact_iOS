//
//  ContentView.swift
//  BurguerContact
//
//  Created by Samuel Cíes Gracia on 3/5/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel = AuthenticationViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                
                TextField("Usuario", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                SecureField("Contraseña", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Button("Iniciar sesión") {
                    // Acción para iniciar sesión
                    viewModel.login(email: email, password: password)
                }
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(#colorLiteral(red: 0.9764705896, green: 0.721568644, blue: 0.3921568692, alpha: 1)))
                .cornerRadius(8)
                .padding(.horizontal)
                
                
                // Mensaje de error
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Spacer()
                
                // Acción para registrarse
                NavigationLink{
                    SignUpView()
                }label: {
                    HStack{
                        Text("¿Aún no tienes cuenta?")
                        
                        Text("Registrarse")
                            .foregroundStyle(.orange)
                            .fontWeight(.semibold)
                        
                    }
                    .foregroundColor(.black)
                }
            }
            .padding()
        }
    }
}


#Preview {
    LoginView()
}
