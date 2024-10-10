//
//  RoomView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 07.10.24.
//

import SwiftUI

struct RoomView: View {
    
    @Binding var roomViewVisible: Bool
    @Binding var objects: [SmartDevice]
    
    var body: some View {
        ScrollView{
            ForEach(Rooms.allCases, id: \.id) { room in
                
                let imageName = imageName(for: room)
                //let imageName = "Room"
                
                VStack{
                    HStack{
                        
                        let filteredDevices = objects.filter {
                            $0.room == room && $0.type == .light
                        }

                        ForEach($objects.filter {
                            $0.room == room && $0.type == .light
                        }) { $device in
                            Image(systemName: device.isOn ? "lightbulb.min.fill" : "lightbulb")
                                .foregroundStyle(device.isOn ? .yellow : .white)
                                .rotationEffect(.degrees(180))
                                .font(.system(size: 25))
                                .onTapGesture {
                                    device.isOn.toggle()
                                }
                        }

                    }
                    .padding(.top, 40)
                    .padding(.horizontal)
                    Spacer()
                    HStack{
                        
                        let filteredDevices = objects.filter {
                            $0.room == room && $0.type == .thermostat
                        }

                        ForEach(filteredDevices) { device in
                            HStack{
                                Text(device.temperature.description + "°C")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 25))
                                Image(systemName: "thermometer.medium")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 25))
                            }
                        }
                    }
                    Spacer()
                    HStack{
                        
                        let filteredDevices = objects.filter {
                            $0.room == room && $0.type == .lock
                        }

                        ForEach(filteredDevices) { device in
                            Image(
                                systemName: device.isLocked ? "door.left.hand.closed" : "door.left.hand.open"
                            )
                            .foregroundStyle(device.isLocked ? .red : .green)
                            .font(.system(size: 25))
                        }
                    }
                    .padding(.bottom, 40)
                    .padding(.horizontal)
                }
                .frame(width: 355, height: 200)
                .cornerRadius(20)
                .padding()
                .background(
                    ZStack(alignment: .topTrailing) {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 355, height: 200)
                            .clipped()
                            .background(.white)
                            .cornerRadius(20)
                            .padding()
                            .shadow(color: .blue ,radius: 10)
                            .opacity(0.2)
                        
                        HStack{
                            Text(room.rawValue)
                                .fontWeight(.bold)
                                .padding([.top, .leading], 30)
                                .foregroundStyle(.white)
                            Spacer()
                        Button(action: {
                            roomViewVisible.toggle()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                                .background(.black)
                                .clipShape(Circle())
                        }
                        .padding([.top, .trailing], 30)
                        }
                    }
                )
            }}
    }
    
    
    func imageName(for room: Rooms) -> String {
            switch room {
            case .kitchen:
                return "kitchen"
            case .livingRoom:
                return "livingroom"
            case .bedroom:
                return "bedroom"
            case .bathroom:
                return "bath"
            case .office:
                return "office"
            case .childrenRoom:
                return "childroom"
            case .corridor:
                return "corridor"
            }
        }
    
    
}


#Preview {
    RoomView(roomViewVisible: .constant(true), objects: .constant([
        SmartDevice(
            name: "Wohnzimmerlicht",
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
            name: "Heizung",
            room: .livingRoom,
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
    ]))
}
