import hilog from '@ohos.hilog';

@Entry
@Component
struct Page {
  @State message: string = '列表组件使用'
  private dataSource: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  build() {
    Column() {
      Text(this.message)
        .fontSize(25)
        .fontWeight(FontWeight.Bold)
      List({ space: 10 }) {
        ForEach(this.dataSource, (item: number) => {
          ListItem(`${item}`) {
            Column(){
              Text(`${item}`)
                .height(100)
                .fontSize(25)
                .fontColor(Color.Green)
                .textAlign(TextAlign.Center)
                .borderRadius(8)
                .backgroundColor(Color.Blue)
              // Divider()
              //   .strokeWidth(item % 2 == 0 ? 1 : 0)
              //   .color(item % 2 == 0 ? Color.Red:Color.Yellow)
              //   .margin({top:8,bottom:0})
            }
          }
          .onClick(() => {
            hilog.info(0x0001, '列表点击测试->', `点击了第${item}个选项`)
          })
        }, item => item)
      }
      .height('20%')
      .listDirection(Axis.Horizontal)
      // .divider({ strokeWidth: 1,
      //   color: Color.Red,
      //   startMargin: 16,
      //   endMargin: 16 })
    }
    .height('100%')
    .padding(12)
    .backgroundColor(Color.White)
  }
}