//
//  MessIssueViewModel.swift
//  HostelBuddyUser
//
//  Created by shikhar on 21/03/24.
//

import Foundation
import SwiftUI

struct MessIssueViewModel {
    static let messIssueRequest =  "https://hostelbuddybackend-hgf5.onrender.com/api/postMessIssue"
    
    static func getMessIssueOTP(complaintbody: MessIssueUserModel){
        var urlRequest = URLRequest(url: URL(string: messIssueRequest)!)
        urlRequest.httpMethod = "POST"
            
        let dict = ["name": complaintbody.name, "regNo": complaintbody.regNo, "mailVIT": complaintbody.mailVIT, "messBlock": complaintbody.messBlock, "messType": complaintbody.messType, "description": complaintbody.description]
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

