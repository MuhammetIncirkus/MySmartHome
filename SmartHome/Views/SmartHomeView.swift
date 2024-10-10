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
    //            isLocked: false
    //        )]


    @State var objects: [SmartDevice] = [
        SmartDevice(
            name: "Wohnzimmerlicht",
            room: .livingRoom,
            type: .light,
            isOn: true
        ),
        SmartDevice(
            name: "Fernseher",
            room: .livingRoom,
            type: .light,
            isOn: true
        ),
        SmartDevice(
            name: "Ambiente",
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
            name: "Arbeitsplatte",
            room: .kitchen,
            type: .light,
            isOn: false
        ),
        SmartDevice(
            name: "Dunstabzug",
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
            name: "Nachtlicht-Links",
            room: .bedroom,
            type: .light,
            isOn: false
        ),
        SmartDevice(
            name: "Nachtlicht-Rechts",
            room: .bedroom,
            type: .light,
            isOn: false
        ),
        SmartDevice(
            name: "Bürolicht",
            room: .office,
            type: .light,
            isOn: false
        ),
        SmartDevice(
            name: "Schreibtisch",
            room: .office,
            type: .light,
            isOn: false
        ),
        SmartDevice(
            name: "Kinderzimmer",
            room: .childrenRoom,
            type: .light,
            isOn: false
        ),
        SmartDevice(
            name: "Nachtlicht",
            room: .childrenRoom,
            type: .light,
            isOn: false
        ),
        SmartDevice(
            name: "Flurlicht",
            room: .corridor,
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
            room: .kitchen,
            type: .thermostat,
            isOn: true,
            temperature: 22
        ),
        SmartDevice(
            name: "Heizung",
            room: .bathroom,
            type: .thermostat,
            isOn: true,
            temperature: 22
        ),
        SmartDevice(
            name: "Heizung",
            room: .corridor,
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
        SmartDevice(
            name: "Schlafzimmertür",
            room: .bedroom,
            type: .lock,
            isLocked: true
        ),
        SmartDevice(
            name: "Küchentür",
            room: .kitchen,
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
                
                if roomViewVisible{
                    RoomView(
                        roomViewVisible: $roomViewVisible,
                        objects: $objects
                    )
                } else {
                    if listView {
                        LazyVGrid(columns: [GridItem(.flexible())]) {
                            ForEach($objects){ $object in
                                ElementView(
                                    objects: $objects, object: $object
                                )
                                .padding(.vertical, 25)
                            }
                        }.padding(.bottom, 25)
                    } else{
                        let columns = Array(
                            repeating: GridItem(.flexible()),
                            count: 2
                        )
                        LazyVGrid(columns: columns) {
                            ForEach($objects){ $object in
                                GridElementView(object: $object)
                                //.padding(.vertical, 25)
                            }
                        }
                    }
                }
            }
            .background(.grayBackground)
            
            if !roomViewVisible{
                Toggle(
                    listView ? "Liste anzeigen" : "Raster anzeigen",
                    isOn: $listView
                )
                .padding(.horizontal, 25)
                .foregroundStyle(.white)
            }
            
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
