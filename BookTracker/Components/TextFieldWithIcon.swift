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
                .frame(width: 20, height: 20)
                .foregroundColor(.blue)
            TextField(placeholder, text: $text)
                .padding(.all, 10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}


//#Preview {
//    TextFieldWithIcon()
//}
