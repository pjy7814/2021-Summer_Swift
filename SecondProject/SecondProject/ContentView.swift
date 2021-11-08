//
//  ContentView.swift
//  SecondProject
//
//  Created by 박지영 on 2021/07/07.

import SwiftUI

struct ContentView: View {
    @State var greeting = "Hello"
    @State var rotation = 0.0
    @ObservedObject var timerData = TimerData()
//    init() {
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in self.timeCount += 1
//            self.greeting = "Timer: \(self.timeCount)"
//        }
//    }
    var body: some View {
        NavigationView {
            VStack {
                Text("Timer = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding()
                    .border(Color.blue, width: 2)
                    .rotationEffect(Angle.radians(rotation))
                    .animation(.easeOut(duration: 5.0))
//                TextField("Greeting", text: $greeting)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
                Slider(value: $rotation, in: 0 ... 2 * Double.pi)
                Spacer()
                NavigationLink(
                    destination: SecondView(data: "Hello World", timerData: timerData)){
                        Text("Navigate 1")
                    }
                NavigationLink(
                    destination: SecondView(data: "Hello Swift",timerData: timerData)){
                        Text("Navigate 2")
                    }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
