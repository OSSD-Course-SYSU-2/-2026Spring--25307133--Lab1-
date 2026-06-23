// MBTI问卷数据模型

// 问题选项接口
export interface QuestionOption {
  id: number
  label: string
  value: string  // 'A' 或 'B'
  dimension: string  // 'EI', 'NS', 'FT', 'JP'
}

// 问题接口
export interface Question {
  id: number
  title: string
  options: QuestionOption[]
}

// MBTI类型结果接口
export interface MBTIResult {
  type: string
  name: string
  description: string
  characteristics: string[]
  strengths: string[]
  weaknesses: string[]
  careerFit: string[]
}

// 问卷数据
export class QuestionnaireData {

  // 获取28道MBTI题目
  static getQuestions(): Question[] {
    return [
      // 维度一：精力来源 (E/I) - 第1,6,16,17,18,19,22题
      {
        id: 1,
        title: '1. 我倾向拥有：',
        options: [
          { id: 1, label: 'A. 很多认识的人和很亲密的朋友', value: 'A', dimension: 'EI' },
          { id: 2, label: 'B. 一些很亲密的朋友和一些认识的人', value: 'B', dimension: 'EI' }
        ]
      },
      {
        id: 2,
        title: '2. 我倾向比较能够察觉到：',
        options: [
          { id: 1, label: 'A. 当人们需要情感上的支持时', value: 'A', dimension: 'FT' },
          { id: 2, label: 'B. 当人们不合逻辑时', value: 'B', dimension: 'FT' }
        ]
      },
      {
        id: 3,
        title: '3. 我是这种类型的人：',
        options: [
          { id: 1, label: 'A. 与其活在现实中，我选择活在我的想象里', value: 'A', dimension: 'NS' },
          { id: 2, label: 'B. 与其活在我的想象里，我选择活在现实中', value: 'B', dimension: 'NS' }
        ]
      },
      {
        id: 4,
        title: '4. 当我不同意我恋人的想法时：',
        options: [
          { id: 1, label: 'A. 我尽可能地避免伤害对方的感受', value: 'A', dimension: 'FT' },
          { id: 2, label: 'B. 我通常毫无保留地说话，因为对的就是对的', value: 'B', dimension: 'FT' }
        ]
      },
      {
        id: 5,
        title: '5. 当我对一个约会觉得放心时，我倾向谈论：',
        options: [
          { id: 1, label: 'A. 未来改进或发明事物的种种可能性', value: 'A', dimension: 'NS' },
          { id: 2, label: 'B. 实际的、具体的、关于"此时此地"的事物', value: 'B', dimension: 'NS' }
        ]
      },
      {
        id: 6,
        title: '6. 过去，我的恋人倾向对我说这些：',
        options: [
          { id: 1, label: 'A. 你难道不可以安静一点吗？', value: 'A', dimension: 'EI' },
          { id: 2, label: 'B. 可以请你从你的世界中出来一下吗？', value: 'B', dimension: 'EI' }
        ]
      },
      {
        id: 7,
        title: '7. 我通常：',
        options: [
          { id: 1, label: 'A. 下定决心并且做出最后肯定的结论', value: 'A', dimension: 'JP' },
          { id: 2, label: 'B. 开放我的选择并且持续收集信息', value: 'B', dimension: 'JP' }
        ]
      },
      {
        id: 8,
        title: '8. 若朋友邀请我到国外度假，且在一天前才通知，我会：',
        options: [
          { id: 1, label: 'A. 必须先检查我的时间表', value: 'A', dimension: 'JP' },
          { id: 2, label: 'B. 立即收拾行装', value: 'B', dimension: 'JP' }
        ]
      },
      {
        id: 9,
        title: '9. 当和某人分手时：',
        options: [
          { id: 1, label: 'A. 我通常让自己的情绪深陷其中，很难抽身', value: 'A', dimension: 'FT' },
          { id: 2, label: 'B. 虽然受伤，但一旦下定决心，我会直截了当地甩开过去', value: 'B', dimension: 'FT' }
        ]
      },
      {
        id: 10,
        title: '10. 当我置身于一段关系中时，我倾向相信：',
        options: [
          { id: 1, label: 'A. 永远有进步的空间', value: 'A', dimension: 'NS' },
          { id: 2, label: 'B. 若它没有被破坏，别修补它', value: 'B', dimension: 'NS' }
        ]
      },
      {
        id: 11,
        title: '11. 认识我的人倾向形容我为：',
        options: [
          { id: 1, label: 'A. 热情和敏感', value: 'A', dimension: 'FT' },
          { id: 2, label: 'B. 逻辑和明确', value: 'B', dimension: 'FT' }
        ]
      },
      {
        id: 12,
        title: '12. 我通常：',
        options: [
          { id: 1, label: 'A. 偏向于去想象一大堆关于即将来临之约会的事情', value: 'A', dimension: 'NS' },
          { id: 2, label: 'B. 偏向于拘谨地想象约会，只期待让它自然地发生', value: 'B', dimension: 'NS' }
        ]
      },
      {
        id: 13,
        title: '13. 我倾向如此做决定：',
        options: [
          { id: 1, label: 'A. 首先依我的心意，然后依我的逻辑', value: 'A', dimension: 'FT' },
          { id: 2, label: 'B. 首先依我的逻辑，然后依我的心意', value: 'B', dimension: 'FT' }
        ]
      },
      {
        id: 14,
        title: '14. 我偏好：',
        options: [
          { id: 1, label: 'A. 事先知道约会的行程和细节', value: 'A', dimension: 'JP' },
          { id: 2, label: 'B. 让约会自然地发生，不做太多计划', value: 'B', dimension: 'JP' }
        ]
      },
      {
        id: 15,
        title: '15. 我选择的生活充满着：',
        options: [
          { id: 1, label: 'A. 日程表和组织', value: 'A', dimension: 'JP' },
          { id: 2, label: 'B. 自然发生和弹性', value: 'B', dimension: 'JP' }
        ]
      },
      {
        id: 16,
        title: '16. 下列哪一种听起来比较吸引人：',
        options: [
          { id: 1, label: 'A. 与恋人到一个有很多人且社交活动频繁的地方', value: 'A', dimension: 'EI' },
          { id: 2, label: 'B. 待在家中与恋人做一些特别的事情', value: 'B', dimension: 'EI' }
        ]
      },
      {
        id: 17,
        title: '17. 过去，我倾向遇见我大部分恋人：',
        options: [
          { id: 1, label: 'A. 在宴会、工作、休闲活动等社交场合', value: 'A', dimension: 'EI' },
          { id: 2, label: 'B. 通过私人的方式，如朋友介绍或私人广告', value: 'B', dimension: 'EI' }
        ]
      },
      {
        id: 18,
        title: '18. 当我参加一个社交聚会时，我比较可能是：',
        options: [
          { id: 1, label: 'A. 最晚离开的那一个', value: 'A', dimension: 'EI' },
          { id: 2, label: 'B. 在夜晚刚开始的时候就想回家', value: 'B', dimension: 'EI' }
        ]
      },
      {
        id: 19,
        title: '19. 在约会中，我通常：',
        options: [
          { id: 1, label: 'A. 整体来说蛮健谈的', value: 'A', dimension: 'EI' },
          { id: 2, label: 'B. 较安静并保留，直到我觉得舒服', value: 'B', dimension: 'EI' }
        ]
      },
      {
        id: 20,
        title: '20. 当与一个人交往时，我倾向看重：',
        options: [
          { id: 1, label: 'A. 情感上的兼容性：表达爱意和对需求敏感', value: 'A', dimension: 'FT' },
          { id: 2, label: 'B. 智慧上的兼容性：客观地讨论和辩论重要想法', value: 'B', dimension: 'FT' }
        ]
      },
      {
        id: 21,
        title: '21. 我把大部分和别人的相遇视为：',
        options: [
          { id: 1, label: 'A. 友善及重要的', value: 'A', dimension: 'FT' },
          { id: 2, label: 'B. 另有目的', value: 'B', dimension: 'FT' }
        ]
      },
      {
        id: 22,
        title: '22. 我倾向从何处得到力量：',
        options: [
          { id: 1, label: 'A. 别人', value: 'A', dimension: 'EI' },
          { id: 2, label: 'B. 我自己的想法', value: 'B', dimension: 'EI' }
        ]
      },
      {
        id: 23,
        title: '23. 我是这种人：',
        options: [
          { id: 1, label: 'A. 喜欢先看整个大局面', value: 'A', dimension: 'NS' },
          { id: 2, label: 'B. 喜欢先掌握细节', value: 'B', dimension: 'NS' }
        ]
      },
      {
        id: 24,
        title: '24. 在第一次约会中：',
        options: [
          { id: 1, label: 'A. 若对方来迟了，我会很不高兴', value: 'A', dimension: 'JP' },
          { id: 2, label: 'B. 一点都不在乎，因为我自己也常迟到', value: 'B', dimension: 'JP' }
        ]
      },
      {
        id: 25,
        title: '25. 哪一项较为常见：',
        options: [
          { id: 1, label: 'A. 我准时出席而其他人迟到', value: 'A', dimension: 'JP' },
          { id: 2, label: 'B. 其他人都准时出席而我迟到', value: 'B', dimension: 'JP' }
        ]
      },
      {
        id: 26,
        title: '26. 我倾向通过以下方式收集信息：',
        options: [
          { id: 1, label: 'A. 我对有可能发生之事的想象和期望', value: 'A', dimension: 'NS' },
          { id: 2, label: 'B. 我对目前状况的实际认知', value: 'B', dimension: 'NS' }
        ]
      },
      {
        id: 27,
        title: '27. 我倾向相信：',
        options: [
          { id: 1, label: 'A. 我的直觉', value: 'A', dimension: 'NS' },
          { id: 2, label: 'B. 我直接的观察和现成的经验', value: 'B', dimension: 'NS' }
        ]
      },
      {
        id: 28,
        title: '28. 我是这类型的人：',
        options: [
          { id: 1, label: 'A. 喜欢在一个时间里专心于一件事情直到完成', value: 'A', dimension: 'JP' },
          { id: 2, label: 'B. 享受同时进行好几件事情', value: 'B', dimension: 'JP' }
        ]
      }
    ]
  }

  // 计算MBTI类型
  static calculateMBTI(answers: Map<number, string>): MBTIResult {
    // 统计各维度得分
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
          let dimension: string = option.dimension
          if (dimension === 'EI') {
            if (value === 'A') eScore++
            else iScore++
          } else if (dimension === 'NS') {
            if (value === 'A') nScore++
            else sScore++
          } else if (dimension === 'FT') {
            if (value === 'A') fScore++
            else tScore++
          } else if (dimension === 'JP') {
            if (value === 'A') jScore++
            else pScore++
          }
        }
      }
    })

    // 确定类型
    let type: string = ''
    type += eScore >= iScore ? 'E' : 'I'
    type += nScore >= sScore ? 'N' : 'S'
    type += fScore >= tScore ? 'F' : 'T'
    type += jScore >= pScore ? 'J' : 'P'

    return QuestionnaireData.getMBTIDescription(type)
  }

  // 获取MBTI类型描述
  static getMBTIDescription(type: string): MBTIResult {
    let descriptions: Record<string, MBTIResult> = {
      'INTJ': {
        type: 'INTJ',
        name: '建筑师',
        description: '富有战略性和创新性思维，独立且果断。你擅长制定长期计划并坚持执行。',
        characteristics: ['战略思维', '独立自主', '完美主义', '远见卓识'],
        strengths: ['优秀的规划能力', '高度自驱', '逻辑分析能力强'],
        weaknesses: ['可能显得冷漠', '对他人要求过高', '不善于表达情感'],
        careerFit: ['科学家', '工程师', '管理顾问', '投资分析师']
      },
      'INTP': {
        type: 'INTP',
        name: '逻辑学家',
        description: '创新的思想家，对知识有着无尽的好奇心。你喜欢探索理论和新想法。',
        characteristics: ['逻辑分析', '创新思维', '知识渴求', '独立思考'],
        strengths: ['出色的分析能力', '创造性解决问题', '客观理性'],
        weaknesses: ['可能过于理论化', '不善社交', '容易分心'],
        careerFit: ['程序员', '数学研究员', '大学教授', '技术作家']
      },
      'ENTJ': {
        type: 'ENTJ',
        name: '指挥官',
        description: '天生的领导者，具有魅力和自信。你善于组织人和资源达成目标。',
        characteristics: ['领导力强', '果断决策', '目标导向', '善于组织'],
        strengths: ['优秀的领导能力', '战略规划', '执行力强'],
        weaknesses: ['可能过于强势', '缺乏耐心', '忽视他人感受'],
        careerFit: ['CEO', '政治家', '军事指挥官', '企业高管']
      },
      'ENTP': {
        type: 'ENTP',
        name: '辩论家',
        description: '聪明好奇的思想家，喜欢智力挑战。你善于发现可能性并热衷辩论。',
        characteristics: ['机智灵活', '善于辩论', '创新思维', '多才多艺'],
        strengths: ['快速学习能力', '创新解决问题', '适应力强'],
        weaknesses: ['可能争论过度', '不够专注', '忽视细节'],
        careerFit: ['企业家', '律师', '创意总监', '产品经理']
      },
      'INFJ': {
        type: 'INFJ',
        name: '提倡者',
        description: '安静而神秘，具有深刻的洞察力和强烈的理想主义。你致力于帮助他人。',
        characteristics: ['富有洞察力', '理想主义', '富有同情心', '创造力强'],
        strengths: ['深刻的理解力', '激励他人', '创造性表达'],
        weaknesses: ['可能过于敏感', '容易倦怠', '难以被了解'],
        careerFit: ['心理咨询师', '作家', '人力资源', '非营利组织']
      },
      'INFP': {
        type: 'INFP',
        name: '调停者',
        description: '理想主义者，忠于价值观和重要的人。你追求内在和谐与生命意义。',
        characteristics: ['理想主义', '富有创造力', '重视价值观', '善解人意'],
        strengths: ['创造性思维', '同理心强', '忠于信念'],
        weaknesses: ['可能过于理想化', '容易失望', '不善处理冲突'],
        careerFit: ['作家', '艺术家', '心理咨询师', '社会工作者']
      },
      'ENFJ': {
        type: 'ENFJ',
        name: '主人公',
        description: '富有魅力且鼓舞人心的领导者，善于了解他人的需求和潜力。',
        characteristics: ['富有魅力', '善解人意', '领导能力', '理想主义'],
        strengths: ['激励他人', '沟通能力强', '组织协调'],
        weaknesses: ['可能过度投入', '忽视自己需求', '难以说"不"'],
        careerFit: ['教师', '培训师', '政治家', '人力资源总监']
      },
      'ENFP': {
        type: 'ENFP',
        name: '竞选者',
        description: '热情、富有创造力和社交能力。你总能找到理由微笑，善于发现可能性。',
        characteristics: ['热情洋溢', '创造力强', '社交能力', '乐观积极'],
        strengths: ['鼓舞人心', '适应力强', '创新思维'],
        weaknesses: ['可能不够专注', '过度乐观', '不善执行细节'],
        careerFit: ['记者', '广告创意', '企业家', '演员']
      },
      'ISTJ': {
        type: 'ISTJ',
        name: '物流师',
        description: '正直、务实且可靠。你喜欢秩序、规则和清晰的期望。',
        characteristics: ['务实可靠', '注重细节', '责任性强', '遵守规则'],
        strengths: ['执行力强', '组织能力', '忠诚可靠'],
        weaknesses: ['可能过于固执', '抗拒改变', '不够灵活'],
        careerFit: ['会计师', '审计师', '军事人员', '行政管理者']
      },
      'ISFJ': {
        type: 'ISFJ',
        name: '守卫者',
        description: '专注且温暖的守护者。你善于照顾他人，注重细节和实际需求。',
        characteristics: ['温暖体贴', '责任性强', '注重细节', '忠诚可靠'],
        strengths: ['细心周到', '踏实可靠', '关怀他人'],
        weaknesses: ['可能过于谦卑', '不善拒绝', '压抑自己需求'],
        careerFit: ['护士', '教师', '行政助理', '社工']
      },
      'ESTJ': {
        type: 'ESTJ',
        name: '总经理',
        description: '出色的组织者，实事求是。你喜欢秩序、规则和明确的期望。',
        characteristics: ['组织能力强', '务实高效', '决策果断', '责任性强'],
        strengths: ['执行力强', '领导能力', '可靠务实'],
        weaknesses: ['可能过于强势', '不够灵活', '忽视情感因素'],
        careerFit: ['管理者', '军官', '法官', '财务主管']
      },
      'ESFJ': {
        type: 'ESFJ',
        name: '执政官',
        description: '关怀他人、善于社交和合作。你喜欢帮助他人并维护和谐关系。',
        characteristics: ['热情友善', '善于合作', '关怀他人', '责任性强'],
        strengths: ['社交能力强', '组织协调', '细心周到'],
        weaknesses: ['可能过度依赖认可', '不善处理批评', '过于传统'],
        careerFit: ['销售经理', '客户服务', '医疗工作者', '教师']
      },
      'ISTP': {
        type: 'ISTP',
        name: '鉴赏家',
        description: '大胆而实际的操作者。你善于使用工具和掌握技能解决实际问题。',
        characteristics: ['实际冷静', '动手能力强', '适应力强', '独立自主'],
        strengths: ['解决问题能力', '冷静理性', '技能多样'],
        weaknesses: ['可能显得冷漠', '不善表达', '容易冒险'],
        careerFit: ['工程师', '技术专家', '飞行员', '外科医生']
      },
      'ISFP': {
        type: 'ISFP',
        name: '探险家',
        description: '灵活而富有魅力的艺术家。你享受当下，通过实践探索世界。',
        characteristics: ['艺术感性强', '随和友善', '热爱自由', '实践导向'],
        strengths: ['审美能力', '适应力强', '善解人意'],
        weaknesses: ['可能过于被动', '不善长远规划', '容易逃避冲突'],
        careerFit: ['设计师', '艺术家', '摄影师', '厨师']
      },
      'ESTP': {
        type: 'ESTP',
        name: '企业家',
        description: '精力充沛的问题解决者。你喜欢冒险、行动和即时结果。',
        characteristics: ['精力充沛', '行动导向', '善于交际', '风险偏好'],
        strengths: ['快速决策', '适应力强', '务实有效'],
        weaknesses: ['可能冲动', '缺乏耐心', '忽视长远规划'],
        careerFit: ['销售', '创业者', '急救人员', '运动员']
      },
      'ESFP': {
        type: 'ESFP',
        name: '表演者',
        description: '自发的、热情的表演者。你喜欢人群、乐趣和当下体验。',
        characteristics: ['热情开朗', '善于社交', '乐观积极', '享受生活'],
        strengths: ['人际交往', '感染力强', '适应力强'],
        weaknesses: ['可能缺乏计划', '容易分心', '不善深度思考'],
        careerFit: ['演员', '销售', '导游', '活动策划']
      }
    }

    // 默认返回
    if (descriptions[type]) {
      return descriptions[type]
    }

    return {
      type: type,
      name: '独特个体',
      description: '你是一个独特的个体，拥有多种特质。',
      characteristics: ['独特', '多元', '复杂'],
      strengths: ['适应性'],
      weaknesses: ['需要更多自我探索'],
      careerFit: ['探索适合的领域']
    }
  }
}