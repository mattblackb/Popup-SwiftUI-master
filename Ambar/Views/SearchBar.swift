//
//  SearchBar.swift
//  Menu BookMark App
//
//  Created by Matthew Burton on 24/08/2021.
//  Copyright © 2021 Beechwood corp. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @State var currentState = false;
    @Binding var searchText : String
    @ObservedObject var searchStatus = UserSettings()
    
//

    
    var body: some View {
       
        if(searchStatus.showSearch) {
            TextField("Search: ", text: $searchText)
        }

    }
   

}


