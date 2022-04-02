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
                            
                            Text(item.type)
                        }
                        Spacer()
                        
                        Text(item.price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .font(item.price<=50 ? .subheadline : (item.price<=100 ? .headline : .title3))
                            .foregroundColor(item.price<=50 ? Color.green : (item.price<=100 ? Color.yellow : .red))
                    }
                }
                .onDelete(perform: deleteRow)
                } header: {
                    Text("Personal")
                }
                Section {
                    ForEach(expenses.businessEx) {
                
                 item in
                    HStack{
                        VStack{
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                        }
                        Spacer()
                        
                        Text(item.price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .font(item.price<=50 ? .subheadline : (item.price<=100 ? .headline : .title3))
                            .foregroundColor(item.price<=50 ? Color.green : (item.price<=100 ? Color.yellow : .red))
                    }
                }
                .onDelete(perform: deleteRow)
                    
                } header: {
                    Text("Business")
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
    func deleteRow(at offset: IndexSet){
        expenses.items.remove(atOffsets: offset)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
