@Entry
@Component
struct BasicComponentsPage {
  @State message: string = '基础组件使用'
  @State account: string = '';
  @State password: string = ''

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize($r('app.float.font_size'))
          .fontWeight(FontWeight.Bold)
          .align(Alignment.Start)
          .width('100%')
          .backgroundColor($r('app.color.login_title'))
        Text($r('app.string.long_str'))
          .fontSize($r('app.float.font_size'))
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .decoration({ type: TextDecorationType.Underline, color: $r('app.color.login_title') })
        Row() {
          Image($r('app.media.app_icon'))
            .width($r('app.float.image_size'))
            .height($r('app.float.image_size'))
            .objectFit(ImageFit.Cover)
          Image('https://appdev.myones.net/mobile/icons/Icon-192.png')
            .width($r('app.float.image_size'))
            .height($r('app.float.image_size'))
            .objectFit(ImageFit.ScaleDown)
        }
        // .alignSelf(ItemAlign.Center)
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor($r('app.color.login_title'))

        Text('登录界面')
          .fontSize(24)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.login_title'))
          .fontStyle(FontStyle.Normal)

        Button({ type: ButtonType.Circle }) {
          // Image('https://appdev.myones.net/mobile/favicon.png')
          //   .width($r('app.float.button_size'))
          //   .height($r('app.float.button_size'))
          //   .objectFit(ImageFit.ScaleDown)
          Image($r('app.media.close_icon'))
            .width($r('app.float.button_size'))
            .height($r('app.float.button_size'))
            .objectFit(ImageFit.ScaleDown)
        }
        .backgroundColor(Color.Blue)

        LoadingProgress()
          .color(Color.Blue)
          .height(60)
          .width(60)

        TextInput({ placeholder: $r('app.string.accout') })
          .maxLength(32)
          .type(InputType.Email)
          .onChange((value) => {
            this.account = value;
          })
          .padding({ left: 16, right: 16, top: 16, bottom: 16 })
          .margin({ left: 16, right: 16, top: 20 })
        TextInput({ placeholder: $r('app.string.password') })
          .maxLength(32)
          .type(InputType.Password)
          .onChange((value) => {
            this.password = value
          })
          .padding({ left: 4, right: 4, top: 4, bottom: 4 })
          .margin({ left: 16, right: 16, top: 8 })
        Button($r('app.string.login_button'), { type: ButtonType.Capsule })
          .onClick(() => {

          })
          .padding({ left: 4, right: 4, top: 4, bottom: 4 })
          .margin({ left: 16, right: 16, top: 20 })
          .type(ButtonType.Capsule)
          .width("90%")
      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Center)
      .align(Alignment.Center)
    }
    .height('100%')
  }
}