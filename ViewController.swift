//
//  ViewController.swift
//  P-List-Swift-4-Codable
//
//  Created by Yugandhar Kommineni on 7/22/18.
//  Copyright © 2018 Yugandhar Kommineni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Reading A Property List
        guard  let settingsURL: URL = Bundle.main.url(forResource: "Config", withExtension: "plist") else {
            return
        }
        
        var settings: Config?

        do {
            let data = try Data(contentsOf: settingsURL)
            let decoder = PropertyListDecoder()
            settings = try decoder.decode(Config.self, from: data)
        } catch {
            // Handle error
            print(error)
        }

        // Writing A Property List
        let someSettings = Config(name: "yogi", age: 20, isWorking: true)
    
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let data = try encoder.encode(someSettings)
            try data.write(to: settingsURL)
        } catch {
            // Handle error
            print(error)
        }
    }
}

