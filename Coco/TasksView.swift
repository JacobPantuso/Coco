//
//  TasksView.swift
//  Coco
//
//  Created by Jacob Pantuso on 2022-05-19.
//

import SwiftUI

struct TasksView: View {
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: .infinity, height: 80)
                    .cornerRadius(15)
                    HStack(spacing: 100) {
                        NavigationLink(destination: {
                            HomeView()
                        }, label: {
                            VStack(spacing: 3) {
                                Image(systemName: "calendar.circle")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 30, height: 30)
                                Text("Home")
                                    .font(.system(size: 14))
                            }
                        })
                        NavigationLink(destination: {
                            TasksView()
                        }, label: {
                            VStack(spacing: 3) {
                                Image(systemName: "list.bullet.circle.fill")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 30, height: 30)
                                Text("Tasks")
                                    .font(.system(size: 14))
                            }
                        })
                        NavigationLink(destination: {
                            WeatherView()
                        }, label: {
                            VStack(spacing: 3) {
                                Image(systemName: "sun.max.circle")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 30, height: 30)
                                Text("Weather")
                                    .font(.system(size: 14))
                            }
                        })
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .environment(\.colorScheme, .light)
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
