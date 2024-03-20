//
//  OTPverifyHarassmentViewModel.swift
//  HostelBuddyUser
//
//  Created by shikhar on 21/03/24.
//

import Foundation
import SwiftUI

struct OTPverifyHarassmentViewModel {
    
    static let verifyHarassmentOTP = "https://hostelbuddybackend-hgf5.onrender.com/api/verifyHarassmentOTP"
    
    static func verifyOTP(complaintbody: HarassmentUserModel, otpString: String){
        var urlRequest = URLRequest(url: URL(string: verifyHarassmentOTP)!)
        urlRequest.httpMethod = "POST"
        
        let dict = ["name": complaintbody.name, "regNo": complaintbody.regNo, "mailVIT": complaintbody.mailVIT,"selectedBlock": complaintbody.selectedBlock,"roomNo": complaintbody.roomNo, "description": complaintbody.description, "otp": otpString]
        
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
