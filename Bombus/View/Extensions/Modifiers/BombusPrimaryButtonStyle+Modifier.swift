import SwiftUI

struct BombusPrimaryButtonStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.bombusPrimaryTextColor)
            .font(Font.title3.weight(.bold))
            .font(.system(.title3, design: .rounded))
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .frame(height: 60)
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
                Text("This is a primary button")
            })
            .primaryButtonStyle()
        }
    }
}
