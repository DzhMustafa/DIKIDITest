import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published private(set) var vips: [Vip] = []
    @Published private(set) var shares: Shares = .mock
    @Published private(set) var dataState: DataState = .loading
    
    private let service: IHomeService
    
    init(service: IHomeService) {
        self.service = service
        
        getHomeData()
    }
    
    func getHomeData() {
        Task {
            do {
                let result = try await service.getHomeData()
                
                self.vips = result.blocks.vip
                self.shares = result.blocks.shares
                self.dataState = .success
            } catch {
                dataState = .failed(message: error.localizedDescription)
                print("*** Error in \(#function): \(error)")
            }
        }
    }
}
