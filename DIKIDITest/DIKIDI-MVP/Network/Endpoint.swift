import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
    
    func buildURL() -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api-beauty.test.dikidi.ru"
        urlComponents.path = path
        
        guard let url = urlComponents.url else {
            preconditionFailure("Cannot build url", file: "Endpoint.swift", line: 14)
        }
        
        return url
    }
}

extension Endpoint {
    static var home: Self {
        Endpoint(path: "/home/info")
    }
}
