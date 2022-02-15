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

func getDate() -> String {
    
    return "Hello"
}

func getStatus(currentHour: String) -> String {
    if currentHour.suffix(2) == "AM" {
        return "Good morning, "
    }
    if Int(currentHour.prefix(1))! >= 4 || Int(currentHour.prefix(1))! <= 9 && currentHour.suffix(2) == "PM" {
        return "Good evening, "
    }
    return "NULL"
}

struct ContentView: View {
    var body: some View {
        let currentTime = getTime()
        VStack {
            Rectangle()
                .ignoresSafeArea()
                .offset(x: 0, y: -490)
                .foregroundColor(.black)
                .overlay(
                    Text(String(getStatus(currentHour: currentTime)) + "Mat")
                        .bold()
                        .font(Font.system(size: 19, design: .rounded))
                        .offset(x: -120, y: -270)
                        .foregroundColor(.white)
                )
            Text(String(getTime()))
                .bold()
                .font(Font.system(size: 30, design: .rounded))
                .offset(x: -144, y: -680)
                .foregroundColor(.white)
            Text("🌡")
                .font(Font.system(size: 25, design: .rounded))
                .offset(x: -188, y: -590)
            Text("-16ºC in Toronto ")
                .bold()
                .font(Font.system(size: 16, design: .rounded))
                .offset(x: -98, y: -613)
                .foregroundColor(.white)
            Image("calendar-icon")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 20, alignment: .top)
                .offset(x: -190, y: -690)
            Image("coco-white")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 0, alignment: .top)
                .offset(x: 110, y: -800)
            Text(Date(), style: .date)
                .bold()
                .offset(x: -90, y: -720)
                .font(Font.system(size: 16, design: .rounded))
                .foregroundColor(.white)
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
