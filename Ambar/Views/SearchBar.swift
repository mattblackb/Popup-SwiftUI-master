//
//  SearchBar.swift
//  Menu BookMark App
//
//  Created by Matthew Burton on 24/08/2021.
//  Copyright © 2021 Beechwood corp. All rights reserved.
//

import SwiftUI

struct SearchBar: View {

    @StateObject var progress = PreferencesClass()
    @State var currentState = false;
    @Binding var toggleSearch : Bool
    @Binding var searchText : String
    
//

    
    var body: some View {
       
        if(toggleSearch) {
            TextField("Search: ", text: $searchText)
        }

    }
    func setStateVariable(value: Bool) {
        if(currentState != value) {
            print("New value is: \(value)")
            if(value) {
                progress.setShowSearchTrue()
            } else {
                progress.setShowSearchFalse()
            }
            currentState = value
        }

    }

}


