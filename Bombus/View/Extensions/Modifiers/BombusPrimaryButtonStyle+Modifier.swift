import SwiftUI

struct BombusPrimaryButtonStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.bombusbBackgroundColor)
            .font(.system(.body, design: .rounded))
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.bombusbAccentColor))
            .padding(.horizontal, 20)
    }
}

extension View {
    func primaryButtonStyle() -> ModifiedContent<Self, BombusPrimaryButtonStyleModifier> {
        return modifier(BombusPrimaryButtonStyleModifier())
    }
}

struct BombusPrimaryButtonStyleModifierPreview: PreviewProvider {
    static var previews: some View {

        Group {
            Button(action: {}, label: {
                Text("Button")
            })
            .primaryButtonStyle()
        }
    }
}
