//
//  ForgotPasswordView.swift
//  Coco
//
//  Created by Jacob Pantuso on 2022-05-03.
//

import SwiftUI

struct ContinueButton: View {
    var body: some View {
        Label("Continue", systemImage: "arrow.forward.circle.fill")
            .padding()
            .foregroundColor(Color.white)
            .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(colors: [Color(hex: 0xB8143B),Color(hex: 0xEC5273)], startPoint: .leading, endPoint: .trailing))
                .frame(width: 200, height: 42, alignment: .center))
    }
}

struct ContinueButtonDis: View {
    var body: some View {
        Label("Continue", systemImage: "arrow.forward.circle.fill")
            .padding()
            .foregroundColor(Color.gray)
            .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(colors: [Color(hex: 0xB8143B),Color(hex: 0xEC5273)], startPoint: .leading, endPoint: .trailing))
                .frame(width: 200, height: 42, alignment: .center))
    }
}

struct ForgotPasswordView: View {
    
    @State private var animateGradient = false
    @State var email: String = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color("Background")
            VStack {
                Text("Forgot Password")
                    .bold()
                    .font(.system(size: 35))
                Text("What is your email address?")
                    .bold()
                    .padding(0.5)
                Rectangle()
                    .foregroundColor(Color(hex: 0x9faaad))
                    .frame(width: 300, height: 60, alignment: .center)
                    .cornerRadius(10)
                    .shadow(color: Color(hex: 0x9faabd).opacity(0.8), radius: 7, x: 7, y: 5)
                    .overlay(
                        HStack {
                            Image(systemName: "envelope.fill")
                                .resizable()
                                .foregroundColor(Color(hex: 0x525050))
                                .padding()
                                .frame(width:60, height: 50)
                                .scaledToFit()
                            Divider()
                                .padding(.vertical)
                                .frame(height: 60)
                                .offset(x: -10)
                            TextField("Email address", text: $email)
                                .keyboardType(.emailAddress)
                        }
                    )
                    .padding()
                if (!email.isEmpty && email.contains("@")) {
                    NavigationLink(destination: {
                        AuthenticationView()
                    }, label: {
                        ContinueButton()
                    })
                } else {
                    ContinueButtonDis()
                }
                Spacer()
                    .frame(minHeight: 20, idealHeight: 100)
                    .fixedSize()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.mode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "arrow.left")
                .foregroundColor(.black)
        }))
        .ignoresSafeArea(.all)
        .environment(\.colorScheme, .light)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
            .environment(\.colorScheme, .light)
    }
}
