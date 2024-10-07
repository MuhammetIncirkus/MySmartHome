//
//  HeaderView.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 07.10.24.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var smartHomeName: String
    var body: some View {
        Text(smartHomeName)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.blueBackground)
    }
}

#Preview {
    HeaderView(smartHomeName: .constant("My Home"))
}
