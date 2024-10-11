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
    let gradient = Gradient(colors: [.blue, .green, .yellow, .orange, .red])
    
    var body: some View {
        ScrollView{
            ForEach(Rooms.allCases, id: \.id) { room in
                
                let imageName = imageName(for: room)
                //let imageName = "Room"
                HStack{
                    
                    VStack{
                        Spacer()
                        ForEach($objects) { $device in
                            if(
                                $device.wrappedValue.room == room && $device.wrappedValue
                                    .type == .thermostat){
                                
                                
                                Gauge(
                                    value: $device.wrappedValue.temperature,
                                    in: 15.0...30.0) {
                                        Text("")
                                    } currentValueLabel: {
                                        Text (
                                            $device.wrappedValue.temperature.description
                                        ).foregroundStyle(.white)
                                    } minimumValueLabel: {
                                        Text ("15").foregroundStyle(.white)
                                    }
                                maximumValueLabel: {
                                    Text ("30").foregroundStyle(.white)
                                }
                                .gaugeStyle(.accessoryCircular)
                                .tint(gradient)
                                .padding(.top, 30)
                                
                                Stepper(
                                    "",
                                    value: $device.temperature,
                                    in: 15...30,
                                    step: 0.5
                                )
                                
                                .frame(width: 100)
                                
                            }
                        }
                        Spacer()
                    }
                    .padding(.leading, 30)
                    Spacer()
                    VStack{
                        HStack{
                            ForEach($objects) { $device in
                                if(
                                    $device.wrappedValue.room == room && $device.wrappedValue
                                        .type == .light){
                                    Image(systemName: $device.wrappedValue.isOn ? "lightbulb.fill" : "lightbulb")
                                        .foregroundStyle($device.wrappedValue.isOn ? .yellow : .white)
                                        .rotationEffect(.degrees(180))
                                        .font(.system(size: 25))
                                        .onTapGesture {
                                            $device.wrappedValue.isOn.toggle()
                                        }
                                }
                            }
                            
                        }
                        .padding(.top, 40)
                        .padding(.horizontal)
                        Spacer()
                        
                        HStack{
                            ForEach($objects) { $device in
                                if(
                                    $device.wrappedValue.room == room && $device.wrappedValue
                                        .type == .power){
                                    Image(systemName: "powerplug.portrait.fill")
                                        .foregroundStyle($device.wrappedValue.isOn ? .green : .red)
                                        .font(.system(size: 25))
                                        .onTapGesture {
                                            $device.wrappedValue.isOn.toggle()
                                        }
                                }
                            }
                            
                        }.padding(.horizontal)
                        Spacer()
                        HStack{
                            ForEach($objects) { $device in
                                if(
                                    $device.wrappedValue.room == room && $device.wrappedValue
                                        .type == .lock){
                                    Image(
                                        systemName: $device.wrappedValue.isLocked ? "door.left.hand.closed" : "door.left.hand.open"
                                    )
                                    .foregroundStyle($device.wrappedValue.isLocked ? .red : .green)
                                    .font(.system(size: 25))
                                    .onTapGesture {
                                        $device.wrappedValue.isLocked.toggle()
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 40)
                        .padding(.horizontal)
                    }
                    Spacer()
                }
                .frame(width: .infinity, height: 200)
                .cornerRadius(20)
                .padding()
                .background(
                    ZStack(alignment: .topTrailing) {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: .infinity, height: 200)
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
    RoomView(roomViewVisible: .constant(true), objects: .constant(mockup_objects))
}
