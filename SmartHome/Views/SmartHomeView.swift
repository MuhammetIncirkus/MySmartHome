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
    
    var body: some View {
        TexFieldView(itemName: $itemName, itemName2: $itemName2)
    }
}

#Preview {
    SmartHomeView()
}
