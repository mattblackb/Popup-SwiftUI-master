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
        
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 0, content: {
                Text("Editing : "+person.name!)
                    .padding(20)
                    .foregroundColor(.gray)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
          
      

                    Text("Display Name")
                        .padding(.leading, 20)
                    TextField("", text: $pname, onCommit: {
                        person.name = self.pname
                        try! viewContext.save()
                      })
                    .padding( 20)
       
                    .onAppear {
                        self.pname = self.person.name != nil ? "\(self.person.name!)" : ""
                    }
                    Text("Description").padding(.leading, 20)
                    TextField("", text: $desc, onCommit: {
                        person.desc = self.desc
                        try! viewContext.save()
                      }).padding(20)
                    .onAppear {
                        self.desc = self.person.desc != nil ? "\(self.person.desc!)" : ""
                    }
                    Text("Link").padding(.leading, 20)
                    TextField("", text: $value, onCommit: {
                        person.value = self.value
                        try! viewContext.save()
                      }).padding(20)
                    .onAppear {
                        self.value = self.person.value != nil ? "\(self.person.value!)" : ""
                    }
                    HStack {
                    Button(action: {
                        person.name = self.pname
                        try! viewContext.save()
                    }) {
                            Text("Save Data")
                    }.padding(.leading, 20)
                    Button(action: {
                 
                         viewContext.delete(person)
                        try! viewContext.save()
                    }) {
                            Text("Delete Data")
                        }
                    }
                
                Spacer()
            })
                
        }
        
        
    }
    
   
}
