//
//  UserSettings.swift
//  Menu BookMark App
//
//  Created by Matthew Burton on 29/08/2021.
//  Copyright © 2021 Plain Black. All rights reserved.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    
    @Published var showSearch: Bool {
        didSet {
            UserDefaults.standard.set(self.showSearch, forKey:"showSearch")
            
        }
    }
    

    
    init() {
        self.showSearch = UserDefaults.standard.bool(forKey:"showSearch")
    }
}
