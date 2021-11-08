//
//  DetailView.swift
//  ListApp
//
//  Created by 박지영 on 2021/07/07.
//

import SwiftUI

struct DetailView: View {
    let country: Country
    var body: some View {
        VStack{
            Image(country.file)
                .resizable()
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            Spacer()
            Text(country.name)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Spacer()
        }
        .navigationBarTitle(Text(country.name), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(country: Nations.continents.first!.countries.first!)
    }
}
