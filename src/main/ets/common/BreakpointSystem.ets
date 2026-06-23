// 断点系统 - 用于多端适配
export class BreakpointSystem {
  // 当前设备类型
  static currentDevice: string = 'sm'

  // 断点常量
  static readonly BREAKPOINT_SM: number = 320
  static readonly BREAKPOINT_MD: number = 600
  static readonly BREAKPOINT_LG: number = 840

  // 根据宽度判断设备类型
  static getDeviceType(width: number): string {
    if (width >= BreakpointSystem.BREAKPOINT_LG) return 'lg'
    if (width >= BreakpointSystem.BREAKPOINT_MD) return 'md'
    return 'sm'
  }

  // 获取响应式样式
  static getResponsiveStyles(deviceType: string): ResponsiveStyles {
    switch(deviceType) {
      case 'lg':
        return {
          questionFontSize: 24,
          optionFontSize: 18,
          cardWidth: '70%',
          titleFontSize: 32,
          paddingSize: 30,
          buttonWidth: '60%'
        }
      case 'md':
        return {
          questionFontSize: 20,
          optionFontSize: 16,
          cardWidth: '80%',
          titleFontSize: 28,
          paddingSize: 20,
          buttonWidth: '70%'
        }
      default:
        return {
          questionFontSize: 18,
          optionFontSize: 15,
          cardWidth: '90%',
          titleFontSize: 24,
          paddingSize: 15,
          buttonWidth: '85%'
        }
    }
  }
}

// 响应式样式接口
export interface ResponsiveStyles {
  questionFontSize: number
  optionFontSize: number
  cardWidth: string
  titleFontSize: number
  paddingSize: number
  buttonWidth: string
}