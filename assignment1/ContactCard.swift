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
import CoreLocation
struct ContactCard: View {
    var contact: Contact
    var body: some View {
        ZStack {
            Color(red: 0.03, green: 0.03, blue: 0.35)
                .edgesIgnoringSafeArea(.bottom)
            ScrollView {
                
                VStack {
                    MapView(coordinate: contact.locationCoordinate)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 250)
                    
                    CircleImage(image: contact.image)
                        .offset(y: -100)
                        .padding(.bottom, -100)
                    Text(contact.name)
                        .font(.system(size: 40))
                        .bold()
                        .foregroundColor(.white)
                    
                    InfoView(text: contact.occupation,   imageName: "info.circle.fill")
                    InfoView(text: contact.nationality, imageName: "location.fill")
                    
                    Spacer()
                    Text(contact.description)
                        .font(.system(size: 20))
                        .foregroundColor(.white).frame(width:350).scaledToFit().padding()
                        .border(.green).background(.black)
                    
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ContactCard_Previews: PreviewProvider {
    static var previews: some View {
        ContactCard(contact: contacts[1])
    }
}
