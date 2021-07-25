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
     
        VStack(alignment: .leading, spacing: 0) {
            List {
                ForEach(item.indices, id: \.self) { index in   // << here !!
                   Text( item[index].name!)
                }
            }
            Button(action: addItem, label: {
                Text("Add Text")
            })
        }
    }
    
    private func addItem() {
        print("Add")
        let p = Items(context: viewContext)
  
        p.name = "Matt"
        p.value = "Testing"
        do {
            try  viewContext.save()
        }
        catch {
            let nsError = error as NSError
          fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
