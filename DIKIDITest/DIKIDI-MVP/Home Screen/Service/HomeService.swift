import Foundation

protocol IHomeService: AnyObject {
    var networkService: INetwork { get }
    
    func getHomeData() async throws -> HomeModel
}

final class HomeService: IHomeService {
    let networkService: INetwork
    
    init(networkService: INetwork = NetworkService()) {
        self.networkService = networkService
    }
    
    func getHomeData() async throws -> HomeModel {
        let endpoint = Endpoint.home
        let url = endpoint.buildURL()
        
        let responce: HomeModelResponce = try await networkService.get(with: url, token: nil)
        
        if let errorMessage = responce.error.message {
            throw NetworkError.responceError(errorMessage)
        }
        
        return responce.data
    }
}
