//
//  OTPVerifyRoomCleaningModel.swift
//  HostelBuddyUser
//
//  Created by shikhar on 20/03/24.
//

import Foundation
import SwiftUI

struct OTPVerifyRoomCleaningViewModel {
    
    static let verifyRoomCleaningOTP = "https://hostelbuddybackend-hgf5.onrender.com/api/verifyRoomCleaningOTP"
    
    static func verifyOTP(complaintbody: RoomCleaningUserModel, otpString: String){
        var urlRequest = URLRequest(url: URL(string: verifyRoomCleaningOTP)!)
        urlRequest.httpMethod = "POST"
        
        let dict = ["name": complaintbody.name, "regNo": complaintbody.regNo, "roomNo": complaintbody.roomNo, "mailVIT": complaintbody.mailVIT, "selectedBlock": complaintbody.selectedBlock, "date": complaintbody.date, "time":complaintbody.time, "otp": otpString]
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
                let decodedData = try decoder.decode(OTPRoomCleaningModel.self, from: decoded)
                
                print(decodedData)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
