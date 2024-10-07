//
//  TexFieldView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 07.10.24.
//

import SwiftUI

struct TexFieldView: View {
    
    @Binding var itemName: String
    @Binding var itemName2: String
    
    var body: some View {
        VStack{
            HStack{
                TextField("Bitte ein Namen Eingeben", text: $itemName)
                Button("Hinzufügen"){
                    itemName2 = itemName
                }
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(Capsule())
                
            }
            Text(itemName2)
        }.padding()
    }
    
}

#Preview {
    TexFieldView(itemName: .constant(""), itemName2: .constant(""))
}
