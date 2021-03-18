import SwiftUI

/**
 
 This was going to take forever to figure out. Thankfully, spacenation has this solved on GitHub. Thank you for hte source code. https://github.com/spacenation/swiftui-shapes
 
 */

public struct HoneycombPolygon: Shape {
    let sides = 6
    let radius: CGFloat
    private let inset: CGFloat
    
    public func path(in rect: CGRect) -> Path {
        Path.honeycombPolygon(sides: self.sides, in: rect, inset: inset, radius: radius)
    }
    
    public init(radius: CGFloat) {
        self.init(radius: radius, inset: 0)
    }
    
    init(radius: CGFloat, inset: CGFloat) {
        self.radius = radius
        self.inset = inset
    }
}

extension HoneycombPolygon: InsettableShape {
    public func inset(by amount: CGFloat) -> HoneycombPolygon {
        HoneycombPolygon(radius: radius, inset: self.inset + amount)
    }
}

struct RoundedRegularPolygon_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            HoneycombPolygon(radius: 20)
                .fill(Color.bombusbAccentColor)
//                .strokeBorder(lineWidth: 10)
//                .foregroundColor(.yellow)
        }
    }
}
