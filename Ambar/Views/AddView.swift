//
//  AddView.swift
//  Core Data
//
//  Created by Matthew Burton on 23/07/2021.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest( sortDescriptors: [] ) var people : FetchedResults<Items>
    
    @State var pname = ""
    @State var pdesc = ""
    @State var plink = ""
    
    var body: some View {
        VStack {
            Text("Display Name")
        
        TextField("", text: $pname, onCommit: {
          
        }).padding()
            
            Text("Description")
            TextField("", text: $pdesc, onCommit: {
              
            }).padding()
            
            Text("Link")
            TextField("", text: $plink, onCommit: {
              
            }).padding()
            Button(action: addItem, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
//        Button(action: {
//            addItem()
//        }) {
//                Label("Confirm", systemImage: "pencil.circle.fill")
//            }
//        }
        
        }
    }
    
    
    
    private func addItem() {
        
        let p = Items(context: viewContext)

        p.name = self.pname
        p.desc = self.pdesc
        p.value = self.plink
        print(self.pdesc)
        do {
            try  viewContext.save()
        }
        catch {
            let nsError = error as NSError
          fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    //        withAnimation {
    //            let newItem = Item(context: viewContext)
    //            newItem.timestamp = Date()
    //
    //            do {
    //                try viewContext.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nsError = error as NSError
    //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    //            }
    //        }
    }
    
}



struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
