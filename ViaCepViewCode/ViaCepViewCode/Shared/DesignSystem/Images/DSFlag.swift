//
//  Flag.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 18/08/26.
//

import UIKit

enum DSFlag: String, CaseIterable {
    case brazil = "brasil_flag"
    case acre = "acre_flag"
    case alagoas = "alagoas_flag"
    case amapa = "amapa_flag"
    case amazonas = "amazonas_flag"
    case bahia = "bahia_flag"
    case ceara = "ceara_flag"
    case distritoFederal = "distrito-federal_flag"
    case espiritoSanto = "espirito-santo_flag"
    case goias = "goias_flag"
    case maranhao = "maranhao_flag"
    case matoGrosso = "mato-grosso_flag"
    case matoGrossoDoSul = "mato-grosso-do-sul_flag"
    case minasGerais = "minas-gerais_flag"
    case para = "para_flag"
    case paraiba = "paraiba_flag"
    case parana = "parana_flag"
    case pernambuco = "pernambuco_flag"
    case piaui = "piaui_flag"
    case rioDeJaneiro = "rio-de-janeiro_flag"
    case rioGrandeDoNorte = "rio-grande-do-norte_flag"
    case rioGrandeDoSul = "rio-grande-do-sul_flag"
    case rondonia = "rondonia_flag"
    case roraima = "roraima_flag"
    case santaCatarina = "santa-catarina_flag"
    case saoPaulo = "sao-paulo_flag"
    case sergipe = "sergipe_flag"
    case tocantins = "tocantins_flag"

    var image: UIImage? {
        UIImage(named: rawValue)
    }
    
    var name: String {
        switch self {
            case .acre: 
                return "Acre"
            case .alagoas: 
                return "Alagoas"
            case .amapa: 
                return "Amapá"
            case .amazonas: 
                return "Amazonas"
            case .bahia: 
                return "Bahia"
            case .brazil: 
                return "Brasil"
            case .ceara: 
                return "Ceará"
            case .distritoFederal: 
                return "Distrito Federal"
            case .espiritoSanto: 
                return "Espírito Santo"
            case .goias: 
                return "Goiás"
            case .maranhao: 
                return "Maranhão"
            case .matoGrosso: 
                return "Mato Grosso"
            case .matoGrossoDoSul: 
                return "Mato Grosso do Sul"
            case .minasGerais: 
                return "Minas Gerais"
            case .para: 
                return "Pará"
            case .paraiba: 
                return "Paraíba"
            case .parana: 
                return "Paraná"
            case .pernambuco: 
                return "Pernambuco"
            case .piaui: 
                return "Piauí"
            case .rioDeJaneiro: 
                return "Rio de Janeiro"
            case .rioGrandeDoNorte: 
                return "Rio Grande do Norte"
            case .rioGrandeDoSul: 
                return "Rio Grande do Sul"
            case .rondonia: 
                return "Rondônia"
            case .roraima: 
                return "Roraima"
            case .santaCatarina:
                return "Santa Catarina"
            case .saoPaulo: 
                return "São Paulo"
            case .sergipe: 
                return "Sergipe"
            case .tocantins: 
                return "Tocantins"
        }
    }
}
