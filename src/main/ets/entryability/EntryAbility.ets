import UIAbility from '@ohos.app.ability.UIAbility'
import window from '@ohos.window'

export default class EntryAbility extends UIAbility {
  onCreate(want: object, launchParam: object): void {
    console.info('EntryAbility onCreate')
  }

  onDestroy(): void {
    console.info('EntryAbility onDestroy')
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('pages/QuestionnairePageResponsive', (err: Error): void => {
      if (err) {
        console.error('Failed to load content')
        return
      }
    })
  }

  onWindowStageDestroy(): void {
    console.info('onWindowStageDestroy')
  }

  onForeground(): void {
    console.info('onForeground')
  }

  onBackground(): void {
    console.info('onBackground')
  }
}