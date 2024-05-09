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
    let portes = ["Pequeno", "Médio", "Grande"]
    @State var porte: String = "Pequeno"
    
    var body: some View {
        VStack (alignment: .leading){
            
//            Divider()
            //insere uma linha de divisão (gestalt)
            
            Spacer()
            Text("Qual a idade do seu cão?")
                .font(.system(size: 24))
                //estabelece o tamanho da fonte do título
            
            Text("Anos")
            TextField("Digite quantos anos completos seu cão tem...", value: $years, format: .number)
            
            Text("Meses")
            TextField("E quantos meses, além disso, ele tem.", value: $months, format: .number)
            
            Text("Porte")
            Picker("Porte", selection: $porte) {
                ForEach(portes, id: \.self) { porte in
                    Text(porte)
                        .tag(porte)
                    // a tag serve para que o porte selecionado apareça no lugar do array de portes
                }
            }
            .pickerStyle(.segmented)
            
            
            Divider()
                .background(.gray)
            Spacer()
            
            if let result {
                EmptyView()
                Text("Seu cachorro tem, em idade humana...")
                    .foregroundColor(Color.blue)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    //centraliza o texto
                    .font(.system(size: 20))
                    .padding(.bottom, 20)
                
                Text("\(result) anos")
                    .font(.system(size: 45))
                    .foregroundColor(Color.blue)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)


            } 
            else {
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

            
            Spacer()
            Button(action: {
                //comportamento do botão
                processYears()
            }, label: {
                ZStack {
                    Color.purple
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
    
    func processYears() {
        
        guard let years,
              let months
        else {
            print("Preencha o campo de entrada")
            return
            //o guard exige um return, mesmo que vazio
        }
        //guard é outra maneira de desempacotar a variável opcional
        
        guard years > 0 || months > 0 else {
            print("Algum campo tem que ter valor maior que zero")
            return
        }
        
        result = years * 7 + months*7/12
        
//        if let years{
//            result = 23
//        }
        //uma maneira de desempacotar a variável opcional
    }
}

#Preview {
    ContentView()
}
