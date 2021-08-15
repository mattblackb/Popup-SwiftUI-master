//
//  ContentView.swift
//  Ambar
//
//  Created by Anagh Sharma on 12/11/19.
//  Copyright © 2019 Anagh Sharma. All rights reserved.
//

import SwiftUI
import AppKit
import LaunchAtLogin

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest( sortDescriptors: [] ) var item : FetchedResults<Items>

   
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                List {
                    ForEach(item.indices, id: \.self) { index in   // << here !!
                    HStack {
                        Text( item[index].name!)
                        Button {
                                    NSPasteboard.general.clearContents()
                                    NSPasteboard.general.setString( item[index].value! , forType: .string)
                                 } label: {
                                     Text("Copy")
                                 }
                      
                        }
                    }
                }
               
            }.frame(width: 400, height: 300, alignment: .leading)
            
            HStack {
                Button(action: {
                    NSApplication.shared.terminate(self)
                }) {
                    Text("Quit App")
                    .font(.caption)
                    .fontWeight(.semibold)
                
                }
                    
                    Button(action: {
                        NSApp.sendAction(#selector(AppDelegate.openPreferencesWindow), to: nil, from:nil)
                    }) {
                        Text("Preferences").font(.caption)
                            .fontWeight(.semibold)
                        
                    }
                
                }
            LaunchAtLogin.Toggle {
                        Text("Launch at login")
                    }
            }
        
    
//            NavigationLink(
//                destination: AddView(),
//                label: {
//                    Text("Add New")
//                        .font(.subheadline)
//                        .foregroundColor(Color.gray)
//                })
//           }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
