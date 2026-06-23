@Entry
@Component
struct StartPage {
  @State message: string = 'MBTI测试'

  build() {
    Column() {
      Text(this.message)
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 100 })

      Text('点击下方按钮开始测试')
        .fontSize(18)
        .fontColor('#666666')
        .margin({ top: 20 })

      Button('开始测试')
        .fontSize(20)
        .width('70%')
        .height(50)
        .backgroundColor('#007AFF')
        .fontColor(Color.White)
        .borderRadius(25)
        .margin({ top: 50 })
        .onClick((): void => {
          // 直接在这里开始测试，不跳转
          this.message = '功能开发中，请稍候...'
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#FFFFFF')
  }
}