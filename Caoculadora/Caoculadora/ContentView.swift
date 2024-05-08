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
    @State var result: Int?
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Qual a idade do seu cão?")
                .font(.system(size: 24))
                //estabelece o tamanho da fonte do título
            Text("Anos")
            TextField("Digite quantos anos completos seu cão tem...", value: $years, format: .number)
            
                Text("Meses")
            TextField("E quantos meses, além disso, ele tem.", value: $months, format: .number)
            
                Text("Porte")
                //segmented control
            
            if let result {
                EmptyView()
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos")
                    .font(.system(size: 45))

            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    // mantém a proporção da imagem original
                    .frame(maxHeight: 150)
                    //limite de altura
                    .frame(maxWidth: .infinity)
                    //especifiquei que a largura pode ser máxima dada a escala
                    .shadow(radius: 20)
            }
            
            Button(action: {
                result = 23
            }, label: {
                ZStack {
                    Color.pink
                    Text("Cãocular")
                        .foregroundStyle(.white)
                        //mudando a cor do texto do botão
                }
                .cornerRadius(12)
            })
            .frame(height: 50)
            //dimensionando a altura do botão

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
