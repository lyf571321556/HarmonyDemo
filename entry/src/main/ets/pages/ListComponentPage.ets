import hilog from '@ohos.hilog';

@Entry
@Component
struct Page {
  @State message: string = '列表组件使用'
  private dataSource: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
  private dataSourceProvider: GridDataSource = new GridDataSource();
  private tabsCotroller: TabsController = new TabsController();

  @Builder generateTabBar() {
    Column() {
      Image($r('app.media.app_icon'))
        .size({ width: 25, height: 25 })
      Text($r('app.string.tab_title_me'))
        .fontColor('#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.tabsCotroller.changeIndex(1);
    })
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(25)
        .fontWeight(FontWeight.Bold)
      List({ space: 10 }) {
        ForEach(this.dataSource, (item: number, index: number) => {
          ListItem(`${item}`) {
            Column() {
              Text(`${item}`)
                .height(100)
                .width(50)
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
            hilog.info(0x0001, '列表点击测试->', `点击了第${index}个选项,值为${item}`)
          })
        }, item => item)
      }
      .listDirection(Axis.Horizontal)
      .backgroundColor(Color.Red)
      .height(100)

      Grid() {
        LazyForEach(this.dataSourceProvider, (item: number, index: number) => {
          GridItem() {
            Text(`${item}:${index}`)
              .fontColor(Color.Red)
              .width(50)
              .height(50)
              .fontSize(16)
          }
          .backgroundColor(Color.Grey)
          .onClick(() => {
            hilog.info(0x0003, '列表点击测试->', `点击了第${index}个选项,值为${item}`)
          })
        }, item => item)
      }
      .onClick(() => {
        hilog.info(0x0003, 'Grid点击测试->', `点击了Grid`)
        this.dataSourceProvider.pushData(this.dataSourceProvider.totalCount() + 1);
      })
      .columnsTemplate('1fr 1fr 1fr 1fr')
      // .rowsTemplate('1fr 1fr 1fr 1fr')
      .width('100%')
      .height('20%')
      .rowsGap(10)
      .columnsGap(10)
      .backgroundColor(Color.Green)

      Tabs({ barPosition: BarPosition.Start, controller: this.tabsCotroller }) {
        TabContent() {
          Text("主页")
            .width('100%')
            .height('100%')
            .align(Alignment.Center)
        }
        .tabBar($r('app.string.tab_title_home'))
        .align(Alignment.Center)

        TabContent() {
          Text("我")
            .width('100%')
            .height('100%')
            .align(Alignment.Center)
        }
        // .tabBar($r('app.string.tab_title_me'))
        .tabBar(this.generateTabBar())
        .align(Alignment.Center)
      }
      .height('100%')
      .width('100%')
      .barHeight(50)
      .barWidth('50%')
      .barMode(BarMode.Scrollable)
      .barPosition(BarPosition.Start)
      .backgroundColor(Color.Orange)
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .backgroundColor(Color.White)
  }
}


class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = []

  unregisterDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) >= 0) {
      console.info('remove listener')
      this.listeners.splice(this.listeners.indexOf(listener), 1)
    }
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener')
      this.listeners.push(listener)
    }
  }

  getData(index: number) {
    return undefined;
  }

  totalCount(): number {
    return 0;
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}

class GridDataSource extends BasicDataSource {
  private dataSource: number[] = [];

  totalCount(): number {
    return this.dataSource.length;
  }

  getData(index: number): any {
    return this.dataSource[index];
  }

  addData(index: number, data: number): void {
    this.dataSource.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  pushData(data: number): void {
    this.dataSource.push(data)
    this.notifyDataAdd(this.dataSource.length - 1);
  }
}