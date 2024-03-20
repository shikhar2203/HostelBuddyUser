//
//  OTPEnterView.swift
//  HostelBuddyUser
//
//  Created by shikhar on 20/03/24.
//

import SwiftUI

struct OTPComplaintView: View {
    
    var complaintbody: ComplaintUserModel
    let numberOfFields: Int
    @State var enterValue: [String]
    @FocusState private var fieldFocus: Int?
    @State var oldValue = ""
    
    init(numberOfFields: Int, complaintbody: ComplaintUserModel) {
        self.numberOfFields = numberOfFields
        self.enterValue = Array(repeating: "", count: numberOfFields)
        self.complaintbody = complaintbody
    }
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("Enter the OTP sent to your VIT email id")
                .foregroundStyle(Color.black)
                .padding(.bottom, 20)
            
            HStack {
                
                ForEach(0..<6, id: \.self) { index in
                    TextField("0", text: $enterValue[index], onEditingChanged: { editing in
                        if editing {
                            oldValue = enterValue[index]
                        }
                    })
                        .keyboardType(.numberPad)
                        .modifier(OTPEnterBoxStyle())
                        .focused($fieldFocus, equals: index)
                        .tag(index)
                        .onChange(of: enterValue[index]) { oldValue, newValue in
                            
                            if enterValue[index].count > 1 {
                                let currentValue = Array(enterValue[index])
                                
                                if currentValue[0] == Character(oldValue){
                                    enterValue[index] = String(enterValue[index].suffix(1))
                                } else{
                                    enterValue[index] = String(enterValue[index].prefix(1))
                                }
                                
                            }
                            
                            if !newValue.isEmpty {
                                if index == numberOfFields - 1 {
                                    fieldFocus = nil
                                } else {
                                    fieldFocus = (fieldFocus ?? 0) + 1
                                }
                            } else{
                                fieldFocus = (fieldFocus ?? 0) - 1
                            }
                        }
                }
                
            }
            
            Spacer()
            
            Button("Verify") {
                let otpStr = enterValue.map { String($0) }.joined(separator: "")
                OTPverifyComplaintViewModel.verifyOTP(complaintbody: complaintbody, otpString: otpStr)
                print(otpStr)
                
            }
            .frame(width: UIScreen.main.bounds.width-90, height: 50)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            
            Text("Didn't recieve code? **Request again**")
                .padding(.vertical)
                        
        }
        .navigationTitle("Enter OTP")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct OTPEnterBoxStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width:50, height: 50)
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(Color.gray.opacity(0.2))
            }
            .multilineTextAlignment(.center)
        
        
    }
}

//#Preview {
//    OTPEnterView(numberOfFields: 6)
//}
