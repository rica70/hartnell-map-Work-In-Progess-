//
//  SchematicView.swift
//  hartnell map
//
//  Created by Ricardo Acosta on 3/7/26.
//

import SwiftUI
struct BuildingView: View {

    let building: Building

    @State private var selectedFloor: Int = 1
    
    var body: some View {
    
        var imageName: String? {
            switch selectedFloor {
            case 1: return building.floor1
            case 2: return building.floor2
            case 3: return building.floor3
            default: return building.floor1
            }
        }

        var floorText: String {
            "Floor \(selectedFloor)"
        }

        
        VStack {
            
            if building.name == "Parking" {
                Text("Parking Garage")
                    .font(.title)
                    .bold()
                
                Text("Payed Parking available near the main campus entrance. Click the button for more details on how to purchase a parking permit for the semester.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                
                HStack {
                    // send to hartnell's instructions to buy a permit
                    Button("Parking Permit info") {
                        if let url = URL(string: "https://www.hartnell.edu/about/safety/online-parking-permits.html") {
                            UIApplication.shared.open(url)
                        }
                    }
                    .buttonStyle(.bordered)
                    
                }
            }else {
                
                Text(building.name)
                    .font(.title)
                    .bold()
                HStack() {
                    Text(floorText)
                    Button("Next floor") {
                        selectedFloor = selectedFloor % 3 + 1
                    }
                    
                }
                .buttonStyle(.bordered)
                
                if let imageName = imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("No schematic available")
                }
            }
        }
        .navigationTitle("Building Map")
        .padding()
    }
}


