//
//  ElementView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 07.10.24.
//

import SwiftUI

struct ElementView: View {
    
//    @State var toggle: Bool
    @Binding var objects: [SmartDevice]
    @Binding var object: SmartDevice
    
    var body: some View {
        GeometryReader { geometry in
            
            HStack(alignment: .center ){
                VStack{
                    switch object.type {
                    case .lock:
                        Image(systemName: object.isLocked ? "door.left.hand.closed" : "door.left.hand.open")
                            .padding()
                            .foregroundStyle(object.isLocked ? .red : .green)
                            .contentTransition(.symbolEffect(.replace.offUp))
                    case .thermostat:
                        Image(systemName: "thermometer.medium")
                            .padding()
                            .foregroundStyle(.white)
                    case .light:
                        Image(systemName: object.isOn ? "lightbulb.fill" : "lightbulb")
                            .padding()
                            .foregroundStyle(object.isOn ? .yellow : .white)
                            .contentTransition(.symbolEffect(.replace.offUp))
                    case .power:
                        Image(systemName: "powerplug.portrait.fill")
                            .padding()
                            .foregroundStyle(object.isOn ? .green : .red)
                            .contentTransition(.symbolEffect(.replace.offUp))
                            .opacity(0.8)
                    case .sensor:
                        Image(systemName: object.motion ? "sensor.fill" : "sensor")
                            .padding()
                            .foregroundStyle(object.motion ? .blue : .white)
                            .contentTransition(.symbolEffect(.replace.offUp))
                    }
                    
                }
                VStack(alignment: .leading){
                    Text(
                        object.type.rawValue == "Heizung" ?  object.temperature.description + " °C" : object.name
                    )
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(object.room.rawValue)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                VStack{
                    switch object.type {
                    case .lock:
                        Button(action: {
                            object.isLocked.toggle()
                            },
                               label: {
                                    Image(systemName: object.isLocked ? "lock" : "lock.open")
                                .frame(width: 30)
                            })
                            .buttonStyle(.borderedProminent)
                            .tint(object.isLocked ? .red : .green)
                            .opacity(0.8)
                            .contentTransition(.symbolEffect(.replace.offUp))

                    case .thermostat:
                        Slider(
                            value: $object.temperature, in: 15...30, step: 0.5)
                        .frame(maxWidth: 150)

                    case .light:
                        Toggle(object.isOn ? "" : "", isOn: $object.isOn)
                            .frame(width: 40)
                            .padding(.trailing, 12)
                        
                    case .power:
                        Toggle(object.isOn ? "" : "", isOn: $object.isOn)
                            .frame(width: 40)
                            .padding(.trailing, 12)
                    case .sensor:
                        Image(
                            systemName: object.motion ? "sensor.fill" : "sensor"
                        )
                            .padding()
                            .foregroundStyle(object.motion ? .blue : .white)
                            .contentTransition(.symbolEffect(.replace.offUp))
                    }
                    
                }
                
                VStack(alignment: .center){
                    Button {
                        removeObject(object: object)
                    } label: {
                        Image(systemName: "trash.fill")
                            .padding()
                            .foregroundColor(.red)
                    }
                }
            }
            //.fixedSize(horizontal: false, vertical: true)
            .frame(width: geometry.size.width * 0.9, height: 60)
                        .background(.blueBackground)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        //.shadow(color: .blue ,radius: 5)
        }//.padding(.bottom)
    }
    
    
    func removeObject(object: SmartDevice){
        objects.removeAll { SmartDevice in
            SmartDevice.id == object.id
        }
        
    }
    
}

#Preview {
    ElementView(
        
        objects: .constant([SmartDevice(
            name: "String",
            room: Rooms.livingRoom,
            type: DeviceType.lock,
            isLocked: true
        )]),
        object: .constant(SmartDevice(
            name: "String",
            room: Rooms.livingRoom,
            type: DeviceType.sensor,
            isOn: false,
            temperature: 20.0,
            isLocked: false,
            motion: true
        ))
    )
}
