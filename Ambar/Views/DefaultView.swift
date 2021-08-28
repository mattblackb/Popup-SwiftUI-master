//
//  DefaultView.swift
//  Ambar
//
//  Created by Matthew Burton on 03/08/2021.
//  Copyright © 2021 Golden Chopper. All rights reserved.
//

import SwiftUI
import AppKit

struct DefaultView: View {
    @State var selection = 1

    var body: some View {
        Spacer()
        TabView(selection: $selection) {
            EditAddView()
                        .tabItem {
                            VStack {
                                Text("Edit/Add Items")
                            }

                        }.tag(1)
            
        
            Preferences()
                .tabItem {
                    VStack {
                        Image("icons.general.home")
                        Text("Preferences")
                    }

                }.tag(2)
            }
    
        }

}

struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultView()
    }
}


