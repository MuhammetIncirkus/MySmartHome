//
//  ElementView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 07.10.24.
//

import SwiftUI

struct ElementView: View {
    
    @State var toggle: Bool
    var object: SmartDevice
    
    var body: some View {
        GeometryReader { geometry in
            
            
//            HStack(alignment: .center ){
//                VStack{
//                    Image(systemName: "globe")
//                        .padding()
//                        .background(.blue)
//                        .contentShape(Circle())
//                    Spacer()
//                }
//                Spacer()
//                VStack{
//                    Text("Hello")
//                    Text("World!")
//                    Text("World!")
//                    Text("World!")
//                    Text("World!")
//                    Text("World!")
//                    Text("World!")
//                    Text("World!")
//                }
//                .padding()
//                Spacer()
//                VStack{
//                    Spacer()
//                    Image(systemName: "trash")
//                        .padding()
//                        .background(.blue)
//                }
//            }
//            .fixedSize(horizontal: false, vertical: true)
//            .frame(width: geometry.size.width * 0.8)
//            .background(.red)
//            .cornerRadius(20)
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.gray.opacity(0.2))
            
            
            HStack(alignment: .center ){
                VStack{
                    switch object.type {
                    case .lock:
                        Image(systemName: "door.right.hand.closed")
                            .padding()
                            .contentShape(Circle())
                    case .thermostat:
                        Image(systemName: "thermometer")
                            .padding()
                            .contentShape(Circle())
                    case .light:
                        Image(systemName: "lightbulb")
                            .padding()
                            .contentShape(Circle())
                    }
                    
                }
                VStack(alignment: .leading){
                    Text(object.name)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(object.room.rawValue)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                VStack(alignment: .trailing){
                    switch object.type {
                    case .lock:
                        Image(systemName: object.isLocked ? "lock" : "lock.open")
                            .padding()
                            .contentShape(Circle())

                    case .thermostat:

                        Image(systemName: "thermometer")
                            .padding()
                            .contentShape(Circle())
                    case .light:
                        Image(systemName: object.isOn ? "lightbulb.max.fill" :"lightbulb")
                            .padding()
                            .contentShape(Circle())

                    }
                }
            }
            .fixedSize(horizontal: false, vertical: true)
                        .frame(width: geometry.size.width * 0.9)
                        .background(.blueBackground)
                        .cornerRadius(20)
                        .frame(maxWidth: .infinity)
                        .padding()
                        
        }
    }
}

#Preview {
    ElementView(toggle: .random(), object: SmartDevice(name: "String", room: Rooms.livingRoom, type: DeviceType.lock, isLocked: true) )
}
