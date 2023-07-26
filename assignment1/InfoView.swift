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

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50.0)
            .overlay(HStack {
                Image(systemName: imageName)
                    .foregroundColor( Color(red: 0.03, green: 0.03, blue: 0.35))
             
                    Text(text)
                        .foregroundColor(.black)
                
                
            })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(red: 0.03, green: 0.03, blue: 0.35)
                .edgesIgnoringSafeArea(.all)
            VStack{
                InfoView(text: "123456789", imageName: "info.circle.fill")
                InfoView(text: "email@gmail.com", imageName: "location.fill")
                
            }
        }
    }
}
