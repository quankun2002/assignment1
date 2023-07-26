//
//  ContentView.swift
//  I Am Rich
//
//  Created by Tom Huynh on 7/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State var selection: Int? = nil
    @State var isWelcomeActive: Bool = true
    var body: some View {
        NavigationView {
        ZStack {
           
            
            Color(red: 0.03, green: 0.03, blue: 0.35)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Text("kinda rich")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Image("red-diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, alignment: .center)
               
                NavigationLink(destination: SwiftUIView()) {
                label: do {
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                        .frame(height:80)
                        .overlay(Text("Get Started")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white))}
                }
                Spacer()
                Button {
                    showingAlert = true
                } label: {
                    HStack{
                        Spacer()
                        Image(systemName: "pencil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .offset(x:-20)
                    }
                    
                }
                .alert(isPresented: $showingAlert) {
                           Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("OK!")))
                       }
                }
                
            }
        }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
