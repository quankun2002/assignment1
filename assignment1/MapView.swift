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
import MapKit
struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate2: CLLocationCoordinate2D
}
struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        let annotations = [
            Place(name: "pin", coordinate2: coordinate)
        ]
        
        Map(coordinateRegion: $region, annotationItems: annotations) { place in
            MapAnnotation(coordinate: place.coordinate2) {
                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.red)
                    Text("pin")
                        .fixedSize()
                }.padding(10)
                    .background(Color.white).foregroundColor(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                    .overlay(
                        Image(systemName: "arrowtriangle.left.fill")
                            .rotationEffect(Angle(degrees: 270))
                            .foregroundColor(.white)
                            .offset(y: 10)
                        
                        , alignment: .bottom)
                
            }
        }
    
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
