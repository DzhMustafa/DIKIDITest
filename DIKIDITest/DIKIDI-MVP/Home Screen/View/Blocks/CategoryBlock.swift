import SwiftUI

struct CategoryBlock: View {
    let gridRows = Array(repeating: GridItem(.fixed(140), spacing: 10), count: 2)
    
    var body: some View {
        VStack {
            Section(content: categoryContent, header: categoryHeader)
        }
    }
}

private extension CategoryBlock {
    func categoryContent() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridRows, spacing: 10) {
                ForEach(1..<20) { index in
                    categoryCell(index: index)
                }
            }
            .padding(.horizontal)
        }
    }
    
    func categoryHeader() -> some View {
        HStack {
            Text("Категории")
                .font(.title3)
                .bold()
            +
            Text(" 37")
                .font(.title2)
                .foregroundStyle(.gray)
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    func categoryCell(index: Int) -> some View {
        ZStack {
            Image("image")
                .resizable()
                .scaledToFill()
                .frame(width: 220, height: 140)
                .clipped()
            
            // Можно и через overlay, но в данном контексте так смотрится лучше
            Color.black.opacity(0.4)
            
            Text(index, format: .number)
                .font(.title)
                .foregroundStyle(.white)
        }
        .clipShape(.rect(cornerRadius: 15))

    }
}

#Preview {
    CategoryBlock()
        .fixedSize(horizontal: false, vertical: true)
}
