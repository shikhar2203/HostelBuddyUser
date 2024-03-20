//
//  MessIssueView.swift
//  HostelBuddyUser
//
//  Created by shikhar on 19/03/24.
//

import SwiftUI

struct MessIssueView: View {
    @State private var name = ""
    @State private var regNo = ""
    @State private var messType = "Veg Mess"
    @State private var mailVIT = ""
    @State private var messBlock = ""
    @State private var description = ""
    @State private var otpView = false

    let messblocklist = ["Veg Mess", "Non-Veg Mess", "Special Mess"]
    
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
                
                Text("Mess Hostel Block")
                    .padding(.horizontal, 2)
                    
                TextField(text: $messBlock){
                    Text("MH-B, MH-G, etc.")
                        
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width - 90, height: 50)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4))
                }
            }
                
                VStack(alignment: .leading) {
                    Text("Issue Description")
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
                Text("Mess Type")
                    .padding(.horizontal, 2)
                
                Spacer()
                
                Picker("Select your Mess Type", selection: $messType) {
                    ForEach(messblocklist, id: \.self) {
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
                print("\(name)\n\(regNo)\n\(messType)\n\(mailVIT)\n\(messBlock)\n\(description)")
                MessIssueViewModel.getMessIssueOTP(complaintbody: MessIssueUserModel(name: name, regNo: regNo, mailVIT: mailVIT, messBlock: messBlock, description: description, messType: messType))
                otpView.toggle()
            }
            
            Spacer()
            
        }
        .navigationTitle("Report Mess Issue")
        .fullScreenCover(isPresented: $otpView, content: {
            OTPMessIssueView(numberOfFields: 6, complaintbody: MessIssueUserModel(name: name, regNo: regNo, mailVIT: mailVIT, messBlock: messBlock, description: description, messType: messType))
        })
        
    }
}

#Preview {
    MessIssueView()
}
