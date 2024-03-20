//
//  HarassmentView.swift
//  HostelBuddyUser
//
//  Created by shikhar on 19/03/24.
//

import SwiftUI

struct HarassmentView: View {
    @State private var name = ""
    @State private var regNo = ""
    @State private var mailVIT = ""
    @State private var roomNo = ""
    @State private var selectedBlock = "MH-A"
    @State private var description = ""
    @State private var otpView = false

    let block = ["MH-A", "MH-B", "MH-C", "MH-D", "MH-E", "MH-F", "MH-G", "MH-H", "MH-J", "MH-K", "MH-L", "MH-M", "MH-N", "MH-P", "MH-Q", "MH-R", "MH-S", "MH-T"]
    var body: some View {
        
        VStack {
            
            Divider()
                .padding(.bottom)
            
            VStack(alignment: .leading) {
                
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
                }
                
                
                VStack(alignment: .leading) {
                    
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
                    
                }
                
                
                VStack(alignment: .leading) {
                   
                    Text("VIT mail id")
                        .padding(.horizontal, 2)
                    
                    TextField(text: $mailVIT){
                        Text("abc.xyz2021\("@")vitstudent.ac.in")
                        
                    }
                    .padding()
                    .autocapitalization(.none)
                    .frame(width: UIScreen.main.bounds.width - 90, height: 50)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4))
                    }
        
                }
                
                VStack(alignment: .leading) {
                    
                    Text("Room Number")
                        .padding(.horizontal, 2)
                        
                    TextField(text: $roomNo){
                        Text("For ex: - 241, 512, etc.")
                            
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 90, height: 50)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4))
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Problem Description")
                        .padding(.horizontal, 2)
                    
                    TextField(text: $description){
                        Text("Description")
                        
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 90, height: 50)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4))
                    }
                }
                
                HStack {
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
            
            }
            
            Spacer()
            
            Button("Submit") {
                HarassmentViewModel.getHarassmentOTP(complaintbody: HarassmentUserModel(name: name, regNo: regNo, mailVIT: mailVIT, roomNo: roomNo, selectedBlock: selectedBlock, description: description))
                otpView.toggle()
            }
            
            Spacer()
            
        }
        .navigationTitle("Report Harassment")
        .fullScreenCover(isPresented: $otpView, content: {
            OTPHarassmentView(numberOfFields: 6, complaintbody: HarassmentUserModel(name: name, regNo: regNo, mailVIT: mailVIT, roomNo: roomNo, selectedBlock: selectedBlock, description: description))
        })
        
    }
}

#Preview {
    HarassmentView()
}
