//
//  UserDefaultTut.swift
//  iExpense
//
//  Created by Andres Gutierrez on 4/1/22.
//

import SwiftUI

struct UserDefaultTut: View {
    @State private var tapAmount = UserDefaults.standard.integer(forKey: "Tap")
    var body: some View {
        Button("Tap count: \(tapAmount)"){
            tapAmount += 1
            UserDefaults.standard.set(tapAmount, forKey: "Tap")
        }
    }
}


/*
 Alternatively, @AppStorage wrapper can save time using just one-line of code.
 However, though the same, AppStorage doesn’t make it easy to handle storing complex objects such as Swift structs...
 */

struct AlternativeUserDefaultCall: View {
    @AppStorage("tapAmount") private var tapAmount  =  0
    var body: some View{
        Button("Tap count: \(tapAmount)"){
            tapAmount += 1
        }
    }
}

/* example using struct */

struct User: Codable {
    var first: String
    var last: String
}

struct LoginUsers: View {
    @State private var user = User(first: "Dre", last: "Gucci")
    var body: some View{
        Button("Save user"){
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user){
                UserDefaults.standard.set(data, forKey: "userData")
            }
        }
    }
}

struct UserDefaultTut_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultTut()
    }
}
