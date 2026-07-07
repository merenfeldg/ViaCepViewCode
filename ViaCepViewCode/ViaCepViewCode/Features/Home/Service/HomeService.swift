//
//  HomeService.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 07/07/26.
//

import Foundation

struct HomeService {
    private let baseURL = GetInfo.fetch(key: .baseURL) as? String ?? ""
    
    func fetchCEP(
        _ cep: String,
        completion: @escaping (Result<CepModel, NetworkError>) -> Void
    ) {
        executeRequest(cep: cep) { result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let data):
                        do {
                            let decodedData = try JSONDecoder().decode(CepModel.self, from: data)
                            completion(.success(decodedData))
                        } catch {
                            completion(.failure(.decodingError(error)))
                        }
                    
                    case .failure(let error):
                        completion(.failure(error))
                }
            }
        }
    }
    
    private func executeRequest(
        cep: String,
        completion: @escaping (Result<Data, NetworkError>) -> Void
    ) {
        guard let url = URL(string: "\(baseURL)/\(cep)/json") else {
            completion(.failure(.invalidURL(url: "\(baseURL)/\(cep)")))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(.networkFailure(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                completion(.failure(.statusCode(code: httpResponse.statusCode)))
                return
            }
            
            guard let data else {
                completion(.failure(.noData))
                return
            }
        }
        
        task.resume()
    }
}
