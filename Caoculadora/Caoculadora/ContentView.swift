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
    @State var porteSelecionado: Porte = .pequeno
    @State var failedInput = false
    let tituloPreencherCampos = "Preencha os campos para poder Cãocular"
    @State var zeroInput = false
    let tituloCamposZero = "Algum dos campos precisa ter valor maior que zero!"
    @State var twelveInput = false
    let tituloMaiorOnze = "Os meses não podem ser maior que 11."

    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading, spacing: 20.0){
                    
        //            Divider()
                    //insere uma linha de divisão (gestalt)
                    
                    Spacer()
                    Text("Qual a idade do seu cão?")
                        .font(.header5)
                        //estabelece o tamanho da fonte do título
                        .padding(.top, 24)
                    //espaçamento

        //MARK: Text Field Meses e Anos
                    VStack (alignment: .leading, spacing: 8.0){
                        Text("Anos")
                            .font(.body1)
                        TextField("Digite quantos anos completos seu cão tem...", value: $years, format: .number)
                    }
                    VStack (alignment: .leading, spacing: 8.0){
                        Text("Meses")
                            .font(.body1)
                        TextField("E quantos meses, além disso, ele tem.", value: $months, format: .number)
                        
                        Text("Porte")
                            .font(.body1)
                    }
                    
        //MARK: Segmented Control
                    Picker("Porte", selection: $porteSelecionado) {
                        ForEach(Porte.allCases, id: \.self) { porte in
                            Text(porte.rawValue)
                                .tag(porte)
                            // a tag serve para que o porte selecionado apareça no lugar do array de portes
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    
        //            Divider()
        //                .background(.gray)
                    //
                    
                    Spacer()
                    
        //MARK: Alternando imagem e texto
                    if let result {
                        EmptyView()
                        Text("Seu cachorro tem, em idade humana...")
                            .foregroundColor(Color.blueViolet)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            //centraliza o texto
                            .font(.body1)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding(.bottom, 20)
                        //MARK: Formatação texto
                        
                        Text("\(result) anos")
                            .contentTransition(.numericText())
                            .font(.display)
                            .foregroundColor(Color.blueViolet)
                            .frame(maxWidth: .infinity)
                    }
                    
                    //MARK: Formatação imagem
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

        //MARK: Botão
                    Spacer()
                    Button(action: {
                        //comportamento do botão
                        processYears()
                    }, label: {
                        ZStack {
                            Color.blueViolet
                            Text("Cãocular")
                                .foregroundStyle(.white)
                                //mudando a cor do texto do botão
                                .font(.body1)
                        }
                        .cornerRadius(12)
                    })
                    .frame(height: 50)
                    //dimensionando a altura do botão

                }
    //MARK: Estilo
                .containerRelativeFrame(.vertical)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .bold()
                .fontDesign(.rounded)
                .padding()
                .navigationTitle("Cãoculadora")
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.blueViolet, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .alert(tituloPreencherCampos, isPresented: $failedInput) {
                    Button ("OK", role: .cancel, action:{})
                }
                .alert(tituloCamposZero, isPresented: $zeroInput) {
                    Button ("OK", role: .cancel, action:{})
                }
                .alert(tituloMaiorOnze, isPresented: $twelveInput) {
                    Button ("OK", role: .cancel, action:{})
                }
            }
                .scrollDismissesKeyboard(.immediately)
        }
    }
    
    //MARK: Cálculo
    
    func processYears() {
        
        guard let years,
              let months
        else {
            print("Preencha o campo de entrada")
            failedInput = true
            return
            //o guard exige um return, mesmo que vazio
        }
        //guard é outra maneira de desempacotar a variável opcional
        
        guard years > 0 || months > 0
        else {
            print("Algum campo tem que ter valor maior que zero")
            zeroInput = true
            return
        }
        
        guard months <= 12
        else {
            print("Os meses não podem ser maior que 11.")
            twelveInput = true
            return
        }
        
        withAnimation(.easeIn.speed(0.5)) {
            result =
            porteSelecionado
                .conversaoDeIdade(
                    years: years, months: months
                )
        }
    }
}

#Preview {
    ContentView()
}
