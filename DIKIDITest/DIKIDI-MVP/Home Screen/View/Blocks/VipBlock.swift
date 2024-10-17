import SwiftUI

struct VipBlock: View {
    let vips: [Vip]
    let buttonAction: (String) -> ()
    
    var body: some View {
        VStack {
            Section(content: vipContent, header: vipHeader)
        }
    }
}

private extension VipBlock {
    func vipHeader() -> some View {
        HStack {
            Text("Премиум ")
                .font(.title3)
                .bold()
            +
            Text(vips.count, format: .number)
                .font(.title2)
                .foregroundStyle(.gray)
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    func vipContent() -> some View {
        LazyVStack(spacing: 10) {
            ForEach(vips, id: \.id) { vip in
                vipCell(id: vip.id,
                        imageURL: vip.image.thumb,
                        title: vip.name,
                        categories: vip.categories,
                        showDivider: vips.last?.id != vip.id)
            }
        }
        .background(.primary.opacity(0.1), in: .rect(cornerRadius: 20))
        
    }
    
    func vipCell(id: String, imageURL: String, title: String, categories: [String], showDivider: Bool) -> some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: imageURL)) { Image in
                    Image
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 10))
                } placeholder: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray)
                        .frame(width: 61, height: 61)
                }
                
                VStack(alignment: .leading) {
                    Text(title)
                        .bold()
                    
                    Spacer()
                    
                    Text(categories.joined(separator: ","))
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .lineLimit(2, reservesSpace: true)
                }
                
                Spacer()
                
                CustomButton(buttonType: .small,
                             title: "Записаться") { buttonAction(id) }
                
                
            }
            .padding(12)
            .frame(height: 85)
            
            if showDivider {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray.opacity(0.5))
                    .frame(height: 1)
                    .padding(.horizontal)
            }
        }
    }
}
#Preview {
    ScrollView {
        VipBlock(vips: [.mock, Vip(id: "31f77",
                                   image: ImageType(thumb: "https://f1.test.dikidi.ru/c1/v12/60agcc0t1f.jpg?size=m",
                                                    origin: "https://f1.test.dikidi.ru/c1/v12/60agcc0t1f.jpg?size=f"),
                                   name: "Tets salon",
                                   categories: ["Hairdressing services"],
                                   award: nil,
                                   vipTariff: false)]) { _ in }
    }
}
