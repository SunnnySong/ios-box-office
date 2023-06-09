//
//  NetworkProvider.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/04.
//

import Foundation

final class NetworkProvider: NetworkProvidable {
    
    private let session: NetworkSessionProtocol
    private let deserializer = JSONDeserializer()
    
    init(session: NetworkSessionProtocol = NetworkSession()) {
        self.session = session
    }
    
    func request<Endpoint: RequestResponseProtocol>(_ endpoint: Endpoint) async throws -> Result<Endpoint.Response, NetworkError> {
        
        let request = try endpoint.makeRequest()
        let result = try await session.data(from: request)

        switch result {
        case .success(let data):
            let decodingData: Endpoint.Response = try deserializer.deserialize(data)
            return .success(decodingData)
        case .failure(let error):
            return .failure(error)
        }
    }
    
}
