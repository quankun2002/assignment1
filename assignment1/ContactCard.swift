//
//  ContactCard.swift
//  ContactList
//
//  Created by Tom Huynh on 7/13/22.
//

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
                    Image("rmit-logo-white").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 65)
                        .padding(.bottom, 5)

                    InfoView(text: contact.email, url:"mailto:\(contact.email)" , imageName: "envelope.fill")
                    InfoView(text: contact.phone, url:"tel:\(contact.phone)", imageName: "phone.fill")
                    
                    Spacer()
                    Text(contact.email)
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
        ContactCard(contact: contacts[0])
    }
}