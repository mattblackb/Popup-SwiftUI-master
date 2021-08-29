//
//  ContentView.swift
//  Ambar
//
//  Created by Anagh Sharma on 12/11/19.
//  Copyright © 2019 Anagh Sharma. All rights reserved.
//

import SwiftUI
import AppKit



struct ContentView: View {
    @ObservedObject var searchStatus = UserSettings()
    
    @Environment(\.managedObjectContext) private var viewContext
    @State  var searchText = ""

    @FetchRequest( sortDescriptors: [NSSortDescriptor(key:"name", ascending:true)] ) var item : FetchedResults<Items>
 
    
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                SearchBar(searchText: $searchText).padding()
                List {
                    ForEach(item.indices, id: \.self) { index in   // << here !!
                        if item[index].name!.contains(searchText) || searchText ==  ""  {
                            HStack {
                                Text( item[index].name!)
                                Spacer()
                                Button {
                                            NSPasteboard.general.clearContents()
                                            NSPasteboard.general.setString( item[index].value! , forType: .string)
                                    
                                         } label: {
                                             Text("Copy")
                                         }
                                Button("Go") {
                                    if let url = URL(string: item[index].value!) {
                                        NSWorkspace.shared.open(url)
                                        NSApp.sendAction(#selector(NSPopover.performClose(_:)), to: nil, from: nil)
                                     }
                                     }
                            }
                        }
                    }
                }
               
            }.frame(width: 400, height: 300, alignment: .leading)
            HStack(alignment: .center, spacing: 0, content: {
             
                Button(action: {
                    NSApplication.shared.terminate(self)
                }) {
                    Text("Quit")
                        .font(.body)
                        .fontWeight(.semibold)
                }.padding(.leading, 10)
                Spacer()
                Button(action: {
                    NSApp.sendAction(#selector(AppDelegate.openPreferencesWindow), to: nil, from:nil)
                    NSApp.sendAction(#selector(NSPopover.performClose(_:)), to: nil, from: nil)
                }) {
                    Text("Edit").font(.body)
                        .fontWeight(.semibold)
                    
                }
            
                Button(action: {
                    searchStatus.showSearch.toggle()
                    
                    
                }) {
                    Image("search").resizable().frame(width: 12, height: 12)
                    
                }.padding(.leading, 10)
                .padding(.trailing, 10)
                
                 
               
            }).frame(width: 400, height: 50, alignment: .leading)
            .background(Color("ui"))
        
        }
        
    }

}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
