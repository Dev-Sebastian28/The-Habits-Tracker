//
//  userModel.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 10/01/26.
//

import Foundation

struct UserInfModel {
    var id: UUID
    var email: String
    var password: String
    var username: String
    var userAage: String?
    var userCountry: String?
    var userOccupation: String?
    var isPremium: Bool?
    var userImage: String?
    
    init(email: String, password: String, username: String, userAage: String? , userCountry: String?, userOccupation: String? , isPremium: Bool?, userImage: String?) {
        self.id = .init()
        self.email = email
        self.password = password
        self.username = username
        self.userAage = userAage
        self.userCountry = userCountry
        self.userOccupation = userOccupation
        self.isPremium = isPremium
        self.userImage = userImage
    }
}



