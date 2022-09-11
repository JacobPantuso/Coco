//
//  SignUpView.swift
//  Coco
//
//  Created by Jacob Pantuso on 2022-05-03.
//

import SwiftUI

struct SignUpView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var fullName: String = ""
    @State var emailADD: String = ""
    @State var birthDate: Date = Date()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>


    
    var body: some View {
            VStack {
                Form {
                    Section(header: Text("PROFILE INFORMATION")) {
                        TextField("Username", text: $username)
                            .background()
                        TextField("Password", text: $password)
                            .background()
                        DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                                        Text("Date of Birth")
                                    }
                    }
                    Section(header: Text("Account Information")) {
                        TextField("Full Name", text: $fullName)
                            .background()
                        TextField("Email Address", text: $emailADD)
                            .background()
                            .keyboardType(.emailAddress)
                    }

                    Button(action: {
                        
                    }, label: {
                        Text("Submit")
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                    })
                }
                .navigationTitle("Get Started")
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action: {
                    self.mode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }))
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
