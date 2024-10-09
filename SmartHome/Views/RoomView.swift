//
//  RoomView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 07.10.24.
//

import SwiftUI

struct RoomView: View {
    
    @State var image: String = "livingroom"
    @Binding var roomViewVisible: Bool
    @Binding var objects: [SmartDevice]
    
    var body: some View {
        ScrollView{
            ForEach(Rooms.allCases) { room in
                
                let imageName = imageName(for: room)
                
                VStack{
                    HStack{
                        
                        let filteredDevices = objects.filter {
                            $0.room == room && $0.type == .light
                        }

                        ForEach(filteredDevices) { device in
                            Image(systemName: device.isOn ? "lightbulb.min.fill" : "lightbulb")
                                .foregroundStyle(device.isOn ? .yellow : .white)
                                .rotationEffect(.degrees(180))
//                                .onTapGesture {
//                                    device.isOn.toggle()
//                                }
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
                            VStack{
                                
                                Text(device.temperature.description)
                                    .foregroundStyle(.white)
                            Image(systemName: "thermometer.medium").foregroundStyle(.white)
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
                        }
                    }
                    .padding(.bottom, 40)
                    .padding(.horizontal)
                }
                .frame(width: 200, height: 355)
                .cornerRadius(20)
                .padding()
                .background(
                    ZStack(alignment: .topTrailing) {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 355)
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
                                .foregroundStyle(.black)
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
    RoomView(roomViewVisible: .constant(true),objects: .constant([]))
}
