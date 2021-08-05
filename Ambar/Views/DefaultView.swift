//
//  DefaultView.swift
//  Ambar
//
//  Created by Matthew Burton on 03/08/2021.
//  Copyright © 2021 Golden Chopper. All rights reserved.
//

import SwiftUI
import AppKit

struct DefaultView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest( sortDescriptors: [] ) var item : FetchedResults<Items>

    var body: some View {
        
        
   
            NavigationView {
                VStack {
                    Text("Hello World")
                    List(item) { item in
                        Text(item.name!)
                        NavigationLink(
                                                   destination: EditView(person : item),
                                                   label: {
                                                    Text(item.name!)
                                                           .font(.subheadline)
                                                           .foregroundColor(Color.gray)
                                                   })
                       
                    }
//                    ForEach(item.indices, id: \.self) { index in
//
//                        NavigationLink(
//                            destination: EditView(person : item[index]),
//                            label: {
//                                Text(item[index].name!)
//                                    .font(.subheadline)
//                                    .foregroundColor(Color.gray)
//                            })
//
//                        if(index+1 == item.count ) {
//                                                NavigationLink(
//                                                    destination: AddView(),
//                                                    label: {
//                                                        Text("Add New")
//                                                    })
//                                            }
//
//
//                    }
                       
                   
//                    NavigationLink(destination: AddView()) {
//                        Text("Do Something")
//                    }
//                    NavigationLink(destination: AddView()) {
//                        Text("Do Something Else")
//                    }
                }
            }
    
        
        
    
//        NavigationView {
//            List(item) { note in
//                ForEach(item.indices, id: \.self) { index in   // << here !!
//                                        HStack {
//                                            Text( item[index].name!)
//
//                                        }
//                    if(index+1 == item.count ) {
//                        NavigationLink(
//                            destination: AddView(),
//                            label: {
//                                Text("Add New")
//                            })
//                    }
//                                    }
////            }
//            Text("Select a Note")
           
        }
        
//    }
}

struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultView()
    }
}


