import Foundation

protocol INetwork {
    func get<Model:Decodable>(with url: URL, token: String?) async throws -> Model
}

final class NetworkService: INetwork {
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return decoder
    }()
    
    func get<Model>(with url: URL, token: String? = nil) async throws -> Model where Model : Decodable {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(APIValue.apiKey, forHTTPHeaderField: "Authorization")
        
        if let token {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        
        let (data, responce) = try await URLSession.shared.data(for: request)
        try responce.validate()

        return try decoder.decode(Model.self, from: data)
    }
}

extension URLResponse {
    // Сделал простую обработку, только не бейте
    func validate() throws {
        guard let httpResponce = self as? HTTPURLResponse, (200..<300).contains(httpResponce.statusCode) else {
            throw URLError(.badServerResponse)
        }
    }
}
