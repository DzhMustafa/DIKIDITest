// MARK:  - В данной верстке применено довольно нестандартное решение, оставил именно его(чисто для того чтобы продемонтрировать), чуть ниже описано более локаничное решение

import SwiftUI

struct CustomButton: View {
    
    let buttonType: ButtonType
    let title: String
    let action: () -> ()
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .if { view in
                    switch buttonType {
                    case .plain:
                        view
                    case .small:
                        view
                            .frame(width: 120, height: 35)
                            .background(.blue, in: .rect(cornerRadius: 10).stroke())
                    case .large:
                        view
                            .frame(maxWidth: .infinity)
                            .frame(height: 35)
                            .background(.blue, in: .rect(cornerRadius: 10).stroke())
                    }
                }
        }
    }
    
    enum ButtonType {
        case plain, small, large
    }
}

fileprivate extension View {
    func `if`<T:View>(@ViewBuilder content: (Self) -> T) -> some View {
        content(self)
    }
}

private extension CustomButton {
    func plainButton(type: ButtonType) -> some View {
        Button(action: action) {
            Text(title)
        }
    }
}

#Preview {
    CustomButton(buttonType: .small,
                 title: "Записаться") { }
}
