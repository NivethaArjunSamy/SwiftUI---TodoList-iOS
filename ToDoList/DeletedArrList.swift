//
//  DeletedArrList.swift
//  ToDoList
//
//  Created by Nivetha ArjunSamy on 25/06/24.
//

import SwiftUI

struct DeletedArrList: View {
    @State private var deletedArr : [String] = UserDefaults.standard.stringArray(forKey: "deletedArr") ?? []
    
    var body: some View {
        Text("Deleted Arr list")
        Spacer()
        
        if deletedArr != [] {
            List {
                ForEach (deletedArr.indices, id: \.self) {
                    index in
                    
                    HStack {
                        
                        Text(deletedArr[index].description)
                            
                        Spacer()
                        Button {
                            deletedArr.remove(at: index)
                            UserDefaults.standard.set(deletedArr, forKey: "deletedArr")
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                    .padding(5)
                    .cornerRadius(10)
                }
            }

        }
        else{
            Text("List is Empty")
            Spacer()
        }
        
    }
}

struct DeletedArrList_Previews: PreviewProvider {
    static var previews: some View {
        DeletedArrList()
    }
}
