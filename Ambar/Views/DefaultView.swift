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
            NavigationView() {
                VStack {
                    Text("Please Select")
                    Divider()
                    List(item) { item in
                        NavigationLink(
                                                   destination: EditView(person : item),
                                                   label: {
                                                    Text(item.name!)
                                                           .font(.subheadline)
                                                           .foregroundColor(Color.white)
                                                        .padding(.leading, 20)
                                                   })
                    
                       
                    }
                    Divider()
                    Spacer()
                    NavigationLink(
                                               destination: AddView(),
                                               label: {
                                                   Text("Add New")
                                               })
                    Spacer()
                }
            }
    
        }

}

struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultView()
    }
}


