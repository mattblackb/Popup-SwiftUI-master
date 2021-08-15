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
    @State var desc = ""
    @State var value = ""
    
    var body: some View {
        VStack {
            Text("Edit: "+person.name!)
      
  
            VStack {
                Text("Display Name")
                TextField("", text: $pname, onCommit: {
                    person.name = self.pname
                    try! viewContext.save()
                  })
                .onAppear {
                    self.pname = self.person.name != nil ? "\(self.person.name!)" : ""
                }
                Text("Description")
                TextField("", text: $desc, onCommit: {
                    person.desc = self.desc
                    try! viewContext.save()
                  })
                .onAppear {
                    self.desc = self.person.desc != nil ? "\(self.person.desc!)" : ""
                }
                Text("Link")
                TextField("", text: $value, onCommit: {
                    person.value = self.value
                    try! viewContext.save()
                  })
                .onAppear {
                    self.value = self.person.value != nil ? "\(self.person.value!)" : ""
                }
                HStack {
                Button(action: {
                    person.name = self.pname
                    try! viewContext.save()
                }) {
                        Text("Save Data")
                    }
                Button(action: {
             
                     viewContext.delete(person)
                    try! viewContext.save()
                }) {
                        Text("Delete Data")
                    }
                }
        }
        .padding()
        }
    }
    
   
}
