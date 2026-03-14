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
    
}
