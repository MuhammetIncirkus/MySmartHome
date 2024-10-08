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
                TextField(
                    "",
                    text: $itemName,
                    prompt: Text("Bitte ein Namen Eingeben")
                        .foregroundStyle(.gray)
                )
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
    }
}

#Preview {
    TexFieldView(itemName: .constant(""), itemName2: .constant(""))
}
