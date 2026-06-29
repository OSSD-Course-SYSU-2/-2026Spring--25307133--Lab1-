if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface QuestionnairePageResponsive_Params {
    currentIndex?: number;
    totalQuestions?: number;
    questions?: Question[];
    selectedValue?: string;
    answers?: Record<number, string>;
    questionTitle?: string;
    optionALabel?: string;
    optionBLabel?: string;
    progressValue?: number;
    deviceType?: string;
    styles?: ResponsiveStyles;
    continuationService?: ContinuationService;
}
import router from "@ohos:router";
import display from "@ohos:display";
import { QuestionnaireData } from "@normalized:N&&&entry/src/main/ets/model/QuestionnaireModel&";
import type { Question } from "@normalized:N&&&entry/src/main/ets/model/QuestionnaireModel&";
import { BreakpointSystem } from "@normalized:N&&&entry/src/main/ets/common/BreakpointSystem&";
import type { ResponsiveStyles } from "@normalized:N&&&entry/src/main/ets/common/BreakpointSystem&";
import { ContinuationService } from "@normalized:N&&&entry/src/main/ets/service/ContinuationService&";
import promptAction from "@ohos:promptAction";
// 路由参数类
class RouteParams {
    answers: Record<number, string> = {};
}
class QuestionnairePageResponsive extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.__currentIndex = new ObservedPropertySimplePU(0, this, "currentIndex");
        this.__totalQuestions = new ObservedPropertySimplePU(28, this, "totalQuestions");
        this.__questions = new ObservedPropertyObjectPU([], this, "questions");
        this.__selectedValue = new ObservedPropertySimplePU('', this, "selectedValue");
        this.__answers = new ObservedPropertyObjectPU({}, this, "answers");
        this.__questionTitle = new ObservedPropertySimplePU('', this, "questionTitle");
        this.__optionALabel = new ObservedPropertySimplePU('', this, "optionALabel");
        this.__optionBLabel = new ObservedPropertySimplePU('', this, "optionBLabel");
        this.__progressValue = new ObservedPropertySimplePU(0, this, "progressValue");
        this.__deviceType = new ObservedPropertySimplePU('sm', this, "deviceType");
        this.__styles = new ObservedPropertyObjectPU(BreakpointSystem.getResponsiveStyles('sm'), this, "styles");
        this.continuationService = ContinuationService.getInstance();
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: QuestionnairePageResponsive_Params) {
        if (params.currentIndex !== undefined) {
            this.currentIndex = params.currentIndex;
        }
        if (params.totalQuestions !== undefined) {
            this.totalQuestions = params.totalQuestions;
        }
        if (params.questions !== undefined) {
            this.questions = params.questions;
        }
        if (params.selectedValue !== undefined) {
            this.selectedValue = params.selectedValue;
        }
        if (params.answers !== undefined) {
            this.answers = params.answers;
        }
        if (params.questionTitle !== undefined) {
            this.questionTitle = params.questionTitle;
        }
        if (params.optionALabel !== undefined) {
            this.optionALabel = params.optionALabel;
        }
        if (params.optionBLabel !== undefined) {
            this.optionBLabel = params.optionBLabel;
        }
        if (params.progressValue !== undefined) {
            this.progressValue = params.progressValue;
        }
        if (params.deviceType !== undefined) {
            this.deviceType = params.deviceType;
        }
        if (params.styles !== undefined) {
            this.styles = params.styles;
        }
        if (params.continuationService !== undefined) {
            this.continuationService = params.continuationService;
        }
    }
    updateStateVars(params: QuestionnairePageResponsive_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__currentIndex.purgeDependencyOnElmtId(rmElmtId);
        this.__totalQuestions.purgeDependencyOnElmtId(rmElmtId);
        this.__questions.purgeDependencyOnElmtId(rmElmtId);
        this.__selectedValue.purgeDependencyOnElmtId(rmElmtId);
        this.__answers.purgeDependencyOnElmtId(rmElmtId);
        this.__questionTitle.purgeDependencyOnElmtId(rmElmtId);
        this.__optionALabel.purgeDependencyOnElmtId(rmElmtId);
        this.__optionBLabel.purgeDependencyOnElmtId(rmElmtId);
        this.__progressValue.purgeDependencyOnElmtId(rmElmtId);
        this.__deviceType.purgeDependencyOnElmtId(rmElmtId);
        this.__styles.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__currentIndex.aboutToBeDeleted();
        this.__totalQuestions.aboutToBeDeleted();
        this.__questions.aboutToBeDeleted();
        this.__selectedValue.aboutToBeDeleted();
        this.__answers.aboutToBeDeleted();
        this.__questionTitle.aboutToBeDeleted();
        this.__optionALabel.aboutToBeDeleted();
        this.__optionBLabel.aboutToBeDeleted();
        this.__progressValue.aboutToBeDeleted();
        this.__deviceType.aboutToBeDeleted();
        this.__styles.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private __currentIndex: ObservedPropertySimplePU<number>;
    get currentIndex() {
        return this.__currentIndex.get();
    }
    set currentIndex(newValue: number) {
        this.__currentIndex.set(newValue);
    }
    private __totalQuestions: ObservedPropertySimplePU<number>;
    get totalQuestions() {
        return this.__totalQuestions.get();
    }
    set totalQuestions(newValue: number) {
        this.__totalQuestions.set(newValue);
    }
    private __questions: ObservedPropertyObjectPU<Question[]>;
    get questions() {
        return this.__questions.get();
    }
    set questions(newValue: Question[]) {
        this.__questions.set(newValue);
    }
    private __selectedValue: ObservedPropertySimplePU<string>;
    get selectedValue() {
        return this.__selectedValue.get();
    }
    set selectedValue(newValue: string) {
        this.__selectedValue.set(newValue);
    }
    private __answers: ObservedPropertyObjectPU<Record<number, string>>;
    get answers() {
        return this.__answers.get();
    }
    set answers(newValue: Record<number, string>) {
        this.__answers.set(newValue);
    }
    private __questionTitle: ObservedPropertySimplePU<string>;
    get questionTitle() {
        return this.__questionTitle.get();
    }
    set questionTitle(newValue: string) {
        this.__questionTitle.set(newValue);
    }
    private __optionALabel: ObservedPropertySimplePU<string>;
    get optionALabel() {
        return this.__optionALabel.get();
    }
    set optionALabel(newValue: string) {
        this.__optionALabel.set(newValue);
    }
    private __optionBLabel: ObservedPropertySimplePU<string>;
    get optionBLabel() {
        return this.__optionBLabel.get();
    }
    set optionBLabel(newValue: string) {
        this.__optionBLabel.set(newValue);
    }
    private __progressValue: ObservedPropertySimplePU<number>;
    get progressValue() {
        return this.__progressValue.get();
    }
    set progressValue(newValue: number) {
        this.__progressValue.set(newValue);
    }
    private __deviceType: ObservedPropertySimplePU<string>;
    get deviceType() {
        return this.__deviceType.get();
    }
    set deviceType(newValue: string) {
        this.__deviceType.set(newValue);
    }
    private __styles: ObservedPropertyObjectPU<ResponsiveStyles>;
    get styles() {
        return this.__styles.get();
    }
    set styles(newValue: ResponsiveStyles) {
        this.__styles.set(newValue);
    }
    private continuationService: ContinuationService;
    aboutToAppear(): void {
        this.questions = QuestionnaireData.getQuestions();
        this.totalQuestions = this.questions.length;
        // 获取设备类型
        try {
            let displayInfo: display.Display = display.getDefaultDisplaySync();
            this.deviceType = BreakpointSystem.getDeviceType(displayInfo.width);
            this.styles = BreakpointSystem.getResponsiveStyles(this.deviceType);
        }
        catch (err) {
            console.error('获取设备信息失败');
            this.deviceType = 'sm';
            this.styles = BreakpointSystem.getResponsiveStyles('sm');
        }
        // 尝试恢复流转数据
        let savedData = this.continuationService.restoreData();
        if (savedData.timestamp > 0) {
            this.currentIndex = savedData.currentIndex;
            this.answers = savedData.answers;
            // 添加恢复提示
            promptAction.showToast({
                message: '已恢复进度：第' + (savedData.currentIndex + 1) + '题',
                duration: 2000
            });
        }
        this.loadQuestion();
    }
    loadQuestion(): void {
        if (this.currentIndex < this.questions.length) {
            let q: Question = this.questions[this.currentIndex];
            this.questionTitle = q.title;
            this.optionALabel = q.options[0].label;
            this.optionBLabel = q.options[1].label;
            let saved: string | undefined = this.answers[this.currentIndex + 1];
            this.selectedValue = saved !== undefined ? saved : '';
            this.progressValue = ((this.currentIndex + 1) / this.totalQuestions) * 100;
        }
    }
    selectOption(value: string): void {
        this.selectedValue = value;
    }
    nextQuestion(): void {
        if (this.selectedValue === '') {
            promptAction.showToast({
                message: '请选择一个选项',
                duration: 1500
            });
            return;
        }
        this.answers[this.currentIndex + 1] = this.selectedValue;
        if (this.currentIndex < this.totalQuestions - 1) {
            this.currentIndex++;
            this.loadQuestion();
        }
        else {
            let params: RouteParams = new RouteParams();
            params.answers = this.answers;
            try {
                router.pushUrl({
                    url: 'pages/ResultPageResponsive',
                    params: params
                }, router.RouterMode.Standard);
            }
            catch (err) {
                console.error('跳转失败');
            }
        }
    }
    previousQuestion(): void {
        if (this.currentIndex > 0) {
            this.answers[this.currentIndex + 1] = this.selectedValue;
            this.currentIndex--;
            this.loadQuestion();
        }
    }
    saveProgress(): void {
        this.answers[this.currentIndex + 1] = this.selectedValue;
        this.continuationService.startSave(this.currentIndex, this.answers);
        promptAction.showDialog({
            title: '流转数据已保存',
            message: '当前进度：第' + (this.currentIndex + 1) + '题\n已完成：' + Object.keys(this.answers).length + '题\n可在另一台设备继续填写',
            buttons: [
                {
                    text: '确定',
                    color: '#007AFF'
                }
            ]
        });
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width('100%');
            Column.height('100%');
            Column.backgroundColor('#FFFFFF');
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 顶部栏
            Row.create();
            // 顶部栏
            Row.width(this.styles.cardWidth);
            // 顶部栏
            Row.margin({ top: this.styles.paddingSize, bottom: 10 });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('MBTI测试');
            Text.fontSize(this.styles.titleFontSize);
            Text.fontWeight(FontWeight.Bold);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Blank.create();
        }, Blank);
        Blank.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 在 build 方法的顶部栏部分，把按钮改成这样：
            Button.createWithLabel('📱 流转');
            // 在 build 方法的顶部栏部分，把按钮改成这样：
            Button.fontSize(14);
            // 在 build 方法的顶部栏部分，把按钮改成这样：
            Button.height(36);
            // 在 build 方法的顶部栏部分，把按钮改成这样：
            Button.backgroundColor('#007AFF');
            // 在 build 方法的顶部栏部分，把按钮改成这样：
            Button.fontColor(Color.White);
            // 在 build 方法的顶部栏部分，把按钮改成这样：
            Button.borderRadius(18);
            // 在 build 方法的顶部栏部分，把按钮改成这样：
            Button.padding({ left: 16, right: 16 });
            // 在 build 方法的顶部栏部分，把按钮改成这样：
            Button.onClick((): void => {
                this.saveProgress();
            });
        }, Button);
        // 在 build 方法的顶部栏部分，把按钮改成这样：
        Button.pop();
        // 顶部栏
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 进度条
            Progress.create({ value: this.progressValue, total: 100, type: ProgressType.Linear });
            // 进度条
            Progress.width(this.styles.cardWidth);
            // 进度条
            Progress.height(6);
            // 进度条
            Progress.margin({ bottom: 10 });
        }, Progress);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 题号
            Text.create('第 ' + (this.currentIndex + 1) + ' 题 / 共 ' + this.totalQuestions + ' 题');
            // 题号
            Text.fontSize(14);
            // 题号
            Text.fontColor('#888888');
            // 题号
            Text.margin({ bottom: 20 });
        }, Text);
        // 题号
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 题目
            Text.create(this.questionTitle);
            // 题目
            Text.fontSize(this.styles.questionFontSize);
            // 题目
            Text.fontWeight(FontWeight.Bold);
            // 题目
            Text.width(this.styles.cardWidth);
            // 题目
            Text.textAlign(TextAlign.Start);
            // 题目
            Text.margin({ bottom: 30 });
        }, Text);
        // 题目
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 选项
            Column.create({ space: 15 });
            // 选项
            Column.width('100%');
            // 选项
            Column.alignItems(HorizontalAlign.Center);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 选项A
            Row.create();
            // 选项A
            Row.width(this.styles.cardWidth);
            // 选项A
            Row.padding(15);
            // 选项A
            Row.backgroundColor(this.selectedValue === 'A' ? '#E8F4FD' : '#F5F5F5');
            // 选项A
            Row.borderRadius(10);
            // 选项A
            Row.border({
                width: 1,
                color: this.selectedValue === 'A' ? '#007AFF' : '#E0E0E0'
            });
            // 选项A
            Row.onClick((): void => { this.selectOption('A'); });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.selectedValue === 'A' ? '●' : '○');
            Text.fontSize(20);
            Text.fontColor(this.selectedValue === 'A' ? '#007AFF' : '#CCCCCC');
            Text.margin({ right: 10 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.optionALabel);
            Text.fontSize(this.styles.optionFontSize);
            Text.fontColor(this.selectedValue === 'A' ? '#007AFF' : '#333333');
            Text.layoutWeight(1);
            Text.textAlign(TextAlign.Start);
        }, Text);
        Text.pop();
        // 选项A
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 选项B
            Row.create();
            // 选项B
            Row.width(this.styles.cardWidth);
            // 选项B
            Row.padding(15);
            // 选项B
            Row.backgroundColor(this.selectedValue === 'B' ? '#E8F4FD' : '#F5F5F5');
            // 选项B
            Row.borderRadius(10);
            // 选项B
            Row.border({
                width: 1,
                color: this.selectedValue === 'B' ? '#007AFF' : '#E0E0E0'
            });
            // 选项B
            Row.onClick((): void => { this.selectOption('B'); });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.selectedValue === 'B' ? '●' : '○');
            Text.fontSize(20);
            Text.fontColor(this.selectedValue === 'B' ? '#007AFF' : '#CCCCCC');
            Text.margin({ right: 10 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.optionBLabel);
            Text.fontSize(this.styles.optionFontSize);
            Text.fontColor(this.selectedValue === 'B' ? '#007AFF' : '#333333');
            Text.layoutWeight(1);
            Text.textAlign(TextAlign.Start);
        }, Text);
        Text.pop();
        // 选项B
        Row.pop();
        // 选项
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Blank.create();
        }, Blank);
        Blank.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 底部按钮
            Row.create();
            // 底部按钮
            Row.width('100%');
            // 底部按钮
            Row.justifyContent(FlexAlign.SpaceAround);
            // 底部按钮
            Row.margin({ bottom: this.styles.paddingSize });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            if (this.currentIndex > 0) {
                this.ifElseBranchUpdateFunction(0, () => {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Button.createWithLabel('上一题');
                        Button.width('35%');
                        Button.height(46);
                        Button.fontSize(16);
                        Button.backgroundColor('#F5F5F5');
                        Button.fontColor('#333333');
                        Button.borderRadius(23);
                        Button.onClick((): void => { this.previousQuestion(); });
                    }, Button);
                    Button.pop();
                });
            }
            else {
                this.ifElseBranchUpdateFunction(1, () => {
                });
            }
        }, If);
        If.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel(this.currentIndex < this.totalQuestions - 1 ? '下一题' : '提交问卷');
            Button.width(this.currentIndex > 0 ? '35%' : this.styles.buttonWidth);
            Button.height(46);
            Button.fontSize(16);
            Button.backgroundColor('#007AFF');
            Button.fontColor(Color.White);
            Button.borderRadius(23);
            Button.onClick((): void => { this.nextQuestion(); });
        }, Button);
        Button.pop();
        // 底部按钮
        Row.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "QuestionnairePageResponsive";
    }
}
registerNamedRoute(() => new QuestionnairePageResponsive(undefined, {}), "", { bundleName: "com.example.questionnaire", moduleName: "entry", pagePath: "pages/QuestionnairePageResponsive", pageFullPath: "entry/src/main/ets/pages/QuestionnairePageResponsive", integratedHsp: "false", moduleType: "followWithHap" });
