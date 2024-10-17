import SwiftUI

struct HomeScreenView: View {
    @State private var text = ""
    @StateObject var vm = HomeViewModel(service: HomeService())
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Ярослававль(Ярославская область)")
                
                TextField("Print...", text: $text)
                    .padding(12)
                    .background(.blue.opacity(0.1), in: .rect(cornerRadius: 10))
                    .padding(.horizontal)
                
                switch vm.dataState {
                case .loading:
                    ProgressView()
                        .allSize()
                case .success:
                    homeSuccessView()
                case .failed(let message):
                    Text(message)
                        .allSize()
                }
            }
            .navigationTitle("Главная")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private extension HomeScreenView {
    func homeSuccessView() -> some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                FavoriteBlock()
                
                VipBlock(vips: vm.vips) { id in
                    print("vm.записаться))))")
                }
                .padding(.horizontal, 12)
                
                CategoryBlock()
                
                SharesBlock(shares: vm.shares) {
                    print(1)
                }
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
