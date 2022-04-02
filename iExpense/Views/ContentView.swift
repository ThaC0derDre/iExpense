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
                Section{
                    ForEach(expenses.personalEx) {
                
                 item in
                    HStack{
                        VStack{
                            Text(item.name)
                                .font(.headline)
                            
                        }
                        Spacer()
                        
                        Text(item.price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .font(item.price<=50 ? .subheadline : (item.price<=100 ? .headline : .title3))
                            .foregroundColor(item.price<=50 ? Color.green : (item.price<=100 ? Color.yellow : .red))
                    }
                }
                .onDelete(perform: removePersonalItems)
                } header: {
                    Text("🍿 Personal")
                }
                Section {
                    ForEach(expenses.businessEx) {
                
                 item in
                    HStack{
                        VStack{
                            Text(item.name)
                                .font(.headline)
                            
                        }
                        Spacer()
                        
                        Text(item.price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .font(item.price<=50 ? .subheadline : (item.price<=100 ? .headline : .title3))
                            .foregroundColor(item.price<=50 ? Color.green : (item.price<=100 ? Color.yellow : .red))
                    }
                }
                .onDelete(perform: removeBusinessItems)
                    
                } header: {
                    Text("\(Image(systemName: "suitcase.fill")) Business ")
                }
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
    func removePersonalItems(at offsets: IndexSet) {

      // look at each item we are trying to delete
      for offset in offsets {

        // look in the personalItems array and get that specific item we are trying to delete. Find it's corresponding match in the expenses.items array.
          if let index = expenses.items.firstIndex(where: {$0.id == expenses.personalEx[offset].id}) {

          // delete the item from the expenses.items array at the index you found its match
            expenses.items.remove(at: index)

          }
        }
      }
    
    func removeBusinessItems(at offsets: IndexSet) {

      // look at each item we are trying to delete
      for offset in offsets {

        // look in the personalItems array and get that specific item we are trying to delete. Find it's corresponding match in the expenses.items array.
          if let index = expenses.items.firstIndex(where: {$0.id == expenses.businessEx[offset].id}) {

          // delete the item from the expenses.items array at the index you found its match
            expenses.items.remove(at: index)

          }
        }
      }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
