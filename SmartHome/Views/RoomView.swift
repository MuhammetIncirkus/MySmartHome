//
//  RoomView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 07.10.24.
//

import SwiftUI

struct RoomView: View {
    
    var image: String = "childroom"
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .cornerRadius(20)
            .frame(width: 400,height: 300)
            .padding()
            .shadow(radius: 10)
    }
}

#Preview {
    RoomView()
}
