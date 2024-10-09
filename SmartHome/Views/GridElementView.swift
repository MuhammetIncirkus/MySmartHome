//
//  GridElementView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 08.10.24.
//

import SwiftUI

struct GridElementView: View {
    
    @State var toggle: Bool
    var object: SmartDevice
    
    var body: some View {
        VStack{
            Text(object.name)
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.light)
            
                switch object.type {
                case .lock:
                    Image(systemName: object.isLocked ? "lock" : "lock.open")
                        .padding()
                        .contentShape(Circle())
                        .font(.title)
                        .foregroundStyle(.white)
                case .thermostat:
                    Image(systemName: "thermometer")
                        .padding()
                        .contentShape(Circle())
                        .foregroundStyle(.white)
                case .light:
                    Image(systemName: object.isOn ? "lightbulb.max.fill" :"lightbulb")
                        .padding()
                        .contentShape(Circle())
                        .foregroundStyle(.white)
                }
            Text(object.room.rawValue)
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.light)
            
        }
        .fixedSize(horizontal: true, vertical: true)
        .frame(width: 150, height: 150)
        .background(.blueBackground)
        .cornerRadius(20)
        .padding()
    }
}

#Preview {
    GridElementView(toggle: .random(), object: SmartDevice(name: "String", room: Rooms.livingRoom, type: DeviceType.lock, isLocked: true) )
}
