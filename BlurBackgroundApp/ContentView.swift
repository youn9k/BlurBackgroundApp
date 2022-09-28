//
//  ContentView.swift
//  BlurBackgroundApp
//
//  Created by YoungK on 2022/09/14.
//

import SwiftUI

struct ContentView: View {
    let images = ["0", "1", "2", "3"]
    @State var index: Int = 0
    @State var image: String = "0"
    
    var body: some View {
        VStack {
            BlurBackgroundView(background: Image(image)) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {nextImage()}
            }
        }
    }
    
    func nextImage() {
        index = (index + 1) % images.count
        image = images[index]
    }
}

public struct BlurBackgroundView<Content: View>: View {
    private var background: Image
    private var blur: CGFloat = 20
    private var content: () -> Content

    init(background: Image, blur: CGFloat, @ViewBuilder content: @escaping () -> Content) {
        self.background = background
        self.blur = blur
        self.content = content
    }
    
    public var body: some View {
        GeometryReader { proxy in
            ZStack {
                background
                    .blur(radius: blur)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                content()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
