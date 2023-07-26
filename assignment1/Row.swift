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

struct Row: View {
    var contact: Contact
    
    var body: some View {
        HStack {
            contact.image
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 6) {  Text(contact.name)
                Text(contact.occupation)
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
