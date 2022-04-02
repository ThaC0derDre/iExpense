//
//  Expense.swift
//  iExpense
//
//  Created by Andres Gutierrez on 4/1/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
