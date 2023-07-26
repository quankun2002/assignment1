/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Le Anh Quan
 ID: 3877457
 Created  date: dd/mm/yyyy (e.g. 31/07/2023)
 Last modified: dd/mm/yyyy (e.g. 05/08/2023)
 Acknowledgement: Acknowledge the resources that you use here.
 */

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
                    Text("Famous historical figure")
                        .font(.custom(
                            "BungeeSpice-Regular"
                            ,size: 35))
                        .fontWeight(.bold)
                        .foregroundColor(.white)  .multilineTextAlignment(.center)
                    Image("Nobel_Prize")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, alignment: .center)
                    
                    NavigationLink(destination: ListView()) {
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
                        Alert(title: Text("Le Anh Quan"), message: Text("s3877457, Software engineer From RMIT"), dismissButton: .default(Text("OK!")))
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
