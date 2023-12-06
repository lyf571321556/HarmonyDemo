@Entry
@Component
struct ContainerComponentsPage {
  @State message: string = '容器组件使用'

  @Builder imageButton(src: Resource) {
    Button({ type: ButtonType.Circle, stateEffect: true }) {
      Image(src)
        .height($r('app.float.button_size'))
        .width($r('app.float.button_size'))
        .backgroundColor($r('app.color.login_title'))
    }
  }

  build() {
    Column({ space: 20 }) {
      Text(this.message)
        .fontSize($r('app.float.font_size'))
        .fontWeight(FontWeight.Bold)
        .align(Alignment.Start)
        .width('100%')
        .backgroundColor($r('app.color.login_title'))

      Row() {
        Text('行开头')
        Text('行结尾')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row({ space: 30 }) {
        this.imageButton($r('app.media.icon'))
        this.imageButton($r('app.media.icon'))
        this.imageButton($r('app.media.icon'))
      }
      .width('100%')
      .height('10%')
      .backgroundColor(Color.Red)
      .justifyContent(FlexAlign.SpaceAround)
      .alignItems(VerticalAlign.Bottom)

    }
    .width('100%')
    .height('100%')

  }
}