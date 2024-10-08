//
//  ElementView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 07.10.24.
//

import SwiftUI

struct ElementView: View {
    
    @State var toggle: Bool
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center ){
                VStack{
                    Image(systemName: "globe")
                        .padding()
                        .background(.blue)
                    Spacer()
                }
                Spacer()
                VStack{
                    Text("Hello")
                    Text("World!")
                    Text("World!")
                    Text("World!")
                    Text("World!")
                    Text("World!")
                    Text("World!")
                    Text("World!")
                }
                .padding()
                Spacer()
                VStack{
                    Spacer()
                    Image(systemName: "trash")
                        .padding()
                        .background(.blue)
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: geometry.size.width * 0.8)
            .background(.red)
            .cornerRadius(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.2))
            
        }
    }
}

#Preview {
    ElementView(toggle: .random())
}
