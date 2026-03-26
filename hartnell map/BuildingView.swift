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
    @State private var searchText: String = ""
    @State private var selectedRoom: String = ""
    var filteredRooms: [String] {
        let rooms = building.floorRooms[selectedFloor] ?? []
        if searchText.isEmpty {
            return rooms
        } else {
            return rooms.filter { $0.contains(searchText) }
        }
    }
    
    
    var body: some View {
    
        var svgName: String? {
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
                
                
                Text("Payed Parking available near the main campus entrance. Click the button for more details on how to purchase a parking permit for the current semester.")
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

                // Search bar
                TextField("Search room...", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                if !searchText.isEmpty {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 0) {
                                ForEach(filteredRooms, id: \.self) { room in
                                    Button {
                                        searchText = room
                                        selectedRoom = room
                                    } label: {
                                        Text("Room \(room)")
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    Divider()  // line between each room
                                }
                            }
                        }
                        .frame(maxHeight: 200)  // max height so it doesn't take over screen
                        .background(.ultraThinMaterial)  // frosted glass look
                        .cornerRadius(10)  // rounded corners
                        .padding(.horizontal)
                    }
                // Floor switcher
                HStack() {
                    Text(floorText)
                    Button("Next floor") {
                        selectedFloor = selectedFloor % 3 + 1
                    }
                }
                .buttonStyle(.bordered)

                // Swap Image for SVGWebView
                if let svgName = svgName {
                    SVGWebView(
                        svgName: svgName,
                        highlightRoom: selectedRoom
                    )
                } else {
                    Text("No schematic available")
                }
                
            }
        }
        .navigationTitle("Building Map")
        .padding()
    }
}


