//
//  ComplainView.swift
//  HostelBuddyUser
//
//  Created by shikhar on 19/03/24.
//

import SwiftUI

struct ComplainView: View {
    
    @State private var name = ""
    @State private var regNo = ""
    @State private var roomNo = ""
    @State private var mailVIT = ""
    @State private var selectedBlock = "MH-A"
    @State private var issueType = "Washroom"
    @State private var description = ""
    @State private var otpView = false

    let block = ["MH-A", "MH-B", "MH-C", "MH-D", "MH-E", "MH-F", "MH-G", "MH-H", "MH-J", "MH-K", "MH-L", "MH-M", "MH-N", "MH-P", "MH-Q", "MH-R", "MH-S", "MH-T"]
    let issue = ["Washroom", "Room", "other"]
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
                
            HStack{
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
            
            }
            
            Spacer()
            
            Button("Submit") {
                ComplaintViewModel.getOTP(complaintbody: ComplaintUserModel(name: self.name, regNo: self.regNo, roomNo: self.roomNo, mailVIT: self.mailVIT, selectedBlock: self.selectedBlock, issueType: self.issueType, description: self.description))
                
                otpView.toggle()
            }
            
            Spacer()
            
        }
        .navigationTitle("Submit a Complain")
        .fullScreenCover(isPresented: $otpView, content: {
            OTPEnterView(numberOfFields: 6, complaintbody: ComplaintUserModel(name: self.name, regNo: self.regNo, roomNo: self.roomNo, mailVIT: self.mailVIT, selectedBlock: self.selectedBlock, issueType: self.issueType, description: self.description))
        })
        
    }
}

#Preview {
    ComplainView()
}
