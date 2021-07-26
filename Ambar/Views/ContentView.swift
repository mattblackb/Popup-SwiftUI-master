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
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest( sortDescriptors: [] ) var item : FetchedResults<Items>

    var body: some View {
        VStack {
        VStack(alignment: .leading, spacing: 0) {
            List {
                ForEach(item.indices, id: \.self) { index in   // << here !!
                   Text( item[index].name!)
                }
            }
           
        }.frame(width: 400, height: 300, alignment: .leading)
            Button(action: {
                NSApp.sendAction(#selector(AppDelegate.openPreferencesWindow), to: nil, from:nil)
            }) {
                Text("Preferences").font(.largeTitle).foregroundColor(.primary)
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
