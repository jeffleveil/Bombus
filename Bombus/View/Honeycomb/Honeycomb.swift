import SwiftUI

struct Honeycomb: View {
    var body: some View {
        ZStack {
            HoneycombPolygon(radius: 20)
                .fill(Color.bombusbAccentColor)
            
            HoneycombPolygon(radius: 20)
                .mask(
                    Color.bombusPrimaryTextColor
                        .mask(
                            HoneycombPolygon(radius: 20)
                                .strokeBorder(Color.black.opacity(0.7), lineWidth: 2)
                                .blur(radius: 10)
                        )
                )
            
        }
    }
}

struct Honeycomb_Previews: PreviewProvider {
    static var previews: some View {
        Honeycomb()
    }
}
