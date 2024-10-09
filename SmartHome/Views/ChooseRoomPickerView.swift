//
//  ChooseRoomPickerView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 08.10.24.
//

import SwiftUI

struct ChooseRoomPickerView: View {
    
    @Binding var selectedRoom: Rooms
    
    var body: some View {
        Picker("Room", selection: $selectedRoom) {
            ForEach(Rooms.allCases) { room in
                Text(room.rawValue).tag(room)
            }
        }
    }
}

#Preview {
    ChooseRoomPickerView(selectedRoom: .constant(.livingRoom))
}
