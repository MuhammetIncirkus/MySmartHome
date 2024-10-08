//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 07.10.24.
//

import SwiftUI

struct SmartHomeView: View {
    
    @State var itemName = ""
    @State var itemName2 = ""
    @State var roomViewVisible = false
    @State var smartHomeName = "My Home"
    
    @State var objects: [SmartDevice] = [
        SmartDevice(name: "Wohnzimmerlicht", room: .livingRoom, type: .light, isOn: false),
        SmartDevice(name: "Heizung", room: .livingRoom, type: .thermostat, isOn: true, temperature: 22),
        SmartDevice(name: "Haustür", room: .corridor, type: .lock, isLocked: false),
    ]
    
    var body: some View {
        VStack{
            HeaderView(smartHomeName: $smartHomeName)
                .fixedSize(horizontal: false, vertical: true)
            ScrollView{
                TexFieldView(itemName: $itemName, itemName2: $itemName2)
                Spacer()
                
                if roomViewVisible{
                    RoomView(roomViewVisible: $roomViewVisible)
                }
                
                ForEach(objects){ object in
                    ElementView(toggle: true, object: object)
                        .padding(.vertical, 25)
                }
                
                Spacer()
            }
            .background(.grayBackground)
            Toggle(
                roomViewVisible ? "Raumvorschau anzeigen" : "Raumvorschau ausblenden",
                isOn: $roomViewVisible
            )
            .padding()
            .foregroundStyle(.white)
        }.background(.blueBackground)
    }
}

#Preview {
    SmartHomeView()
}
