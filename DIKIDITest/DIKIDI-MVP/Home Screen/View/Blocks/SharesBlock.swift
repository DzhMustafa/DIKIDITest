import SwiftUI

struct SharesBlock: View {
    let shares: Shares
    let buttonAction: () -> ()
    
    var body: some View {
        VStack {
            Section(content: sharesContent, header: sharesHeader)
        }
    }
}

private extension SharesBlock {
    func sharesHeader() -> some View {
        HStack {
            Text("Акции ")
                .font(.title3)
                .bold()
            +
            Text(shares.list.count, format: .number)
                .font(.title2)
                .foregroundStyle(.gray)
            
            Spacer()
            
            CustomButton(buttonType: .plain, title: "См. все", action: buttonAction)
        }
        .padding(.horizontal)
    }
    
    func sharesContent() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(shares.list, id: \.id) { share in
                    shareCell(share: share)
                }
            }
            .padding(.horizontal)
        }
    }
    
    func shareCell(share: SharesList) -> some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: share.companyImage)) { Image in
                Image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 325, height: 150)
                    .clipped()
                    .overlay {
                        shareOverlayContent(viewCount: share.view, discountValue: share.discountValue)
                    }
            } placeholder: {
                Rectangle()
                    .fill(.gray)
                    .frame(width: 325, height: 150)
            }

            Text(share.name)
                .bold()
                .lineLimit(2, reservesSpace: true)
                .padding(.leading, 12)
            
            HStack {
                AsyncImage(url: URL(string: share.icon)) { Image in
                    Image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(.rect(cornerRadius: 10))
                        .clipped()
                    
                } placeholder: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray)
                        .frame(width: 50, height: 50)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(share.companyName)
                        .lineLimit(1)
                    
                    Text("Республиканская, 6")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .lineLimit(1)
                }
            }
            .padding([.horizontal, .bottom], 12)
        }
        .frame(width: 325)
        .background(.primary.opacity(0.1))
        .clipShape(.rect(cornerRadius: 15))
    }
    
    func shareOverlayContent(viewCount: String, discountValue: String) -> some View {
        ZStack {
            Color.black.opacity(0.4)
            
            VStack {
                Text(discountValue + " %")
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.red, in: .capsule)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    
                Spacer()
                
                HStack {
                    Text("до 20 июля")
                        .font(.caption)
                        .foregroundStyle(.black)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.8), in: .capsule)
                    
                    Spacer()
                    
                    Label(title: {
                        Text(viewCount)
                            .font(.caption)
                    }, icon: {
                        Image(systemName: "eye")
                            .font(.caption2)
                    } )
                    .foregroundStyle(.black)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.white.opacity(0.8), in: .capsule)
                }
            }
            .padding(12)
        }
    }
}


#Preview {
    SharesBlock(shares: .mock) { }
        .fixedSize(horizontal: false, vertical: true)
}
