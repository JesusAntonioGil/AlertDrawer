//
//  ContentView.swift
//  AlertDrawer
//
//  Created by Jesus Antonio Gil on 3/4/25.
//

import SwiftUI


struct ContentView: View {
    @State private var config: DrawerConfig = .init()
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                DrawerButton(title: "Continue", config: $config)
            }
            .padding(15)
            .navigationTitle("Alert Drawer")
        }
        .alertDrawer(config: $config, primaryTitle: "Continue", secondaryTitle: "Cancel") {
            return false
        } onSecondaryClick: {
            return true
        } content: {
            VStack(alignment: .leading, spacing: 15) {
                Image(systemName: "exclamationmark.circle")
                    .font(.largeTitle)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Are you sure?")
                    .font(.title2.bold())
                
                Text("You haven´t backed up your wallet yet. \nIf you remove it, you could lose access forever. We suggest tapping Cancel and backing up your wallet first with a valid recovery method.")
                    .foregroundStyle(.gray)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 300)
            }
        }

    }
}


#Preview {
    ContentView()
}
