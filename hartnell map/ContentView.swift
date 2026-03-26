//
//  ContentView.swift
//  hartnell map
//
//  Created by Ricardo Acosta on 1/30/26.
//

import SwiftUI
import MapKit
import CoreLocation



struct ContentView: View {
    
    @State private var selectedBuilding: Building?
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    
    //basic hartnell colors
    @State private var redHartnell = Color(red: 116/255, green: 38/255, blue: 65/255)
    @State private var yellowHartnell = Color(red: 240/255, green: 182/255, blue: 70/255)
    
    let manager = CLLocationManager()
    
    var body: some View {
        NavigationStack {
            Map() {
                
                UserAnnotation();
                
                //creates each annotation by iterating over the buildings sructure
                ForEach(buildings) { building in
                    Annotation(building.name, coordinate: building.coordinate){
                        Button {
                            selectedBuilding = building
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(redHartnell)
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.secondary, lineWidth: 5)
                                    .tint(.black)
                                
                                if building.name == "Parking" {
                                    Image(systemName: "car.fill")
                                        .font(.system(size: 14, weight: .semibold))
                                        .padding(3)
                                        .tint(yellowHartnell)
                                } else {
                                    Text(String(building.name.prefix(1)))
                                        .font(.system(size: 14, weight: .bold))
                                        .padding(3)
                                        .tint(yellowHartnell)
                                }
                            }
                        }
                    }
                }
                
            }
            .mapStyle(.imagery)
            .sheet(item: $selectedBuilding) { building in
                BuildingView(building: building)
                    .presentationDetents([.medium, .large])
                    .presentationBackground(.clear)
                    .presentationDragIndicator(.hidden) 
            }
            // request user location
            .onAppear {
                manager.requestWhenInUseAuthorization()
            }
            
            
            }
            
        }
    }


#Preview {
    ContentView()
}

