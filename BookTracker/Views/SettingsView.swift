//
//  SettingsView.swift
//  BookTracker
//
//  Created by ivan trj  on 30.11.23.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("darkMode") var isDarkMode = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Appearance") {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                }
                
                Section("About") {
                    Text("This app helps you track the books you are reading, or want to read.")
                }
            }
            .navigationTitle("Settings")
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

#Preview {
    SettingsView()
}
