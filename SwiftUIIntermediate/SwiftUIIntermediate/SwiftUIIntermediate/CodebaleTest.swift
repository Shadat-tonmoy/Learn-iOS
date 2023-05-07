//
//  CodebaleTest.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/6/23.
//

import SwiftUI


struct CustomerModel : Identifiable, Hashable{
    let id : String
    let name : String
    let points : String
    let isPremium : Bool
}

class CodebaleViewModel : ObservableObject {
    
    @Published var customerModel : CustomerModel? = nil
}

struct CodebaleTest: View {
    
    @StateObject private var viewModel : CodebaleViewModel = CodebaleViewModel()
    
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CodebaleTest_Previews: PreviewProvider {
    static var previews: some View {
        CodebaleTest()
    }
}
