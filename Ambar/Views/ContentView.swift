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
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                List {
                    ForEach(item.indices, id: \.self) { index in   // << here !!
                    HStack {
                        Text( item[index].name!)
                        Spacer()
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
            HStack(alignment: .center, spacing: 0, content: {
                Spacer()
                Button(action: {
                    NSApplication.shared.terminate(self)
                }) {
                    Text("Quit App")
                        .font(.body)
                        .fontWeight(.semibold)
                }
                Spacer()
                Button(action: {
                    NSApp.sendAction(#selector(AppDelegate.openPreferencesWindow), to: nil, from:nil)
                }) {
                    Text("Preferences").font(.body)
                        .fontWeight(.semibold)
                    
                }
                Spacer()
                LaunchAtLogin.Toggle {
                        Text("Launch at login")
                    }
                Spacer()
               
            }).frame(width: 400, height: 50, alignment: .leading)
        
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
