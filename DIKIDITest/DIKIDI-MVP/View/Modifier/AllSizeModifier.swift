import SwiftUI

struct AllSizeModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color.clear
            
            content
        }
    }
}

extension View {
    func allSize() -> some View {
        modifier(AllSizeModifier())
    }
}
