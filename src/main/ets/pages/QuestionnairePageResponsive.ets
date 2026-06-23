import router from '@ohos.router'
import display from '@ohos.display'
import { Question, QuestionnaireData } from '../model/QuestionnaireModel'
import { BreakpointSystem, ResponsiveStyles } from '../common/BreakpointSystem'
import { ContinuationService } from '../service/ContinuationService'
import { promptAction } from '@kit.ArkUI'

// 路由参数类
class RouteParams {
  answers: Record<number, string> = {}
}

@Entry
@Component
struct QuestionnairePageResponsive {
  @State currentIndex: number = 0
  @State totalQuestions: number = 28
  @State questions: Question[] = []
  @State selectedValue: string = ''
  @State answers: Record<number, string> = {}
  @State questionTitle: string = ''
  @State optionALabel: string = ''
  @State optionBLabel: string = ''
  @State progressValue: number = 0
  @State deviceType: string = 'sm'
  @State styles: ResponsiveStyles = BreakpointSystem.getResponsiveStyles('sm')
  private continuationService: ContinuationService = ContinuationService.getInstance()

  aboutToAppear(): void {
    this.questions = QuestionnaireData.getQuestions()
    this.totalQuestions = this.questions.length

    // 获取设备类型
    try {
      let displayInfo: display.Display = display.getDefaultDisplaySync()
      this.deviceType = BreakpointSystem.getDeviceType(displayInfo.width)
      this.styles = BreakpointSystem.getResponsiveStyles(this.deviceType)
    } catch (err) {
      console.error('获取设备信息失败')
      this.deviceType = 'sm'
      this.styles = BreakpointSystem.getResponsiveStyles('sm')
    }

    // 尝试恢复流转数据
    let savedData = this.continuationService.restoreData()
    if (savedData.timestamp > 0) {
      this.currentIndex = savedData.currentIndex
      this.answers = savedData.answers

      // 添加恢复提示
      promptAction.showToast({
        message: '已恢复进度：第' + (savedData.currentIndex + 1) + '题',
        duration: 2000
      })
    }

    this.loadQuestion()
  }

  loadQuestion(): void {
    if (this.currentIndex < this.questions.length) {
      let q: Question = this.questions[this.currentIndex]
      this.questionTitle = q.title
      this.optionALabel = q.options[0].label
      this.optionBLabel = q.options[1].label

      let saved: string | undefined = this.answers[this.currentIndex + 1]
      this.selectedValue = saved !== undefined ? saved : ''

      this.progressValue = ((this.currentIndex + 1) / this.totalQuestions) * 100
    }
  }

  selectOption(value: string): void {
    this.selectedValue = value
  }

  nextQuestion(): void {
    if (this.selectedValue === '') {
      promptAction.showToast({
        message: '请选择一个选项',
        duration: 1500
      })
      return
    }

    this.answers[this.currentIndex + 1] = this.selectedValue

    if (this.currentIndex < this.totalQuestions - 1) {
      this.currentIndex++
      this.loadQuestion()
    } else {
      let params: RouteParams = new RouteParams()
      params.answers = this.answers

      try {
        router.pushUrl({
          url: 'pages/ResultPageResponsive',
          params: params
        }, router.RouterMode.Standard)
      } catch (err) {
        console.error('跳转失败')
      }
    }
  }

  previousQuestion(): void {
    if (this.currentIndex > 0) {
      this.answers[this.currentIndex + 1] = this.selectedValue
      this.currentIndex--
      this.loadQuestion()
    }
  }

  saveProgress(): void {
    this.answers[this.currentIndex + 1] = this.selectedValue
    this.continuationService.startSave(this.currentIndex, this.answers)

    promptAction.showDialog({
      title: '流转数据已保存',
      message: '当前进度：第' + (this.currentIndex + 1) + '题\n已完成：' + Object.keys(this.answers).length + '题\n可在另一台设备继续填写',
      buttons: [
        {
          text: '确定',
          color: '#007AFF'
        }
      ]
    })
  }

  build() {
    Column() {
      // 顶部栏
      Row() {
        Text('MBTI测试')
          .fontSize(this.styles.titleFontSize)
          .fontWeight(FontWeight.Bold)

        Blank()

        // 在 build 方法的顶部栏部分，把按钮改成这样：
        Button('📱 流转')
          .fontSize(14)
          .height(36)
          .backgroundColor('#007AFF')
          .fontColor(Color.White)
          .borderRadius(18)
          .padding({ left: 16, right: 16 })
          .onClick((): void => {
            this.saveProgress()
          })
      }
      .width(this.styles.cardWidth)
      .margin({ top: this.styles.paddingSize, bottom: 10 })

      // 进度条
      Progress({ value: this.progressValue, total: 100, type: ProgressType.Linear })
        .width(this.styles.cardWidth)
        .height(6)
        .margin({ bottom: 10 })

      // 题号
      Text('第 ' + (this.currentIndex + 1) + ' 题 / 共 ' + this.totalQuestions + ' 题')
        .fontSize(14)
        .fontColor('#888888')
        .margin({ bottom: 20 })

      // 题目
      Text(this.questionTitle)
        .fontSize(this.styles.questionFontSize)
        .fontWeight(FontWeight.Bold)
        .width(this.styles.cardWidth)
        .textAlign(TextAlign.Start)
        .margin({ bottom: 30 })

      // 选项
      Column({ space: 15 }) {
        // 选项A
        Row() {
          Text(this.selectedValue === 'A' ? '●' : '○')
            .fontSize(20)
            .fontColor(this.selectedValue === 'A' ? '#007AFF' : '#CCCCCC')
            .margin({ right: 10 })

          Text(this.optionALabel)
            .fontSize(this.styles.optionFontSize)
            .fontColor(this.selectedValue === 'A' ? '#007AFF' : '#333333')
            .layoutWeight(1)
            .textAlign(TextAlign.Start)
        }
        .width(this.styles.cardWidth)
        .padding(15)
        .backgroundColor(this.selectedValue === 'A' ? '#E8F4FD' : '#F5F5F5')
        .borderRadius(10)
        .border({
          width: 1,
          color: this.selectedValue === 'A' ? '#007AFF' : '#E0E0E0'
        })
        .onClick((): void => { this.selectOption('A') })

        // 选项B
        Row() {
          Text(this.selectedValue === 'B' ? '●' : '○')
            .fontSize(20)
            .fontColor(this.selectedValue === 'B' ? '#007AFF' : '#CCCCCC')
            .margin({ right: 10 })

          Text(this.optionBLabel)
            .fontSize(this.styles.optionFontSize)
            .fontColor(this.selectedValue === 'B' ? '#007AFF' : '#333333')
            .layoutWeight(1)
            .textAlign(TextAlign.Start)
        }
        .width(this.styles.cardWidth)
        .padding(15)
        .backgroundColor(this.selectedValue === 'B' ? '#E8F4FD' : '#F5F5F5')
        .borderRadius(10)
        .border({
          width: 1,
          color: this.selectedValue === 'B' ? '#007AFF' : '#E0E0E0'
        })
        .onClick((): void => { this.selectOption('B') })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)

      Blank()

      // 底部按钮
      Row() {
        if (this.currentIndex > 0) {
          Button('上一题')
            .width('35%')
            .height(46)
            .fontSize(16)
            .backgroundColor('#F5F5F5')
            .fontColor('#333333')
            .borderRadius(23)
            .onClick((): void => { this.previousQuestion() })
        }

        Button(this.currentIndex < this.totalQuestions - 1 ? '下一题' : '提交问卷')
          .width(this.currentIndex > 0 ? '35%' : this.styles.buttonWidth)
          .height(46)
          .fontSize(16)
          .backgroundColor('#007AFF')
          .fontColor(Color.White)
          .borderRadius(23)
          .onClick((): void => { this.nextQuestion() })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ bottom: this.styles.paddingSize })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}