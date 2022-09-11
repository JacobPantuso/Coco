//
//  ContentView.swift
//  Coco
//
//  Created by Jacob Pantuso on 2022-02-14.
//

import SwiftUI

func getTime() -> String {
    let formatter = DateFormatter()
    
    formatter.timeStyle = .short
    
    let dateString = formatter.string(from: Date())
    return dateString
}

func getStatus(currentHour: String) -> String {
    if currentHour.suffix(2) == "AM" {
        return "Good morning,"
    }
    if Int(currentHour.prefix(1))! >= 4 || Int(currentHour.prefix(1))! <= 9 && currentHour.suffix(2) == "PM" {
        return "Good evening,"
    }
    return "NULL"
}

struct HomeView: View {
    init(){
        UINavigationBar.setAnimationsEnabled(true)
    }
    var body: some View {
        let currentTime = getTime()
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                    .frame(height: 170)
                    .cornerRadius(30)
                    .shadow(color: Color(hex: 0x9faabd).opacity(0.8), radius: 7, x: 7, y: 5)
                HStack {
                    VStack(alignment: .leading, spacing: 3) {
                        Text(currentTime)
                            .bold()
                            .font(.system(size: 20))
                        Text(getStatus(currentHour:currentTime) + " Jacob")
                            .bold()
                        Text("You currently have 2 upcoming\ntasks due.")
                            .font(.system(size: 12))
                    }
                    .padding()
                    Spacer()
                    Spacer()
                    VStack() {
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .frame(width: 45, height: 43)
                        Text("27ºC")
                            .bold()
                            .font(.system(size: 20))
                    }
                    Spacer()
                }
                
            }
            .environment(\.colorScheme, .dark)
            .ignoresSafeArea(.all)
            VStack {
                HStack {
                    Text(Date(), style: .date)
                        .bold()
                        .font(.system(size: 20))
                }
                HStack {
                    VStack {
                        Text("Tasks")
                            .bold()
                        .font(.system(size:18))
                    }
                    Spacer()
                    NavigationLink(destination: {
                        TasksView()
                    }, label: {
                        Text("View All")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 70, height: 20)
                            .background(.black)
                            .font(.system(size:11))
                            .cornerRadius(20)
                    })
                }
            }
            .padding()
            VStack(spacing: 20) {
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                Gradient.Stop(color: .red, location: -0.01),
                                Gradient.Stop(color: .white, location: 0.03)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing))
                    .frame(width: 400, height: 60, alignment: .center)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.3), radius: 7, x: 7, y: 5)
                    .overlay(
                        HStack {
                            Image(systemName: "grid.circle.fill")
                                .resizable()
                                .foregroundColor(.black)
                                .padding()
                                .frame(width:60, height: 60)
                                .scaledToFit()
                            VStack(alignment: .leading) {
                                Text("Finish coding assignment")
                                Text("Due today")
                                    .font(.system(size:9))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                    )
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                Gradient.Stop(color: .red, location: -0.01),
                                Gradient.Stop(color: .white, location: 0.03)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing))
                    .frame(width: 400, height: 60, alignment: .center)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.3), radius: 7, x: 7, y: 5)
                    .overlay(
                        HStack {
                            Image(systemName: "trash.circle.fill")
                                .resizable()
                                .foregroundColor(.black)
                                .padding()
                                .frame(width:60, height: 60)
                                .scaledToFit()
                            VStack(alignment: .leading) {
                                Text("Take out the trash")
                                Text("Due today")
                                    .font(.system(size:9))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                    )
            }
            VStack {
                HStack {
                    VStack {
                        Text("Events")
                            .bold()
                        .font(.system(size:18))
                    }
                    Spacer()
                    NavigationLink(destination: {
                        TasksView()
                    }, label: {
                        Text("View All")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 70, height: 20)
                            .background(.black)
                            .font(.system(size:11))
                            .cornerRadius(20)
                    })
                }
                HStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 150, height: 150, alignment: .center)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.3), radius: 7, x: 7, y: 5)
                        .overlay(
                            VStack {
                                Text("• Starts in 15 minutes")
                                    .font(.system(size:9).smallCaps())
                                    .foregroundColor(.red)
                                Text("Meeting with Sarah")
                                    .font(.system(size:10))
                                    .bold()
                                Image("participants")
                                    .resizable()
                                    .frame(width: 70, height: 40)
                                Divider()
                                Image(systemName: "video.circle.fill")
                                    .foregroundColor(.blue)
                                    .padding(.top, 3)
                                Text("Join via Zoom")
                                    .font(.system(size: 10))
                                Text("Invitation Accepted")
                                    .foregroundColor(.green)
                                    .bold()
                                    .font(Font.system(size: 8).smallCaps())
                            }
                                .padding()
                    )
                        .padding(.trailing)
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 150, height: 150, alignment: .center)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.3), radius: 7, x: 7, y: 5)
                        .overlay(
                            VStack {
                                Text("• marked as urgent")
                                    .font(.system(size:9).smallCaps())
                                    .foregroundColor(.red)
                                Text("Monthly Audit")
                                    .font(.system(size:10))
                                    .bold()
                                Image(systemName: "chart.line.uptrend.xyaxis.circle.fill")
                                    .resizable()
                                    .foregroundColor(.green)
                                    .frame(width: 30, height: 30)
                                    .padding(.top, -4)
                                Text("Spreadsheet Linked")
                                    .font(.system(size: 8))
                                Divider()
                                Image(systemName: "arrow.right.circle.fill")
                                    .padding(.top, 3)
                                    .foregroundColor(.red)
                                Text("View detailed summary")
                                    .font(.system(size: 10))
                                Text("Due Tomorrow")
                                    .font(.system(size: 8).smallCaps())
                                    .foregroundColor(.red)
                                    .bold()
                                    
                            }
                                .padding()
                    )
                        .padding(.leading)
                }
            }
            .padding()
            Spacer()
            Text("End of detailed summary")
                .font(.system(size:15).smallCaps())
                .foregroundColor(.gray)
                .bold()
            Spacer()
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: .infinity, height: 100)
                    .cornerRadius(15)
                HStack(spacing: 100) {
                    NavigationLink(destination: {
                        HomeView()
                    }, label: {
                        VStack(spacing: 3) {
                            Image(systemName: "calendar.circle.fill")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 30, height: 30)
                            Text("Home")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                        }
                    })
                    NavigationLink(destination: {
                        TasksView()
                    }, label: {
                        VStack(spacing: 3) {
                            Image(systemName: "list.bullet.circle")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 30, height: 30)
                            Text("Tasks")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
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
                                .foregroundColor(.black)
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

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.colorScheme, .light)
    }
}
