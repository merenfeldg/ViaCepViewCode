//
//  CepModel.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 07/07/26.
//

struct CepModel: Codable {
    let cep: String
    let adress: String?
    let complement: String?
    let neighborhood: String?
    let city: String
    let state: String
    let region: String
    let ddd: String?
    let stateAbbreviation: String
    
    private enum CodingKeys: String, CodingKey {
        case cep, ddd
        case adress = "logradouro"
        case complement = "complemento"
        case neighborhood = "bairro"
        case city = "localidade"
        case state = "estado"
        case region = "regiao"
        case stateAbbreviation = "uf"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.cep = try container.decode(String.self, forKey: .cep)
        self.city = try container.decode(String.self, forKey: .city)
        self.state = try container.decode(String.self, forKey: .state)
        self.region = try container.decode(String.self, forKey: .region)
        
        self.adress = try Self.decodeOptionalString(
            from: container,
            forKey: .adress
        )

        self.complement = try Self.decodeOptionalString(
            from: container,
            forKey: .complement
        )

        self.neighborhood = try Self.decodeOptionalString(
            from: container,
            forKey: .neighborhood
        )
        
        self.stateAbbreviation = try container.decode(
            String.self,
            forKey: .stateAbbreviation
        )
        
        self.ddd = try container.decodeIfPresent(
            String.self,
            forKey: .ddd
        )
    }
    
    private static func decodeOptionalString(
        from container: KeyedDecodingContainer<CodingKeys>,
        forKey key: CodingKeys
    ) throws -> String? {
        guard let value = try container.decodeIfPresent(String.self, forKey: key) else {
            return nil
        }
        
        return value.isEmpty ? nil : value
    }
}
