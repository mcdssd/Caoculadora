//
//  Porte.swift
//  Caoculadora
//
//  Created by Marina Costa dos Santos on 10/05/24.
//

import Foundation

enum Porte: String, CaseIterable {
    case pequeno = "Pequeno"
    case médio = "Médio"
    case grande = "Grande"
    
    func conversaoDeIdade(years: Int, months: Int) -> Int {
        
        let result: Int
        let multiplicador: Int
        
        switch self {
        case .pequeno:
            multiplicador = 6
        case .médio:
            multiplicador = 7
        case .grande:
            multiplicador = 8
        }
            //isso aqui poderia ser em switch case normal
        
        result = years * multiplicador + months * multiplicador / 12
        
        return result
    }
}


