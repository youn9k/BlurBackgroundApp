//
//  ContentView.swift
//  BlurBackgroundApp
//
//  Created by YoungK on 2022/09/14.
//

import SwiftUI

class BlurBackgroundViewModel: ObservableObject {
    var images = ["0", "1", "2", "3"]
    @Published var index = 0
    
    func nextImage() {
        index = (index + 1) % images.count
    }
}

struct ContentView: View {
    @StateObject var viewModel = BlurBackgroundViewModel()
    var body: some View {
        VStack {
            BlurBackgroundView(backgroundImage: "1") {
                Spacer()
                Image(viewModel.images[viewModel.index])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        viewModel.nextImage()
                    }
                Spacer()
            }
        }
    }
}

public struct BlurBackgroundView<Content: View>: View {
    private var backgroundImage: String
    private var content: () -> Content

    init(backgroundImage: String, @ViewBuilder content: @escaping () -> Content) {
        self.backgroundImage = backgroundImage
        self.content = content
    }
    
    public var body: some View {
        content()
            .background(Color.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
