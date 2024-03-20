//
//  OTPverifyMessIssueViewModel.swift
//  HostelBuddyUser
//
//  Created by shikhar on 21/03/24.
//

import Foundation
import SwiftUI

struct OTPverifyMessIssueViewModel {
    
    static let verifyMessIssueOTP = "https://hostelbuddybackend-hgf5.onrender.com/api/verifyMessIssueOTP"
    
    static func verifyOTP(complaintbody: MessIssueUserModel, otpString: String){
        var urlRequest = URLRequest(url: URL(string: verifyMessIssueOTP)!)
        urlRequest.httpMethod = "POST"
        
        let dict = ["name": complaintbody.name, "regNo": complaintbody.regNo, "mailVIT": complaintbody.mailVIT, "messBlock": complaintbody.messBlock, "messType": complaintbody.messType, "description": complaintbody.description, "otp": otpString]
        
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
            do{
                let decodedData = try decoder.decode(OTPMessIssueModel.self, from: decoded)
                
                print(decodedData)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
