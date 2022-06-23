import SwiftUI
import SpriteKit

struct DragView: View {
    @State private var offset = CGSize.init(width: 0, height: 100)
    @State private var imageIndex = 0
    
    private var image: [UIImage]! = [UIImage(named: "koala_walk01")!, UIImage(named: "koala_walk02")!, UIImage(named: "koala_walk03")!]
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                offset = CGSize(width: value.startLocation.x + value.translation.width - 50,
                                height: value.startLocation.y + value.translation.height - 50)
                
                imageIndex += 1
                if imageIndex == image.count {
                    imageIndex = 0
                }
            }
    }
    
    var body: some View {
        VStack {
            Text("Use one finger to drag the character")
            Spacer()
            Image(uiImage: image[imageIndex])
                .offset(offset)
                .frame(width: 100, height: 100)
                .gesture(dragGesture)
            Spacer()
        }
        .navigationTitle("Drag")
        .toolbar {
            Button("Reset") {
                imageIndex = 0
                offset = CGSize.init(width: 0, height: 100)
            }
        }
    }
}


struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}

