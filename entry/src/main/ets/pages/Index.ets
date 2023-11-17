import router from '@ohos.router'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State params: string = router.getParams()?.['params'];

  build() {
    Row() {
      Column() {
        Text(this.params)
        Button('打开新页面').onClick((event: ClickEvent) => {
          router.pushUrl({ url: 'pages/SecondPage', params: { "params": '我是从第一页传过来的' } }).then((value) => {
            hilog.info(0x0001, 'Index Page', '打开新页面成功，并且返回' + value,)
          }, (reason) => {
            hilog.info(0x0001, 'Index Page', '打开新页面失败，并且返回' + reason,)
          })
        })

        Button('基础组件使用')
          .onClick(() => {
            router.pushUrl({ url: 'pages/BasicComponentsPage' });
          })
        Button('容器组件使用')
          .onClick(() => {
            router.pushUrl({ url: 'pages/ContainerComponentsPage' })
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }

  onPageShow() {
    this.params = router.getParams()?.["params"]
  }
}