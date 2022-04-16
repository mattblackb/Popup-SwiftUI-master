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
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing:0, content: {
                    Text("Add new item")
                        .padding(20)
                        .foregroundColor(.gray)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
              
                    if warning != "" {
                        Text(self.warning)
                            .foregroundColor(.red)
                            .padding(.leading,  20)
                            .font(.title)
                    }
                    
                    Text("Display Name")
                        .padding(.leading, 20)
                        
                
                TextField("", text: $pname, onCommit: {
                  
                }).padding(20)
                  
                    Text("Description")
                        .padding(.leading, 20)
                    TextField("", text: $pdesc, onCommit: {
                      
                    }).padding(20)
                    
                    Text("Link")
                        .padding(.leading, 20)
                    TextField("", text: $plink, onCommit: {
                      
                    }).padding(20)
                    Button(action: addItem, label: {
                        Text("Save")
                    })
                    .padding(.leading, 20)
                    
                    
                    Spacer()            })
     
          
            
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
        self.pname = ""
        self.pdesc = ""
        self.plink = ""
    }
    
}



struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
