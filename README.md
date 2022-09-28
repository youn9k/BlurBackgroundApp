# BlurBackgroundApp

iOS 16 뮤직앱을 보고 예쁘길래 만들었습니다

![화면 기록 2022-09-28 오후 2 48 01](https://user-images.githubusercontent.com/60254939/192699060-751eda8b-7cdb-4be1-9acc-1c5d7dfb48c9.gif)

```Swift
public struct BlurBackgroundView<Content: View>: View {
    private var background: Image
    private var blur: CGFloat
    private var content: () -> Content

    init(background: Image, blur: CGFloat = 20, @ViewBuilder content: @escaping () -> Content) {
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

// 사용 예시
BlurBackgroundView(background: Image("test")) {
    Image("test").resizable().aspectRatio(contentMode: .fit)
}
```



