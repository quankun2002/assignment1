//
//  SwiftUIView.swift
//  assignment1
//
//  Created by Ashley on 17/07/2023.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var searchText = ""
    @State private var filter = false
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        
        NavigationStack {
            HStack{
                Toggle(isOn: $filter) {
              
                }
                Button {
                    toggleInterfaceStyle()} label: {
                        
                        Spacer()
                        Image(systemName: "pencil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
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
                .navigationTitle("Contacts")
            }
            .searchable(text: $searchText,prompt: "enter name")
        }
        
        var searchResults: [Contact] {
            if filter {
                return contacts.filter { $0.name.contains("Tom") }
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

    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            SwiftUIView()
        }
    }
}
