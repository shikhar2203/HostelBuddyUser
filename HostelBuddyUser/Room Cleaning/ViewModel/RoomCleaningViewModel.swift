//
//  RoomCleaningViewModel.swift
//  HostelBuddyUser
//
//  Created by shikhar on 20/03/24.
//

import Foundation
import SwiftUI

struct RoomCleaningViewModel {
    static let roomCleaningRequest =  "https://hostelbuddybackend-hgf5.onrender.com/api/postRoomCleaning"
    
    static func getRoomCleaningOTP(complaintbody: RoomCleaningUserModel){
        var urlRequest = URLRequest(url: URL(string: roomCleaningRequest)!)
        urlRequest.httpMethod = "POST"
            
        let dict = ["name": complaintbody.name, "regNo": complaintbody.regNo, "roomNo": complaintbody.roomNo, "mailVIT": complaintbody.mailVIT, "selectedBlock": complaintbody.selectedBlock]
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
            let decodedData = try! decoder.decode([String: String].self, from: decoded)
            
            print(decodedData)
        }
        .resume()
    }
}
