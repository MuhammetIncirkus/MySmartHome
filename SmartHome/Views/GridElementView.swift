//
//  GridElementView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 08.10.24.
//

import SwiftUI

struct GridElementView: View {
    
//    @State var toggle: Bool
    @Binding var object: SmartDevice
    
    var body: some View {
        VStack{
            Text(object.type.rawValue == "Heizung" ?  object.temperature.description + " °C" : object.name)
                .foregroundStyle(.white)
                .font(
                    object.type.rawValue == "Heizung" ? .title : .subheadline
                )
                .fontWeight(
                    object.type.rawValue == "Heizung" ? .bold : .light
                )
            
                switch object.type {
                case .lock:
                    Image(systemName: object.isLocked ? "door.left.hand.closed" : "door.left.hand.open")
                        .padding()
                        .font(.title)
                        .foregroundStyle(object.isLocked ? .red : .green)
                        .contentTransition(.symbolEffect(.replace.offUp))
                        .onTapGesture{
                            object.isLocked.toggle()
                        }
                case .thermostat:
                    HStack{
                        Stepper(
                            "",
                            value: $object.temperature,
                            in: 15...30,
                            step: 0.5
                        )

                    }
                    
                case .light:
                    Image(systemName: object.isOn ? "lightbulb.fill" : "lightbulb")
                        .padding()
                        .font(.title)
                        .foregroundStyle(object.isOn ? .yellow : .white)
                        .contentTransition(.symbolEffect(.replace.offUp))
                        .onTapGesture{
                            object.isOn.toggle()
                        }
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
    GridElementView(object: .constant(SmartDevice(
        name: "String",
        room: Rooms.livingRoom,
        type: DeviceType.thermostat,
        isOn: true,
        temperature: 20.0,
        isLocked: false
    )) )
    
    
}
