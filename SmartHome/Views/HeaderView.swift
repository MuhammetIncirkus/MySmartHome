//
//  HeaderView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 07.10.24.
//

import SwiftUI

struct HeaderView: View {
    
    @State var smartHomeName = "My Home"
    @Binding var roomViewVisible: Bool
    var body: some View {
        HStack{
            Text(smartHomeName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.blueBackground)
            Toggle(
                roomViewVisible ? "Listen" : "Räume",
                isOn: $roomViewVisible
            )
            .padding(.horizontal, 25)
            .foregroundStyle(.white)
            .frame(width: 175)
        }
        
    }
}

#Preview {
    HeaderView(
        roomViewVisible: .constant(true)
    )
}
