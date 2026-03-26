//
//  BuildingData.swift
//  hartnell map
//
//  Created by Ricardo Acosta on 3/25/26.
//

import Foundation
import CoreLocation

let buildings = [
    Building(name: "A-Library/Learning Resource Center", coordinate: CLLocationCoordinate2D(latitude: 36.67508856285571, longitude: -121.66599951058397),
            ),
    Building(name: "B-Student Services", coordinate: CLLocationCoordinate2D(latitude: 36.67460406629331, longitude: -121.66523297141931),
            ),
    Building(name: "C-Student Center", coordinate: CLLocationCoordinate2D(latitude: 36.67404867890643, longitude: -121.66572647468566),
            ),
    Building(name: "D-College administration (NORTH)", coordinate: CLLocationCoordinate2D(latitude: 36.67369970171838, longitude: -121.66506400055484), 
             floor1: "DFirstFloor", floor2: "dn-2", floor3: "dn-3",
             floorRooms: [
                1: (102...130).map { "\($0)" },
                2: [],
                3: []
             ]),
    Building(name: "E-College administration (SOUTH)", coordinate: CLLocationCoordinate2D(latitude: 36.673254242000745, longitude: -121.66498208905819),
            ),
    Building(name: "F-Weightroom", coordinate: CLLocationCoordinate2D(latitude: 36.67297725003378, longitude: -121.66580175962913),
            ),
    Building(name: "G-Auxiliary Gym", coordinate: CLLocationCoordinate2D(latitude: 36.67295469270838, longitude: -121.66608589388693),
            ),
    Building(name: "H-Main Gym", coordinate: CLLocationCoordinate2D(latitude: 36.67269920708268, longitude: -121.66649304498388),
            ),
    Building(name: "J-Visual Arts", coordinate: CLLocationCoordinate2D(latitude: 36.67273971360052, longitude: -121.66775712708673),
            ),
    Building(name: "K-Performing Arts/Music", coordinate: CLLocationCoordinate2D(latitude: 36.673356735548836, longitude: -121.66784404665725),
            ),
    Building(name: "M-Child Development Center", coordinate: CLLocationCoordinate2D(latitude: 36.67392947716946, longitude: -121.66780693539557),
            ),
    Building(name: "N-Merril Hall", coordinate: CLLocationCoordinate2D(latitude: 36.6739748044481, longitude: -121.66697762953319),
            ),
    Building(name: "O-Nursing and Health Sciences", coordinate: CLLocationCoordinate2D(latitude: 36.6727831027284, longitude: -121.66506308004328),
            ),
    Building(name: "P-Fieldhouse", coordinate: CLLocationCoordinate2D(latitude: 36.67328732226996, longitude: -121.67090925251435),
            ),
    Building(name: "Parking", coordinate: CLLocationCoordinate2D(latitude: 36.67479965204058, longitude: -121.6673868789855),
            ),
    Building(name: "S-STEM Center Building", coordinate: CLLocationCoordinate2D(latitude: 36.67348350633714, longitude: -121.66670413623234),
            )
    
    
    
]
