//
//  ElementView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 07.10.24.
//

import SwiftUI

struct ElementView: View {
    
    @State var toggle: Bool
    @Binding var objects: [SmartDevice]
    var object: SmartDevice
    
    var body: some View {
        GeometryReader { geometry in
            
            HStack(alignment: .center ){
                VStack{
                    switch object.type {
                    case .lock:
                        Image(systemName: object.isLocked ? "door.left.hand.closed" : "door.left.hand.open")
                            .padding()
                            .foregroundStyle(object.isLocked ? .red : .green)
                    case .thermostat:
                        Image(systemName: "thermometer.medium")
                            .padding()
                            .foregroundStyle(.white)
                    case .light:
                        Image(systemName: object.isOn ? "lightbulb.min.fill" : "lightbulb")
                            .padding()
                            .foregroundStyle(object.isOn ? .yellow : .white)
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
                        .frame(width: geometry.size.width * 0.9)
                        .background(.blueBackground)
                        .cornerRadius(20)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .shadow(color: .blue ,radius: 5)
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
        toggle: .random(),
        objects: .constant([SmartDevice(
            name: "String",
            room: Rooms.livingRoom,
            type: DeviceType.lock,
            isLocked: true
        )]),
        object: SmartDevice(
            name: "String",
            room: Rooms.livingRoom,
            type: DeviceType.lock,
            isLocked: true
        )
    )
}
