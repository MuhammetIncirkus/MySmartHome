//
//  SmartDevice.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 08.10.24.
//
import SwiftUI

struct SmartDevice: Identifiable {
    let id: UUID = UUID()
    let name: String
    let room: Rooms
    let type: DeviceType
    var isOn: Bool = false
    var temperature: Double = 20.0
    var isLocked: Bool = false
}
