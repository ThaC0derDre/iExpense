//
//  Expense.swift
//  iExpense
//
//  Created by Andres Gutierrez on 4/1/22.
//

import Foundation

class Expense: ObservableObject {
    @Published var item = [ExpenseItem]()
}
