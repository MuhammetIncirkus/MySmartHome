//
//  RoomView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 07.10.24.
//

import SwiftUI

struct RoomView: View {
    
    var image: String = "livingroom"
    @Binding var roomViewVisible: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 355)
                .clipped()
                .cornerRadius(20)
                .padding()
                .shadow(color: .blue ,radius: 10)
            
            Button(action: {
                roomViewVisible.toggle()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.red)
                    .background(.black)
                    .clipShape(Circle())
            }
            .padding([.top, .trailing], 30)
        }
        
    }
}


#Preview {
    RoomView(roomViewVisible: .constant(true))
}
