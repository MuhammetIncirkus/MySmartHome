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
    @State var smartHomeName = "My Home"
    
    var body: some View {
        VStack{
            HeaderView(smartHomeName: $smartHomeName)
                .fixedSize(horizontal: false, vertical: true)
            VStack{
                TexFieldView(itemName: $itemName, itemName2: $itemName2)
                Spacer()
                
                if roomViewVisible{
                    RoomView(roomViewVisible: $roomViewVisible)
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
