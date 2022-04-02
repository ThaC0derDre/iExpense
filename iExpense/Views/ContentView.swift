//
//  ContentView.swift
//  iExpense
//
//  Created by Andres Gutierrez on 4/1/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses               = Expenses()
    @State private var showAddExpenseView   = false
    
    var body: some View{
        NavigationView{
            List{
                ForEach(expenses.items){ item in
                    Text(item.name)
                }
                .onDelete(perform: deleteRow)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button{
                    showAddExpenseView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showAddExpenseView) {
            AddNewExpense(expenses: expenses)
        }
    }
    func deleteRow(at offset: IndexSet){
        expenses.items.remove(atOffsets: offset)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
