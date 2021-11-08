//
//  ContentView.swift
//  CatProject
//
//  Created by 박지영 and 윤지민 on 2021/07/06.
//

import SwiftUI

struct ContentView: View {
    var imageNames = ["cat1", "cat2", "cat3", "cat4", "cat5"]
    @State var showsImage = true
    @State var username = ""
    @State var page = 3
    @State var opacity = 0.0
    var body: some View {
        VStack {
                HStack{
                    Button(action: onBtnLeft) {
                        Image("prev")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.leading)
                            
                    }.disabled(page == 0)
                    Spacer()
                    Text("\(page+1)/\(imageNames.count)").font(.largeTitle)
                        .padding()
                    Spacer()
                    Button(action: onBtnRight) {
                        Image("next")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)}
                        .disabled(page == imageNames.count - 1)
                        .padding(.trailing)
                }
            TextField("Your Name", text: $username)     //너의 이름은
                .keyboardType(.emailAddress)
            Text(username)
            Toggle(isOn: $showsImage) {
                Text("Shows Image")
            }
            Slider(value: $opacity)
            Spacer()
            Image(imageNames[page])
                .resizable(resizingMode: .stretch)
                .frame(width: 300.0, height: 300.0)
                .opacity(opacity)
            Spacer()

            }.font(.title)
        
        
            
    }
    func onBtnLeft(){
        if page == 0 { return }
        page -= 1
    }
    func onBtnRight(){
        if page == imageNames.count - 1 { return }
        page += 1
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.sizeCategory, .extraSmall)
    }
}
