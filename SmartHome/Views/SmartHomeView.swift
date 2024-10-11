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
    
 
    @State var objects: [SmartDevice]
    

    
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
            HStack{
                Spacer()
                if !roomViewVisible{
                    Toggle(
                        listView ? "Grid" : "Liste",
                        isOn: $listView
                    )
                    .padding(.horizontal, 25)
                    .foregroundStyle(.white)
                    
                    .frame(width: 175)
                }
                
                Toggle(
                    roomViewVisible ? "Listen" : "Räume",
                    isOn: $roomViewVisible
                )
                .padding(.horizontal, 25)
                .foregroundStyle(.white)
                .frame(width: 175)
            }
            
            
        }.background(.blueBackground)
    }
    
}

#Preview {
    SmartHomeView(objects: mockup_objects)
}
