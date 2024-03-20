//
//  HarassmentViewModel.swift
//  HostelBuddyUser
//
//  Created by shikhar on 21/03/24.
//

import Foundation
import SwiftUI

struct HarassmentViewModel {
    static let harassmentRequest =  "https://hostelbuddybackend-hgf5.onrender.com/api/postHarassment"
    
    static func getHarassmentOTP(complaintbody: HarassmentUserModel){
        var urlRequest = URLRequest(url: URL(string: harassmentRequest)!)
        urlRequest.httpMethod = "POST"
            
        let dict = ["name": complaintbody.name, "regNo": complaintbody.regNo, "roomNo": complaintbody.roomNo, "mailVIT": complaintbody.mailVIT, "selectedBlock": complaintbody.selectedBlock, "description": complaintbody.description]
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
