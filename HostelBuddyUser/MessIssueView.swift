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
    @State private var messType = ""
    @State private var mailVIT = ""
    @State private var messBlock = ""
    @State private var description = ""

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
                    .frame(width: UIScreen.main.bounds.width - 90, height: 50)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4))
                    }
        
                }
                
            VStack(alignment: .leading) {
                
                Text("Mess Hostel Block")
                    .padding(.horizontal, 2)
                    
                TextField(text: $messType){
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
                
                Picker("Select your Mess Typek", selection: $messBlock) {
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
                
            }
            
            Spacer()
            
        }
        .navigationTitle("Report Mess Issue")
        
    }
}

#Preview {
    MessIssueView()
}
