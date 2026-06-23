import router from '@ohos.router'
import { Question, QuestionnaireData } from '../model/QuestionnaireModel'

interface RouteParams {
  answers: Record<number, string>
}

@Entry
@Component
struct QuestionnairePage {
  @State currentIndex: number = 0
  @State totalQuestions: number = 28
  @State questions: Question[] = []
  @State selectedValue: string = ''
  @State answers: Record<number, string> = {}
  @State questionTitle: string = ''
  @State optionALabel: string = ''
  @State optionBLabel: string = ''
  @State progressValue: number = 0

  aboutToAppear(): void {
    this.questions = QuestionnaireData.getQuestions()
    this.totalQuestions = this.questions.length
    this.loadQuestion()
  }

  loadQuestion(): void {
    if (this.currentIndex < this.questions.length) {
      let q: Question = this.questions[this.currentIndex]
      this.questionTitle = q.title
      this.optionALabel = q.options[0].label
      this.optionBLabel = q.options[1].label

      // 恢复之前的选择
      let saved: string | undefined = this.answers[this.currentIndex + 1]
      this.selectedValue = saved || ''

      this.progressValue = ((this.currentIndex + 1) / this.totalQuestions) * 100
    }
  }

  selectOption(value: string): void {
    this.selectedValue = value
  }

  nextQuestion(): void {
    if (this.selectedValue === '') {
      // 提示选择
      return
    }

    // 保存答案
    this.answers[this.currentIndex + 1] = this.selectedValue

    if (this.currentIndex < this.totalQuestions - 1) {
      this.currentIndex++
      this.loadQuestion()
    } else {
      // 提交，跳转结果页
      let params: RouteParams = {
        answers: this.answers
      }
      router.pushUrl({
        url: 'pages/ResultPage',
        params: params
      }).catch((err: Error): void => {
        console.error('跳转失败：' + err.message)
      })
    }
  }

  previousQuestion(): void {
    if (this.currentIndex > 0) {
      this.answers[this.currentIndex + 1] = this.selectedValue
      this.currentIndex--
      this.loadQuestion()
    }
  }

  build() {
    Column() {
      // 标题
      Text('MBTI职业性格测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 5 })

      // 进度条
      Progress({ value: this.progressValue, total: 100, type: ProgressType.Linear })
        .width('90%')
        .height(6)
        .margin({ bottom: 10 })

      // 题号
      Text(`第 ${this.currentIndex + 1} 题 / 共 ${this.totalQuestions} 题`)
        .fontSize(14)
        .fontColor('#888888')
        .margin({ bottom: 20 })

      // 题目
      Text(this.questionTitle)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .width('90%')
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
            .fontSize(16)
            .fontColor(this.selectedValue === 'A' ? '#007AFF' : '#333333')
            .layoutWeight(1)
            .textAlign(TextAlign.Start)
        }
        .width('90%')
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
            .fontSize(16)
            .fontColor(this.selectedValue === 'B' ? '#007AFF' : '#333333')
            .layoutWeight(1)
            .textAlign(TextAlign.Start)
        }
        .width('90%')
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
            .width('40%')
            .height(46)
            .fontSize(16)
            .backgroundColor('#F5F5F5')
            .fontColor('#333333')
            .borderRadius(23)
            .onClick((): void => { this.previousQuestion() })
        }

        Button(this.currentIndex < this.totalQuestions - 1 ? '下一题' : '提交问卷')
          .width(this.currentIndex > 0 ? '40%' : '80%')
          .height(46)
          .fontSize(16)
          .backgroundColor('#007AFF')
          .fontColor(Color.White)
          .borderRadius(23)
          .onClick((): void => { this.nextQuestion() })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ bottom: 25 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}