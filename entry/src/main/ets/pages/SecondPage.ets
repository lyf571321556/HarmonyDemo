import router from '@ohos.router'
import hilog from '@ohos.hilog';
import featureAbility from '@ohos.ability.featureAbility';
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
        Button('新窗口')
          .onClick(()=>{
            let want = {
              // deviceId: "", // deviceId为空表示本设备
              bundleName: "com.example.myapplication",
              abilityName: "Second_entryAbility",
              // moduleName: "device", // moduleName非必选，默认为当前UIAbility所在的Module
              // parameters: { // 自定义信息 specified 模式
              //   instanceKey: getInstance(),
              // },
            }
            getContext(this).getApplicationContext().startAbility({want:want}).then((data)=>{
              hilog.info(0x0001,'Second Ability','打开一个新Ability成功')
            }).catch((error)=>{
              hilog.info(0x0001,'Second Ability','打开一个新Ability失败')
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }

}