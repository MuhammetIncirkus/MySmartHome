//
//  RoomView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 07.10.24.
//

import SwiftUI

//struct RoomView: View {
//    
//    var image: String = "childroom"
//    
//    var body: some View {
//        ZStack(alignment: .topTrailing){
//            Image(image)
//                .resizable()
//                .scaledToFill()
//                .cornerRadius(20)
//                .frame(width: 320,height: 180)
//                .padding()
//                .shadow(radius: 10)
//            Button {
//                
//            } label: {
//                Image(systemName: "arrow.down.right.and.arrow.up.left")
//                    .padding()
//                    .foregroundStyle(.red)
//                    
//            }
//
//            
//        }.frame(width: 320,height: 180)
//
//    }
//}

struct RoomView: View {
    
    var image: String = "bath"
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
                .shadow(radius: 10)
            
            Button(action: {
                roomViewVisible.toggle()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.red)
                    .background(Color.black.opacity(0.7))
                    .clipShape(Circle())
            }
            .padding([.top, .trailing], 30)
        }
        
    }
}


#Preview {
    RoomView(roomViewVisible: .constant(true))
}
