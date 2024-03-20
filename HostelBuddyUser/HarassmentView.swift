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
    @State private var description = ""

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
            
            }
            
            Spacer()
            
            Button("Submit") {
                
            }
            
            Spacer()
            
        }
        .navigationTitle("Report Harassment")
        
    }
}

#Preview {
    HarassmentView()
}
