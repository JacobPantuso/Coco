//
//  AuthenticationView.swift
//  Coco
//
//  Created by Jacob Pantuso on 2022-05-04.
//

import SwiftUI
import CodeVerifier

struct ReturnToWelcomeContent: View {
    var body: some View {
        Text("Return to Sign In")
            .bold()
            .padding()
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(colors: [Color(hex: 0xB8143B),Color(hex: 0xEC5273)], startPoint: .leading, endPoint: .trailing))
                .frame(width: 200, height: 42, alignment: .center))
    }
}

struct AuthenticationView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color("Background")
            VStack {
                Text("Forgot Password")
                    .bold()
                    .font(.system(size: 35))
                Text("Follow the instructions sent to your email")
                    .padding(0.5)
                NavigationLink(destination: {
                    LogInView()
                }, label: {
                    ReturnToWelcomeContent()
                })
                Spacer()
                    .frame(minHeight: 10, idealHeight: 100)
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


struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
            .environment(\.colorScheme, .light)
    }
}
