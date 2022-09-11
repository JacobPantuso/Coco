//
//  LogInView.swift
//  Coco
//
//  Created by Jacob Pantuso on 2022-05-03.
//

import SwiftUI

struct LogInButtonContent: View {
    var body: some View {
        Label("Log in", systemImage: "arrow.forward.circle.fill")
            .padding()
            .foregroundColor(Color.white)
            .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(colors: [Color(hex: 0xB8143B),Color(hex: 0xEC5273)], startPoint: .leading, endPoint: .trailing))
                .frame(width: 200, height: 42, alignment: .center))
    }
}

struct LogInButtonContentDis: View {
    var body: some View {
        Label("Log in", systemImage: "arrow.forward.circle.fill")
            .padding()
            .foregroundColor(Color.gray)
            .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(colors: [Color(hex: 0xB8143B),Color(hex: 0xEC5273)], startPoint: .leading, endPoint: .trailing))
                .frame(width: 200, height: 42, alignment: .center))
    }
}

struct LogInView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var textSwitch = false
    @State private var isClicked = false
    @State private var showPassword = false

    
    var body: some View {
            ZStack {
                Color("Background")
                VStack {
                    Text("Welcome Back")
                        .font(.system(size: 30))
                        .bold()
                        .padding()
                    Rectangle()
                        .foregroundColor(Color(hex: 0x9faaad))
                        .frame(width: 300, height: 60, alignment: .center)
                        .cornerRadius(10)
                        .shadow(color: Color(hex: 0x9faabd).opacity(0.8), radius: 7, x: 7, y: 5)
                        .overlay(
                            HStack {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .foregroundColor(Color(hex: 0x525050))
                                    .padding()
                                    .frame(width:50, height: 50)
                                    .scaledToFit()
                                Divider()
                                    .padding(.vertical)
                                    .frame(height: 60)
                                    .offset(x: -10)
                                TextField("Username", text: $username)
                            }
                        )
                        .padding()
                    Rectangle()
                        .foregroundColor(Color(hex: 0x9faaad))
                        .frame(width: 300, height: 60, alignment: .center)
                        .cornerRadius(10)
                        .shadow(color: Color(hex: 0x9faabd).opacity(0.8), radius: 7, x: 7, y: 5)
                        .overlay(
                            HStack {
                                Image(systemName: "person.badge.key.fill")
                                    .resizable()
                                    .foregroundColor(Color(hex: 0x525050))
                                    .padding()
                                    .frame(width:53, height: 50)
                                    .aspectRatio(contentMode: .fit)
                                Divider()
                                    .padding(.vertical)
                                    .frame(height: 60)
                                    .offset(x: -10)
                                if (showPassword) {
                                    TextField("Password", text: $password)
                                    Button(action: {showPassword.toggle()}, label: {
                                        Image(systemName: "eye.fill")
                                            .foregroundColor(Color.black)
                                    })
                                }
                                else {
                                    SecureField("Password", text: $password)
                                    Button(action: {showPassword.toggle()}, label: {
                                        Image(systemName: "eye.slash.fill")
                                            .foregroundColor(Color.black)
                                    })
                                }
                                Spacer()
                            }
                        )
                    NavigationLink(destination: {
                        ForgotPasswordView()
                    }, label: {
                        Text("Forgot Password")
                            .bold()
                    })
                    .padding(.top)
                    if (!username.isEmpty && !password.isEmpty) {
                        if (username == "JacobP" && password == "1903") {
                            NavigationLink(destination: {
                                HomeView()
                            }, label: {
                                LogInButtonContent()
                            })
                        } else {
                            VStack {
                                Button(action: {isClicked = true}, label: {
                                    LogInButtonContent()
                                })
                                if (isClicked) {
                                    Text((textSwitch ? "The information entered is incorrect!" : "The information entered is incorrect!"))
                                        .foregroundColor(Color.red)
                                        .onAppear {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                isClicked = false
                                            }
                                        }
                                }
                            }
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    self.textSwitch.toggle()
                                }
                            }
                        }
                    }
                    else {
                        LogInButtonContentDis()
                    }
                    Spacer()
                        .frame(minHeight: 20, idealHeight: 120)
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
        .ignoresSafeArea()
        .environment(\.colorScheme, .light)
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
            .environment(\.colorScheme, .light)
    }
}
