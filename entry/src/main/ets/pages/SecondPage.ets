import router from '@ohos.router'
import hilog from '@ohos.hilog';
@Entry
@Component
struct SecondPage {
  @State message: string = '我是第二个页面'
  params:string = router.getParams()?.['params'];

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Text(this.params)
        Button('返回')
          .onClick(()=>{
            router.back({url:'pages/Index',params:{"params":'我是从第二个页面过来的'}});
            hilog.info(0x0001,'Second Page','返回上一个页面成功，并且返回')
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}