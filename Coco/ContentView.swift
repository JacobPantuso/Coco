//
//  WelcomeScreeen.swift
//  Coco
//
//  Created by Jacob Pantuso on 2022-05-03.
//

import SwiftUI
import AuthenticationServices

struct SignUpButton: View {
    var body: some View {
        Text("Sign Up").bold()
            .padding()
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(colors: [Color(hex: 0xB8143B),Color(hex: 0xEC5273)], startPoint: .leading, endPoint: .trailing))
                .frame(width: 120, height: 42, alignment: .center))
    }
}

struct LogInButton: View {
    var body: some View {
        Text("Log In").bold()
            .padding()
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(colors: [Color(hex: 0xB8143B),Color(hex: 0xEC5273)], startPoint: .leading, endPoint: .trailing))
            .frame(width: 120, height: 42, alignment: .center))
    }
}

struct ContentView: View {
    
    init(){
        UINavigationBar.setAnimationsEnabled(true)
    }
    
    @State var isClicked: Bool = false
    @State private var animateGradient = false
    @State var fda: String = ""
    @State var isSignedIn: Bool = false
    
    var body: some View {
        NavigationView {
            if isSignedIn == false {
                    ZStack {
                        LinearGradient(colors: [.pink, .purple], startPoint: animateGradient ? .topLeading : .bottomLeading, endPoint: animateGradient ? .bottomTrailing : .topTrailing)
                            .ignoresSafeArea()
                            .onAppear {
                                withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                                    animateGradient.toggle()
                                }
                            }
                        VStack() {
                            Spacer()
                            Image("coconewbg")
                                .resizable()
                                .frame(width: 350, height: 350, alignment: .center)
                            Spacer()
                            (Text(Image(systemName: "applelogo")) + Text("  Continue with Apple"))
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 233, height: 42, alignment: .center))
                                    .foregroundColor(.black)

                            (Text(Image(systemName: "g.circle.fill"))
                             + Text("   Continue with Google"))
                                .padding()
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 233, height: 42, alignment: .center)
                                    .foregroundColor(.black))
                            Text("⎯⎯ OR ⎯⎯")
                                .bold()
                            HStack {
                                NavigationLink(destination: LogInView(), label: {LogInButton()})
                                Spacer()
                                    .frame(minWidth: 10, idealWidth: 50)
                                    .fixedSize()
                                NavigationLink(destination: SignUpView(), label: {SignUpButton()})
                    
                            }
                        }
                    }
            }
            else {
                ContentView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct WelcomeScreeen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
