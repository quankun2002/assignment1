//
//  ContactRow.swift
//  ContactList
//
//  Created by Tom Huynh on 7/13/22.
//

import SwiftUI

struct Row: View {
    var contact: Contact
    
    var body: some View {
        HStack {
            contact.image
                .resizable()
                .frame(width: 50, height: 50)
            VStack {  Text(contact.name)
                Text(contact.name)
            }
            
        }
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Row(contact: contacts[0])
                .previewLayout(.fixed(width: 300, height: 70))
            Row(contact: contacts[1])
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
