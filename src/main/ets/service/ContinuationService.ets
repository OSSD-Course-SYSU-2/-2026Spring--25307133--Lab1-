// 流转数据管理服务

// 流转数据接口
class ContinuationData {
  currentIndex: number = 0
  answers: Record<number, string> = {}
  timestamp: number = 0
}

export class ContinuationService {
  private static instance: ContinuationService
  private continuationData: ContinuationData = new ContinuationData()
  private onDataChangeCallback: Function | null = null

  static getInstance(): ContinuationService {
    if (ContinuationService.instance === undefined || ContinuationService.instance === null) {
      ContinuationService.instance = new ContinuationService()
    }
    return ContinuationService.instance
  }

  // 保存流转数据
  saveData(currentIndex: number, answers: Record<number, string>): void {
    let data: ContinuationData = new ContinuationData()
    data.currentIndex = currentIndex

    // 复制answers对象
    let newAnswers: Record<number, string> = {}
    let keys: string[] = Object.keys(answers)
    for (let i: number = 0; i < keys.length; i++) {
      let key: string = keys[i]
      let numKey: number = parseInt(key)
      newAnswers[numKey] = answers[numKey]
    }
    data.answers = newAnswers
    data.timestamp = Date.now()

    this.continuationData = data
    console.info('流转数据已保存: 当前第' + currentIndex + '题')

    // 通知数据变更
    if (this.onDataChangeCallback !== null) {
      this.onDataChangeCallback(this.continuationData)
    }
  }

  // 获取流转数据
  getData(): ContinuationData {
    return this.continuationData
  }

  // 注册数据变更监听
  setOnDataChange(callback: Function): void {
    this.onDataChangeCallback = callback
  }

  // 保存进度
  startSave(currentIndex: number, answers: Record<number, string>): void {
    this.saveData(currentIndex, answers)
    console.info('数据已保存，可在其他设备恢复')
  }

  // 恢复数据
  restoreData(): ContinuationData {
    console.info('从流转恢复数据')
    return this.continuationData
  }
}