//
//  MessIssueUserModel.swift
//  HostelBuddyUser
//
//  Created by shikhar on 21/03/24.
//

import Foundation
import SwiftUI

struct MessIssueUserModel: Identifiable, Codable {
    
    var id = UUID().uuidString
    var name = ""
    var regNo = ""
    var mailVIT = ""
    var messBlock = ""
    var messType = "Veg Mess"
    var description = ""
    
    init(id: String = UUID().uuidString, name: String, regNo: String, mailVIT: String, messBlock: String, description: String, messType: String) {
        self.id = id
        self.name = name
        self.regNo = regNo
        self.mailVIT = mailVIT
        self.description = description
        self.messBlock = messBlock
        self.messType = messType
        
    }
}
