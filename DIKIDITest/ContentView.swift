import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem {
                    Image(systemName: TabItem.home.iconName)
                    Text(TabItem.home.title)
                }
            
            VStack { }
                .tabItem {
                    Image(systemName: TabItem.catalog.iconName)
                    Text(TabItem.catalog.title)
                }
            
            VStack { }
                .tabItem {
                    Image(systemName: TabItem.record.iconName)
                    Text(TabItem.record.title)
                }
            
            VStack { }
                .tabItem {
                    Image(systemName: TabItem.more.iconName)
                    Text(TabItem.more.title)
                }
        }
    }
}

#Preview {
    ContentView()
}

enum TabItem: CaseIterable {
    case home, catalog, record, more
    
    var title: String {
        switch self {
        case .home:
            "Главная"
        case .catalog:
            "Каталог"
        case .record:
            "Мои записи"
        case .more:
            "Еще"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            "house"
        case .catalog:
            "rectangle.stack"
        case .record:
            "book"
        case .more:
            "ellipsis"
        }
    }
}
