

import SwiftUI

struct BombusProgressview_: View {
    var body: some View {
        HStack {
            Circle()
                .fill(Color.bombusbAccentColor)
                .frame(width: 100, height: 100)
           
            Circle()
                .fill(Color.bombusbAccentColor)
                .frame(width: 100, height: 100)
            Circle()
                .fill(Color.bombusbAccentColor)
                .frame(width: 100, height: 100)
            
        }
        
    }
}

struct BombusProgressview__Previews: PreviewProvider {
    static var previews: some View {
        BombusProgressview_()
    }
}

