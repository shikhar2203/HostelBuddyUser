//
//  RoomCleaningUserModel.swift
//  HostelBuddyUser
//
//  Created by shikhar on 20/03/24.
//

import Foundation
import SwiftUI

struct RoomCleaningUserModel: Identifiable, Codable {
    
    var id = UUID().uuidString
    var name = ""
    var regNo = ""
    var roomNo = ""
    var mailVIT = ""
    var selectedBlock = "MH-A"
    var date = ""
    var time = ""
    
    init(id: String = UUID().uuidString, name: String, regNo: String, roomNo: String, mailVIT: String, selectedBlock: String, date: String, time: String) {
        self.id = id
        self.name = name
        self.regNo = regNo
        self.roomNo = roomNo
        self.mailVIT = mailVIT
        self.selectedBlock = selectedBlock
        self.date = date
        self.time = time
    }
}
