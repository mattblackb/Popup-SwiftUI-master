//
//  Prefernces.swift
//  Menu BookMark App
//
//  Created by Matthew Burton on 20/08/2021.
//  Copyright © 2021 Beechwood corp. All rights reserved.
//

import SwiftUI
import LaunchAtLogin


struct Preferences: View {

    @ObservedObject var searchStatus = UserSettings()

    var body: some View {
        VStack {
            LaunchAtLogin.Toggle {
                           Text("Launch at login")
                       }
            Toggle(isOn: $searchStatus.showSearch) {
                               Text("Show search bar by default")
                           }
          
        }
       
        
//        VStack {
//        LaunchAtLogin.Toggle {
//                Text("Launch at login")
//            }
//        Toggle(isOn: $searchStatus) {
//                    Text("Show search bar by default")
//                }
//        .onReceive([self.searchStatus].publisher.first()) { (value) in
//                    UserDefaults.standard.set(value, forKey: "showSearch")
//        }
//       }
     
    }
    
    
    
}


struct Prefernces_Previews: PreviewProvider {
    static var previews: some View {
        Preferences()
    }
}
