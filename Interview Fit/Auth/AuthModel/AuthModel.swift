//
//  AuthModel.swift
//  Interview Fit
//
//  Created by Jason Gamboa Solano on 24/1/23.
//

import Foundation

struct AuthModel: Codable {
    var fullName: String?
    var emailAddress: String?
    var imageUrl: URL?
    var seniorityLevel: String = "Jr"
}
