//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Andres Gutierrez on 4/1/22.
//

import Foundation

struct ExpenseItem: Identifiable{
    let id  = UUID()
    // initializing here has Swift generate an uuid for us automatically.
    let name: String
    let price: Double
    let type: String
}
/* adding identifiable and UUID eliminates the need for id: in our ForEach loop.*/
