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
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    
                    .cornerRadius(30)
                    .formStyle(.columns)
                Button("Hinzufügen"){
                    itemName2 = itemName
                }
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(Capsule())
                
            }
            Text(itemName2).foregroundStyle(.white)
        }
        .padding()
        .background(.grayBackground)
    }
    
}

#Preview {
    TexFieldView(itemName: .constant(""), itemName2: .constant(""))
}
