//
//  ComplaintViewModel.swift
//  HostelBuddyUser
//
//  Created by shikhar on 20/03/24.
//

import Foundation
import SwiftUI

struct ComplaintViewModel {
    
    static let submitComplaint = "https://hostelbuddybackend-hgf5.onrender.com/api/postComplaint"
        
    static func getComplaintOTP(complaintbody: ComplaintUserModel){
        var urlRequest = URLRequest(url: URL(string: submitComplaint)!)
        urlRequest.httpMethod = "POST"
            
        let dict = ["name": complaintbody.name, "regNo": complaintbody.regNo, "roomNo": complaintbody.roomNo, "mailVIT": complaintbody.mailVIT, "selectedBlock": complaintbody.selectedBlock, "issueType": complaintbody.issueType, "description": complaintbody.description]
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
