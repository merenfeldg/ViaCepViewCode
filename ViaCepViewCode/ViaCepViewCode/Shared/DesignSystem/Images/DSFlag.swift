//
//  Flag.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 18/08/26.
//

import UIKit

enum DSFlag: String {
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
}
