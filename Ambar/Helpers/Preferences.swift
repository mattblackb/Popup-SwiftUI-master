//
//  Preferences.swift
//  Menu BookMark App
//
//  Created by Matthew Burton on 24/08/2021.
//  Copyright © 2021 Beechwood corp. All rights reserved.
//

import SwiftUI
struct PreferencesStruct : Identifiable {
    var id: Int
    var ShowSearch:Bool
    
    init(id: Int, ShowSearch: Bool){
            self.id = id
            self.ShowSearch = ShowSearch
    }
}

class PreferencesClass: ObservableObject {
    
    @Published var preference: [PreferencesStruct]
    
    
    init() {
        let checkedObject = UserDefaults.standard.object(forKey:"showSearch") as? Bool

        if(checkedObject!) {
            self.preference =  [
                PreferencesStruct(id:1, ShowSearch: true)
            ]
        } else {
            self.preference =  [
                PreferencesStruct(id:1, ShowSearch: false)
            ]
        }
    }
    
    func setShowSearchFalse() {
        self.preference[0].ShowSearch = false
        print(self.preference[0].ShowSearch)
    }
    
    func setShowSearchTrue() {
        self.preference[0].ShowSearch = true
        print(self.preference[0].ShowSearch)
//            ShowSearch  = true
//        print(ShowSearch)
    }
    
}

