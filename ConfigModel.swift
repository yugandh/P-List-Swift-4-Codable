//
//  ConfigModel.swift
//  P-List-Swift-4-Codable
//
//  Created by Yugandhar Kommineni on 7/22/18.
//  Copyright © 2018 Yugandhar Kommineni. All rights reserved.
//

import Foundation

struct Config: Codable {
    var person: Person?
    var color: Color?
}

struct Person: Codable {
    var name: String
    var age: Int
    var isWorking: Bool
}

struct Color: Codable {
    var background: String
    var foreground: String
    var border: String
}
