//
//  ContentView.swift
//  BurguerContact
//
//  Created by Samuel Cíes Gracia on 3/5/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 200, height: 200)
                .padding()
            
            TextField("Usuario", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            SecureField("Contraseña", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            Button(action: {
                // Acción para iniciar sesión
            }) {
                Text("Iniciar sesión")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(#colorLiteral(red: 0.9764705896, green: 0.721568644, blue: 0.3921568692, alpha: 1)))
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            
            Spacer()
            
            Button(action: {
                // Acción para registrarse
            }) {
                Text("¿Aún no te has registrado?")
                    .foregroundColor(.black)
            }
            .padding()
        }
        .padding()
    }
}


#Preview {
    LoginView()
}
