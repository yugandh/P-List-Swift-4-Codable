//
//  ViewController.swift
//  P-List-Swift-4-Codable
//
//  Created by Yugandhar Kommineni on 7/22/18.
//  Copyright © 2018 Yugandhar Kommineni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var settings: Config?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Reading A Property List
        guard  let settingsURL: URL = Bundle.main.url(forResource: "Config", withExtension: "plist") else {
            return
        }

        do {
            let data = try Data(contentsOf: settingsURL)
            settings = try Config.decode(data: data)
            print(self.settings ?? "Empty dictionary")
        } catch {
            // Handle error
            print(error)
        }

        // Writing A Property List
        let newPerson = Person(name: "yogi", age: 22, isWorking: false)
        let newColor = Color(background: "yellow", foreground: "green", border: "black")

        let configs = Config(person: newPerson, color: newColor)
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let data = try encoder.encode(configs)
            try data.write(to: settingsURL)
            print(self.settings ?? "Empty dictionary")
        } catch {
            // Handle error
            print(error)
        }

        // Testing whether the p-list values are updated with latest write value
        do {
            let data = try Data(contentsOf: settingsURL)
            settings = try Config.decode(data: data)
            print(self.settings ?? "Empty dictionary")
        } catch {
            // Handle error
            print(error)
        }
        
    }
}

extension Decodable {
    static func decode(data: Data) throws -> Self {
        let decoder = PropertyListDecoder()
        return try decoder.decode(Self.self, from: data)
    }
}
