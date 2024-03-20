//
//  OTPverifyComplaintViewModel.swift
//  HostelBuddyUser
//
//  Created by shikhar on 20/03/24.
//

import Foundation
import SwiftUI

struct OTPverifyComplaintViewModel {
    
    static let verifyComplaintOTP = "https://hostelbuddybackend-hgf5.onrender.com/api/verifyComplaintOTP"
    
    static func verifyOTP(complaintbody: ComplaintUserModel, otpString: String){
        var urlRequest = URLRequest(url: URL(string: verifyComplaintOTP)!)
        urlRequest.httpMethod = "POST"
        
        let dict = ["name": complaintbody.name, "regNo": complaintbody.regNo, "roomNo": complaintbody.roomNo, "mailVIT": complaintbody.mailVIT, "selectedBlock": complaintbody.selectedBlock, "issueType": complaintbody.issueType, "description": complaintbody.description, "otp": otpString]
        do {
            
            let requestBody = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            
            urlRequest.httpBody = requestBody
            
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        }
        catch {
            print("DEBUG: \(error)")
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            guard let decoded = data else { return }
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(OTPComplaintModel.self, from: decoded)
                print(decodedData)
            }
            catch{
                print(error.localizedDescription)
            }
            
        }
        .resume()
    }
}
