//
//  ContentView.swift
//  iExpense
//
//  Created by Andres Gutierrez on 4/1/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expense = Expense()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(expense.item, id: \.self) { item in
                    Text(item.name)
                }
                .onDelete(perform: deleteRow)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button{
                    let anExpense = ExpenseItem(name: "Whiskey", price: 75.00, type: "Pleasure")
                    expense.item.append(anExpense)
                }label: {
                    Image(systemName: "plus")
                }
            }
        }
        
    }
    func deleteRow(at offset: IndexSet){
        expense.item.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
