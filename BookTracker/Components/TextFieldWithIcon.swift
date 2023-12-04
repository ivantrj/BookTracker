//
//  TextFieldWithIcon.swift
//  BookTracker
//
//  Created by ivan trj  on 30.11.23.
//

import SwiftUI

struct TextFieldWithIcon: View {
    var placeholder: String
    @Binding var text: String
    var systemImageName: String

    var body: some View {
        HStack {
            Image(systemName: systemImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .foregroundStyle(.secondary)
            TextField(placeholder, text: $text)
                .padding(.all, 20)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(16)
        }
        .padding(.horizontal)
    }
}


//#Preview {
//    TextFieldWithIcon()
//}
