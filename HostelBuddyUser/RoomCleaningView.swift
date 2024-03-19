//
//  RoomCleaningView.swift
//  HostelBuddyUser
//
//  Created by shikhar on 19/03/24.
//

import SwiftUI

struct RoomCleaningView: View {
    @State private var name = ""
    @State private var regNo = ""
    @State private var mailVIT = ""
    @State private var selectedBlock = ""
    @State private var issueType = ""

    let block = ["MH-A", "MH-B", "MH-C", "MH-D", "MH-E", "MH-F", "MH-G", "MH-H", "MH-J", "MH-K", "MH-L", "MH-M", "MH-N", "MH-P", "MH-R", "MH-Q", "MH-S", "MH-T"]
    let issue = ["Washroom", "Room", "other"]
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Name")
                .padding(.horizontal, 2)
            
            TextField(text: $name){
                Text("Name")
                
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 90, height: 50)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray4))
            }
            
            Text("Registration Number")
                .padding(.horizontal, 2)
            
            TextField(text: $regNo){
                Text("For ex: - 21BCE0001")
                
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 90, height: 50)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray4))
            }
            
            Text("VIT mail id")
                .padding(.horizontal, 2)
            
            TextField(text: $mailVIT){
                Text("abc.xyz2021\("@")vitstudent.ac.in")
                
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 90, height: 50)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray4))
            }
            
            
        VStack {
            Text("Men's Hostel Block")
                .padding(.horizontal, 2)
            
            Spacer()
            
            Picker("Select your Block", selection: $selectedBlock) {
                ForEach(block, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)
            
        }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 90, height: 50)
//            .overlay {
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color(.systemGray4))
//            }
            VStack{
                Text("Issue Type")
                    .padding(.horizontal, 2)
                
                Spacer()
                
                Picker("Select your Issue Type", selection: $issueType) {
                    ForEach(issue, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 90, height: 50)
//            .overlay {
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color(.systemGray4))
//            }
        }
    }
}

#Preview {
    RoomCleaningView()
}
