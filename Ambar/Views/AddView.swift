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
    @State var warning = ""
    @State private var alertShowing = false
    

    
    var body: some View {
        VStack(alignment: .leading) {
      
            if warning != "" {
                Text(self.warning)
                    .foregroundColor(.red)
                    .padding( 20)
                    .font(.title)
                
            
            }
            
            Text("Display Name")
                .padding(.leading, 20)
                
        
        TextField("", text: $pname, onCommit: {
          
        }).padding()
          
            Text("Description")
                .padding(.leading, 20)
            TextField("", text: $pdesc, onCommit: {
              
            }).padding()
            
            Text("Link")
                .padding(.leading, 20)
            TextField("", text: $plink, onCommit: {
              
            }).padding()
            Button(action: addItem, label: {
                Text("Save")
            })
            .padding(.leading, 20)
//
        
        }
    }
    
    
    
    private func addItem() {
        if(self.plink == "" || self.plink == "null"){
            self.warning =  "Please set a link!"
        } else if (self.pname == "" || self.pname == "null"){
            self.warning =  "Please set a display name!"
        } else {
            let p = Items(context: viewContext)
            p.name = self.pname
            p.desc = self.pdesc
            p.value = self.plink
//            print("Not Linlk"+self.plink)
            do {
                try  viewContext.save()
            }
            catch {
                let nsError = error as NSError
              fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
}



struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
