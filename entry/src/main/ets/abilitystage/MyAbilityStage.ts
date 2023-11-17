import AbilityStage from '@ohos.app.ability.AbilityStage';
import hilog from '@ohos.hilog';

export default class MyAbilityStage extends AbilityStage {
  onCreate() {
    hilog.info(0x0001, "MyAbilityStage", "MyAbilityStage onCreate")
  }

  onConfigurationUpdate(newConfig) {
    hilog.info(0x0001, "MyAbilityStage", "MyAbilityStage onConfigurationUpdate")
  }


  onMemoryLevel(level) {
    hilog.info(0x0001, "MyAbilityStage", "MyAbilityStage onMemoryLevel")
  }

  onAcceptWant(want) {
    // 仅specified模式下触发
    return "MyAbilityStage";
  }
}
