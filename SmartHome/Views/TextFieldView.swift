//
//  TextFieldView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 07.10.24.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var itemName: String
    @Binding var objects: [SmartDevice]
    @State private var selectedDeviceType: DeviceType = .light
    @State private var selectedRoom: Rooms = .livingRoom
    
    var body: some View {
        VStack{
            HStack{
                Text("Raum:").foregroundStyle(.white)
                ChooseRoomPickerView(selectedRoom: $selectedRoom)
                Spacer()
                Text("Typ:").foregroundStyle(.white)
                ChooseDeviceTypePickerView(selectedDeviceType: $selectedDeviceType)
               }
            HStack{
                TextField(
                    "",
                    text: $itemName,
                    prompt: Text("Bitte ein Namen Eingeben")
                        .foregroundStyle(.gray)
                )
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(30)
                    .formStyle(.columns)
                Button("Hinzufügen"){
                    if itemName != "" {
                        let smartDevice: SmartDevice = SmartDevice(
                            name: itemName,
                            room: selectedRoom,
                            type: selectedDeviceType
                        )
                        objects.append(smartDevice)
                        itemName = ""
                    }
                }
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(Capsule())
            }
            
            
        }
        //.padding(.horizontal)
        .padding(.top, 4)
        //.background(.red)
    }
}

#Preview {
    TextFieldView(
        itemName: .constant(""),
        objects: .constant([])
        )
}
