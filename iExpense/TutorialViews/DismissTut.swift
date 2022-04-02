//
//  DismissTut.swift
//  iExpense
//
//  Created by Andres Gutierrez on 4/1/22.
//

import SwiftUI

struct DismissTut: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Show Sheet"){
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondSheet()
        }
    }
}

struct SecondSheet: View{
    @Environment(\.dismiss) var dismiss
    var body: some View{
        Button("Dismiss"){
            dismiss()
        }
    }
    
}

struct DismissTut_Previews: PreviewProvider {
    static var previews: some View {
        DismissTut()
    }
}
