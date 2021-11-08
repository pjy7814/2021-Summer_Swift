//
//  ContentView.swift
//  Animap
//
//  Created by 박지영 on 2021/07/08.
//

import SwiftUI

struct ContentView: View {
    @State var rotation = 0.0
    @State var scale : CGFloat = 1.0
    @State var visibility = false
    @State var spinning = false
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color.blue)
                    .frame(width: 200, height: 200, alignment: .center)
                Image(systemName: "forward.fill")
                    .font(.largeTitle)
                    .offset(y: -100)
                    .rotationEffect(.degrees(spinning ? 360 : 0))
                    .animation(.linear(duration: 60)
                                .repeatForever(autoreverses:false)
                    )
            }
            .onAppear {
                self.spinning = true
            }
            Toggle(isOn: $visibility.animation(.linear)) {
                        Text("Toggle Text Views").font(.largeTitle)
                    }.padding()
            Button(action: onBtn){
                    Text("Hit me !")
                        .fontWeight(.heavy)
                        .padding()
                        .font(.largeTitle)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/,width: 2)
                        .rotationEffect(.degrees(rotation))
                        .scaleEffect(scale)
                        //.animation(.linear(duration: 0.3))
                        .animation(.spring(response: 1, dampingFraction: 0.2, blendDuration: 0))
            }
            if visibility{
                Text("Slide").font(.largeTitle)
                    .transition(.slide)
            } else{
                Text("Scale").font(.largeTitle)
                    .transition(.scale)
            }
            if visibility{
                Text("Move~").font(.largeTitle)
                    .transition(.move(edge: .top))
            } else{
                Text("MOVE").font(.largeTitle)
                    .transition(.move(edge: .leading))
            }
        }
    }
    func onBtn(){
        self.rotation = self.rotation < 360 ? self.rotation + 60 : 0
        self.scale = self.scale < 2.8 ? self.scale + 0.3 : 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
