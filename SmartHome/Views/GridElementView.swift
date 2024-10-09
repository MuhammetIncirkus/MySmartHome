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
                    Image(systemName: object.isLocked ? "door.left.hand.closed" : "door.left.hand.open")
                        .padding()
                        .font(.title)
                        .foregroundStyle(object.isLocked ? .red : .green)
                case .thermostat:
                    HStack{
                        Image(systemName: "thermometer.medium")
                            .padding()
                            .font(.title)
                            .foregroundStyle(.white)
                        Text(object.temperature.description + "°C")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.light)
                    }
                    
                case .light:
                    Image(systemName: object.isOn ? "lightbulb.min.fill" : "lightbulb")
                        .padding()
                        .font(.title)
                        .foregroundStyle(object.isOn ? .yellow : .white)
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
        .shadow(color: .blue ,radius: 10)
    }
}

#Preview {
    GridElementView(toggle: .random(), object: SmartDevice(name: "String", room: Rooms.livingRoom, type: DeviceType.lock, isLocked: true) )
}
