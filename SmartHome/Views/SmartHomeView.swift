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
    
    var body: some View {
        TexFieldView(itemName: $itemName, itemName2: $itemName2)
        Spacer()
        
        if roomViewVisible{
            RoomView()
        }
        Spacer()
        Toggle(
            roomViewVisible ? "Raumvorschau anzeigen" : "Raumvorschau ausblenden",
            isOn: $roomViewVisible
        )
        .padding()
    }
}

#Preview {
    SmartHomeView()
}
