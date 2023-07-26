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

struct ListView: View {
    @State private var searchText = ""
    @State private var filter = false
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        
        NavigationStack {
            HStack{
                Toggle(isOn: $filter) {
                    Text("Nobel prize winner").offset(x:380)
                } .offset(x:-300)
                Button {
                    toggleInterfaceStyle()} label: {
                        
                        
                        Image(systemName: "lightbulb")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .offset(x:-20)
                    }
            }
            List(searchResults){
                contact in
                NavigationLink{
                    ContactCard(contact: contact)
                } label: {
                    Row(contact: contact)
                }
                .navigationTitle("List of figures")
            }
            .searchable(text: $searchText,prompt: "enter name")
        }
        
        var searchResults: [Contact] {
            if filter {
                return contacts.filter { $0.description.contains("Nobel") }
            }
            else{
                if searchText.isEmpty {
                    return contacts
                } else {
                    return contacts.filter { $0.name.contains(searchText) }
                }
            }
        }
    }
    
    func toggleInterfaceStyle() {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let interfaceStyle = window?.overrideUserInterfaceStyle == .unspecified ? UIScreen.main.traitCollection.userInterfaceStyle : window?.overrideUserInterfaceStyle
        
        if interfaceStyle != .dark {
            window?.overrideUserInterfaceStyle = .dark
        } else {
            window?.overrideUserInterfaceStyle = .light
        }
    }
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView()
        }
    }
}
