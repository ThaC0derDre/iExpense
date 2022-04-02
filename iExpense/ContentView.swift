//
//  ContentView.swift
//  iExpense
//
//  Created by Andres Gutierrez on 4/1/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: deleteRow)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button{
                    let anExpense = ExpenseItem(name: "Whiskey", price: 75.00, type: "Pleasure")
                    expenses.items.append(anExpense)
                }label: {
                    Image(systemName: "plus")
                }
            }
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
