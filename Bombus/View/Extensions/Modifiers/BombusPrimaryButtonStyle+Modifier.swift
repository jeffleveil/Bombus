import SwiftUI

struct BombusPrimaryButtobnStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.body)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.accentColor))
            .padding(.horizontal, 20)
    }
}

extension View {
    func customButton() -> ModifiedContent<Self, BombusPrimaryButtobnStyleModifier> {
        return modifier(BombusPrimaryButtobnStyleModifier())
    }
}

struct BombusPrimaryButtobnStyleModifierPreview: PreviewProvider {
    
    static var previews: some View {

        Group {
            Button(action: {}, label: {
                Text("Button")
            })
            .customButton()
        }
    }
}
