//
//  Building.swift
//  hartnell map
//
//  Created by Ricardo Acosta on 3/2/26.
//

// Building.swift

import Foundation
import CoreLocation
// struct for buildings
struct Building: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let floor1: String?
    let floor2: String?
    let floor3: String?
    let floorRooms: [Int: [String]]
    
    init(name: String,
             coordinate: CLLocationCoordinate2D,
             floor1: String? = nil,
             floor2: String? = nil,
             floor3: String? = nil,
             floorRooms: [Int: [String]] = [:]) {
            self.name = name
            self.coordinate = coordinate
            self.floor1 = floor1
            self.floor2 = floor2
            self.floor3 = floor3
            self.floorRooms = floorRooms
        }
}
