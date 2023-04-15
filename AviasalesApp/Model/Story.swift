//
//  Weather.swift
//  AviasalesApp
//
//  Created by e.mubarakov on 15.04.2023.
//

import Foundation

// MARK: - StoryElement
struct StoryElement: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias Story = [StoryElement]
