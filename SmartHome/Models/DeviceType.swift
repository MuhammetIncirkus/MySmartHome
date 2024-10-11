//
//  DeviceType.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 08.10.24.
//

enum DeviceType: String, CaseIterable, Identifiable {
    case light = "Licht"
    case lock = "Türschloss"
    case thermostat = "Heizung"
//    case other = "Sonstiges"
    
    var id: Self { self }
}
