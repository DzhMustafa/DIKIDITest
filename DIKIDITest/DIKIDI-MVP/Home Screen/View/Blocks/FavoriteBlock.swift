import SwiftUI

struct FavoriteBlock: View {
    var body: some View {
        VStack {
            Section(content: favoriteContent, header: favoriteHeader)
        }
    }
}

private extension FavoriteBlock {
    func favoriteHeader() -> some View {
        HStack {
            Text("Избранное")
                .font(.title3)
                .bold()
            +
            Text(" 8")
                .font(.title2)
                .foregroundStyle(.gray)
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    func favoriteContent() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(1..<11) { value in
                    favoriteCell(title: String(value))
                }
            }
            .padding(.horizontal)
        }
    }
    
    func favoriteCell(title: String) -> some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray)
                .frame(width: 75, height: 75)
            
            Text(title)
        }
    }
}

#Preview {
    FavoriteBlock()
        .fixedSize(horizontal: false, vertical: true)
}
