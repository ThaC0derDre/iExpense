//
//  AddNewExpense.swift
//  iExpense
//
//  Created by Andres Gutierrez on 4/1/22.
//

import SwiftUI

struct AddNewExpense: View {
    @ObservedObject var expenses: Expenses
    @State private var name     = ""
    @State private var type     = "Personal"
    @State private var price   = 0.0
    @State private var types    = ["Personal", "Business"]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("What did you purchase?", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self){
                    Text($0)
                    }
                    
                }
                TextField("price", value: $price, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
                Button("Add"){
                    let expense = ExpenseItem(name: name, price: price, type: type)
                    expenses.items.append(expense)
                }
            }
            .navigationTitle("Add Expense")
        }
    }
}

struct AddNewExpense_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
