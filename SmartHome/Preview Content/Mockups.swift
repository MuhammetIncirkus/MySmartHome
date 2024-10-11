//
//  Mockups.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 11.10.24.
//
import SwiftUI

var mockup_objects: [SmartDevice] = [
    SmartDevice(
        name: "Wohnzimmerlicht",
        room: .livingRoom,
        type: .light,
        isOn: true
    ),
    SmartDevice(
        name: "Fernseher",
        room: .livingRoom,
        type: .light,
        isOn: true
    ),
    SmartDevice(
        name: "Ambiente",
        room: .livingRoom,
        type: .light,
        isOn: true
    ),
    SmartDevice(
        name: "Küchenlicht",
        room: .kitchen,
        type: .light,
        isOn: false
    ),
    SmartDevice(
        name: "Arbeitsplatte",
        room: .kitchen,
        type: .light,
        isOn: false
    ),
    SmartDevice(
        name: "Dunstabzug",
        room: .kitchen,
        type: .light,
        isOn: false
    ),
    SmartDevice(
        name: "Badezimmerlicht",
        room: .bathroom,
        type: .light,
        isOn: true
    ),
    SmartDevice(
        name: "Schlafzimmerlicht",
        room: .bedroom,
        type: .light,
        isOn: false
    ),
    SmartDevice(
        name: "Nachtlicht-Links",
        room: .bedroom,
        type: .light,
        isOn: false
    ),
    SmartDevice(
        name: "Nachtlicht-Rechts",
        room: .bedroom,
        type: .light,
        isOn: false
    ),
    SmartDevice(
        name: "Bürolicht",
        room: .office,
        type: .light,
        isOn: false
    ),
    SmartDevice(
        name: "Schreibtisch",
        room: .office,
        type: .light,
        isOn: false
    ),
    SmartDevice(
        name: "Kinderzimmer",
        room: .childrenRoom,
        type: .light,
        isOn: false
    ),
    SmartDevice(
        name: "Nachtlicht",
        room: .childrenRoom,
        type: .light,
        isOn: false
    ),
    SmartDevice(
        name: "Flurlicht",
        room: .corridor,
        type: .light,
        isOn: false
    ),
    SmartDevice(
        name: "Heizung",
        room: .livingRoom,
        type: .thermostat,
        isOn: true,
        temperature: 22
    ),
    SmartDevice(
        name: "Heizung",
        room: .kitchen,
        type: .thermostat,
        isOn: true,
        temperature: 22
    ),
    SmartDevice(
        name: "Heizung",
        room: .bathroom,
        type: .thermostat,
        isOn: true,
        temperature: 22
    ),
    SmartDevice(
        name: "Heizung",
        room: .corridor,
        type: .thermostat,
        isOn: true,
        temperature: 22
    ),
    SmartDevice(
        name: "Heizung",
        room: .bedroom,
        type: .thermostat,
        isOn: true,
        temperature: 18
    ),
    SmartDevice(
        name: "Heizung",
        room: .office,
        type: .thermostat,
        isOn: true,
        temperature: 20
    ),
    SmartDevice(
        name: "Heizung",
        room: .childrenRoom,
        type: .thermostat,
        isOn: true,
        temperature: 22
    ),
    SmartDevice(
        name: "Wohnungstür",
        room: .corridor,
        type: .lock,
        isLocked: true
    ),
    SmartDevice(
        name: "Wohnzimmertür",
        room: .livingRoom,
        type: .lock,
        isLocked: false
    ),
    SmartDevice(
        name: "Badezimmertür",
        room: .bathroom,
        type: .lock,
        isLocked: true
    ),
    SmartDevice(
        name: "Kinderzimmertür",
        room: .childrenRoom,
        type: .lock,
        isLocked: false
    ),
    SmartDevice(
        name: "Bürotür",
        room: .office,
        type: .lock,
        isLocked: true
    ),
    SmartDevice(
        name: "Schlafzimmertür",
        room: .bedroom,
        type: .lock,
        isLocked: true
    ),
    SmartDevice(
        name: "Küchentür",
        room: .kitchen,
        type: .lock,
        isLocked: true
    ),
]
