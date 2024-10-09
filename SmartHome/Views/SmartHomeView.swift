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
    @State var listView = true
    @State var smartHomeName = "My Home"
    
//    @State var objects: [SmartDevice] = [
//        SmartDevice(
//            name: "Wohnzimmerlicht",
//            room: .livingRoom,
//            type: .light,
//            isOn: true
//        ),
//        SmartDevice(
//            name: "Heizung",
//            room: .livingRoom,
//            type: .thermostat,
//            isOn: true,
//            temperature: 22
//        ),
//        SmartDevice(
//            name: "Wohnungstür",
//            room: .corridor,
//            type: .lock,
//            isLocked: true
//        )]
        
    
    @State var objects: [SmartDevice] = [
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
    ]
    
    var body: some View {
        VStack{
            HeaderView(smartHomeName: $smartHomeName)
                .fixedSize(horizontal: false, vertical: true)
            ScrollView{
                TexFieldView(itemName: $itemName, objects: $objects)
                //Spacer()
                
                if roomViewVisible{
                    RoomView(roomViewVisible: $roomViewVisible)
                }
                
                if listView {
                    
                    let columns = Array(
                        repeating: GridItem(.flexible()),
                        count: 1
                    )
                    LazyVGrid(columns: columns) {
                        ForEach(objects){ object in
                            ElementView(toggle: true, object: object)
                                .padding(.vertical, 25)
                        }
                        
                    }
                    
//                    ForEach(objects){ object in
//                        ElementView(toggle: true, object: object)
//                            .padding(.vertical, 23)
//                    }
                    
                } else{
                    let columns = Array(
                        repeating: GridItem(.flexible()),
                        count: 2
                    )
                    LazyVGrid(columns: columns) {
                        ForEach(objects){ object in
                            GridElementView(toggle: true, object: object)
                                //.padding(.vertical, 25)
                        }
                        
                    }
                }
                
                
                //Spacer()
            }
            //.padding(.bottom)
            .background(.grayBackground)
            
            Toggle(
                listView ? "Liste anzeigen" : "Raster anzeigen",
                isOn: $listView
            )
            .padding(.horizontal, 25)
            .foregroundStyle(.white)
            Toggle(
                roomViewVisible ? "Raumvorschau anzeigen" : "Raumvorschau ausblenden",
                isOn: $roomViewVisible
            )
            .padding(.horizontal, 25)
            .foregroundStyle(.white)
        }.background(.blueBackground)
    }
}

#Preview {
    SmartHomeView()
}
