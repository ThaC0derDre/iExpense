//
//  OnDeleteTut.swift
//  iExpense
//
//  Created by Andres Gutierrez on 4/1/22.
//

import SwiftUI

struct OnDeleteTut: View {
    @State private var numbArray    = [Int]()
    @State private var number       = 1
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(numbArray, id: \.self){
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRow)
                }
                Button("Add Row"){
                    numbArray.append(number)
                    number += 1
                }
            }
            .toolbar{
                EditButton()
            }
        }
        
    }
    func removeRow(at offset: IndexSet){
        numbArray.remove(atOffsets: offset)
    }
}

struct OnDeleteTut_Previews: PreviewProvider {
    static var previews: some View {
        OnDeleteTut()
    }
}
