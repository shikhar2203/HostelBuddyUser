//
//  ContentView.swift
//  HostelBuddyUser
//
//  Created by shikhar on 19/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 50) {
                
                NavigationLink("Report for Room Cleaning", destination: RoomCleaningView())
                
                NavigationLink("Submit a Complain", destination: ComplainView())
                
                NavigationLink("Report Harrasment", destination: HarassmentView())
                
                NavigationLink("Report Mess Issue", destination: MessIssueView())
            }
        }
    }
}

#Preview {
    ContentView()
}
