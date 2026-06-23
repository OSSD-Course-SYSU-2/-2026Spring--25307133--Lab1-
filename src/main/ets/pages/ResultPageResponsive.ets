import router from '@ohos.router'
import display from '@ohos.display'
import { QuestionnaireData, MBTIResult, Question, QuestionOption } from '../model/QuestionnaireModel'
import { BreakpointSystem, ResponsiveStyles } from '../common/BreakpointSystem'

interface RouteParams {
  answers: Record<number, string>
}

@Entry
@Component
struct ResultPageResponsive {
  @State mbtiType: string = ''
  @State typeName: string = ''
  @State description: string = ''
  @State characteristics: string[] = []
  @State strengths: string[] = []
  @State weaknesses: string[] = []
  @State careerFit: string[] = []
  @State dimensionScores: string[] = []
  @State styles: ResponsiveStyles = BreakpointSystem.getResponsiveStyles('sm')

  aboutToAppear(): void {
    // 获取设备类型
    let displayInfo = display.getDefaultDisplaySync()
    let deviceType: string = BreakpointSystem.getDeviceType(displayInfo.width)
    this.styles = BreakpointSystem.getResponsiveStyles(deviceType)

    let params: RouteParams = router.getParams() as RouteParams

    if (params && params.answers) {
      let answerMap: Map<number, string> = new Map()
      let answerKeys: string[] = Object.keys(params.answers)
      for (let key of answerKeys) {
        let numKey: number = parseInt(key)
        answerMap.set(numKey, params.answers[numKey])
      }

      let result: MBTIResult = QuestionnaireData.calculateMBTI(answerMap)
      this.mbtiType = result.type
      this.typeName = result.name
      this.description = result.description
      this.characteristics = result.characteristics
      this.strengths = result.strengths
      this.weaknesses = result.weaknesses
      this.careerFit = result.careerFit

      this.calculateDimensions(answerMap)
    }
  }

  calculateDimensions(answers: Map<number, string>): void {
    let eScore: number = 0
    let iScore: number = 0
    let nScore: number = 0
    let sScore: number = 0
    let fScore: number = 0
    let tScore: number = 0
    let jScore: number = 0
    let pScore: number = 0

    let questions: Question[] = QuestionnaireData.getQuestions()

    answers.forEach((value: string, questionId: number): void => {
      let question: Question | undefined = questions.find((q: Question): boolean => q.id === questionId)
      if (question) {
        let option: QuestionOption | undefined = question.options.find((o: QuestionOption): boolean => o.value === value)
        if (option) {
          let dim: string = option.dimension
          if (dim === 'EI') {
            if (value === 'A') { eScore++ } else { iScore++ }
          } else if (dim === 'NS') {
            if (value === 'A') { nScore++ } else { sScore++ }
          } else if (dim === 'FT') {
            if (value === 'A') { fScore++ } else { tScore++ }
          } else if (dim === 'JP') {
            if (value === 'A') { jScore++ } else { pScore++ }
          }
        }
      }
    })

    this.dimensionScores = [
      '外向(E):' + eScore + '  内向(I):' + iScore,
      '直觉(N):' + nScore + '  实感(S):' + sScore,
      '情感(F):' + fScore + '  思考(T):' + tScore,
      '判断(J):' + jScore + '  感知(P):' + pScore
    ]
  }

  @Builder
  buildSection(title: string, items: string[], color: string) {
    Column() {
      Text(title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333333')
        .margin({ bottom: 10 })

      Column() {
        Row() {
          ForEach(items.slice(0, Math.ceil(items.length / 2)), (item: string): void => {
            Text(item)
              .fontSize(14)
              .fontColor(Color.White)
              .backgroundColor(color)
              .borderRadius(15)
              .padding({ top: 6, bottom: 6, left: 12, right: 12 })
              .margin({ right: 8, bottom: 8 })
          }, (item: string): string => item)
        }

        if (items.length > Math.ceil(items.length / 2)) {
          Row() {
            ForEach(items.slice(Math.ceil(items.length / 2)), (item: string): void => {
              Text(item)
                .fontSize(14)
                .fontColor(Color.White)
                .backgroundColor(color)
                .borderRadius(15)
                .padding({ top: 6, bottom: 6, left: 12, right: 12 })
                .margin({ right: 8, bottom: 8 })
            }, (item: string): string => item)
          }
        }
      }
      .alignItems(HorizontalAlign.Start)
    }
    .width(this.styles.cardWidth)
    .padding(15)
    .backgroundColor('#FFFFFF')
    .borderRadius(10)
    .border({
      width: 1,
      color: '#E8E8E8'
    })
    .alignItems(HorizontalAlign.Start)
  }

  restart(): void {
    router.replaceUrl({
      url: 'pages/QuestionnairePageResponsive'
    }).catch((err: Error): void => {
      console.error('跳转失败：' + err.message)
    })
  }

  build() {
    Column() {
      Text('MBTI测试结果')
        .fontSize(this.styles.titleFontSize)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 25, bottom: 10 })

      Scroll() {
        Column({ space: 15 }) {
          // 类型标识
          Column() {
            Text(this.mbtiType)
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
              .fontColor('#007AFF')

            Text(this.typeName)
              .fontSize(22)
              .fontColor('#333333')
              .margin({ top: 5 })
          }
          .width(this.styles.cardWidth)
          .padding(20)
          .backgroundColor('#F0F6FF')
          .borderRadius(15)

          // 描述
          Text(this.description)
            .fontSize(this.styles.optionFontSize)
            .fontColor('#555555')
            .lineHeight(24)
            .width(this.styles.cardWidth)
            .textAlign(TextAlign.Start)

          // 维度得分
          Column() {
            Text('📊 各维度得分')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })

            ForEach(this.dimensionScores, (score: string): void => {
              Text(score)
                .fontSize(15)
                .fontColor('#666666')
                .margin({ bottom: 5 })
            }, (score: string): string => score)
          }
          .width(this.styles.cardWidth)
          .padding(15)
          .backgroundColor('#FFF9F0')
          .borderRadius(10)
          .alignItems(HorizontalAlign.Start)

          // 性格特征
          this.buildSection('🎯 性格特征', this.characteristics, '#4A90E2')

          // 优势
          this.buildSection('💪 个人优势', this.strengths, '#50C878')

          // 弱点
          this.buildSection('⚠️ 需要注意', this.weaknesses, '#FF6B6B')

          // 职业推荐
          this.buildSection('💼 适合职业', this.careerFit, '#6C5CE7')

          Blank()
            .height(20)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)

      Button('重新测试')
        .width(this.styles.buttonWidth)
        .height(48)
        .fontSize(18)
        .backgroundColor('#007AFF')
        .fontColor(Color.White)
        .borderRadius(24)
        .margin({ bottom: 25 })
        .onClick((): void => { this.restart() })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}