//
//  EditView.swift
//  Core Data
//
//  Created by Matthew Burton on 22/07/2021.
//

import SwiftUI

struct EditView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest( sortDescriptors: [] ) var people : FetchedResults<Items>
//    var index: Person
    var person: Items
    @State var pname = ""
    
    var body: some View {
        VStack {
        Text("Hi")
            Text(person.name!)
        
        HStack {
            TextField("", text: $pname, onCommit: {
                person.name = self.pname
                try! viewContext.save()
              })
            .onAppear {
                self.pname = self.person.name != nil ? "\(self.person.name!)" : ""
            }
            Button(action: {
                person.name = self.pname
                try! viewContext.save()
            }) {
                    Text("Confirm")
                }
        }
        .padding()
        }
    }
    
   
}
