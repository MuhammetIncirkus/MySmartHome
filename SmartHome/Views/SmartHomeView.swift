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
    @State var roomViewVisible = true
    @State var textViewVisible = false
    @State var listView = true
    
    @State private var selectedRoom: Rooms? = nil
    @State private var selectedType: DeviceType? = nil
    @State var objects: [SmartDevice]
    

    
    var body: some View {
        VStack{
            HeaderView(
                roomViewVisible: $roomViewVisible
            )
                .fixedSize(horizontal: false, vertical: true)
            ScrollView{
                if textViewVisible{
                    TextFieldView(itemName: $itemName, objects: $objects)
                        .padding()
                }
                //TextFieldView(itemName: $itemName, objects: $objects)
            
                if roomViewVisible{
                    RoomView(roomViewVisible: $roomViewVisible,objects: $objects)
                } else {
                    if listView {
                        LazyVGrid(columns: [GridItem(.flexible())]) {
                            ForEach($objects){ $object in
                                if(
                                    (selectedRoom == nil || $object.wrappedValue.room == selectedRoom!) && (
                                        selectedType == nil || $object.wrappedValue.type == selectedType!)
                                ){
                                    ElementView(objects: $objects, object: $object)
                                    .padding(.vertical, 25)
                                }
                            }
                        }.padding(.bottom, 25)
                     } else{
                        let columns = Array(
                            repeating: GridItem(.flexible()),
                            count: 2
                        )
                        LazyVGrid(columns: columns) {
                            ForEach($objects){ $object in
                                if(
                                    (selectedRoom == nil || $object.wrappedValue.room == selectedRoom!) && (
                                        selectedType == nil || $object.wrappedValue.type == selectedType!)
                                ){
                                    GridElementView(object: $object)
                                    //.padding(.vertical, 25)
                                }
                                
                            }
                        }
                    }
                }
            }
            .frame(width: .infinity)
            .background(.graybackground)
            .refreshable {
                textViewVisible.toggle()
            }
            //.background(.grayBackground)
            
            if !roomViewVisible{
                HStack{
                    //Text("Filter: ").foregroundStyle(.white)
                    Picker("Room", selection: $selectedRoom) {
                        Text("Alle Räume").tag(Rooms?.none)
                        ForEach(Rooms.allCases) { room in
                            Text(room.rawValue).tag(room as Rooms?)
                        }
                    }.accentColor(.white)
                    Picker("Typ", selection: $selectedType) {
                        Text("Alle Objekte").tag(DeviceType?.none)
                        ForEach(DeviceType.allCases) { device in
                            Text(device.rawValue).tag(device as DeviceType?)
                        }
                    }.accentColor(.white)
                    
                    Spacer()
                    Toggle(isOn: $listView) {
                        Image(
                            systemName: listView ? "list.bullet" : "square.grid.2x2.fill"
                        )
                        .foregroundStyle(.white)
                    }.frame(width: 90)
                        

                }.padding(.horizontal)
            }
            
            
        }.background(.blueBackground)
    }
    
}

#Preview {
    SmartHomeView(objects: mockup_objects)
}
