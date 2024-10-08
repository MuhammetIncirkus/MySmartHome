//
//  ChooseDeviceTypePicker.swift
//  SmartHome
//
//  Created by Muhammet Incirkus on 08.10.24.
//

import SwiftUI

struct ChooseDeviceTypePickerView: View {
    
    @Binding var selectedDeviceType: DeviceType
    
    var body: some View {
        Picker("Device Type", selection: $selectedDeviceType) {
            ForEach(DeviceType.allCases) { deviceType in
                Text(deviceType.rawValue)
            }
        }
    }
}

#Preview {
    ChooseDeviceTypePickerView(selectedDeviceType: .constant(.light))
}
