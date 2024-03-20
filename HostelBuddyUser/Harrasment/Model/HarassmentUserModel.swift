//
//  HarassmentUserModel.swift
//  HostelBuddyUser
//
//  Created by shikhar on 21/03/24.
//

import Foundation
import SwiftUI

struct HarassmentUserModel: Identifiable, Codable {
    
    var id = UUID().uuidString
    var name = ""
    var regNo = ""
    var mailVIT = ""
    var roomNo = ""
    var selectedBlock = "MH-A"
    var description = ""
    
    init(id: String = UUID().uuidString, name: String, regNo: String, mailVIT: String, roomNo: String, selectedBlock: String, description: String) {
        self.id = id
        self.name = name
        self.regNo = regNo
        self.mailVIT = mailVIT
        self.roomNo = roomNo
        self.selectedBlock = selectedBlock
        self.description = description
    }
}
