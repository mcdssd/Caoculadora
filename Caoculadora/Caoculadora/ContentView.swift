//
//  ContentView.swift
//  Caoculadora
//
//  Created by Marina Costa dos Santos on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int? = nil
    //var de estado
    //declarar a var como opcional faz com que se inicie com o campo do text field limpo
    @State var months: Int? = nil
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField("Digite quantos anos completos seu cão tem...", value: $years, format: .number)
            
                Text("Meses")
            TextField("E quantos meses, além disso, ele tem.", value: $months, format: .number)

        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .bold()
        .fontDesign(.rounded)
        .padding()
    }
}

#Preview {
    ContentView()
}
