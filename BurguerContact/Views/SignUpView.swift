//
//  SignUpView.swift
//  BurguerContact
//
//  Created by Samuel Cíes Gracia on 3/5/24.
//

import SwiftUI

struct SignUpView: View {
    @State  var email = ""
    @State  var password = ""
    @State  var username = ""
    @State  var birthDate = Date()
    @State  var phone = ""
    
    @StateObject var viewModel = AuthenticationViewModel()
    
    var body: some View {
        VStack {
            // Imagen
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            // Campos de texto para el registro
            TextField("Correo Electrónico", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            
            SecureField("Contraseña", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            
            SecureField("Repite la contraseña", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            
            DatePicker("Fecha de Nacimiento", selection: $birthDate, displayedComponents: .date)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            
            TextField("Número de Teléfono", text: $phone)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            
            // Botón Registrarse
            Button("Registrarse") {
                viewModel.signUp(email: email, password: password)
            }
            .foregroundColor(.white)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(#colorLiteral(red: 0.9764705896, green: 0.721568644, blue: 0.3921568692, alpha: 1)))
            .cornerRadius(10)
            .padding(.horizontal)
            
            
            // Mensaje de error
            //            if !signUpViewModel.errorMessage.isEmpty {
            //                Text(viewModel.errorMessage)
            //                    .foregroundColor(.red)
            //                    .padding()
            //            }
            
            Spacer()
        }
        .padding()
    }
}


#Preview {
    SignUpView()
}
