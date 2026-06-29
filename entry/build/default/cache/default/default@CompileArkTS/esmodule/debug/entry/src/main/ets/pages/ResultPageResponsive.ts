if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface ResultPageResponsive_Params {
    mbtiType?: string;
    typeName?: string;
    description?: string;
    characteristics?: string[];
    strengths?: string[];
    weaknesses?: string[];
    careerFit?: string[];
    dimensionScores?: string[];
    styles?: ResponsiveStyles;
}
import router from "@ohos:router";
import display from "@ohos:display";
import { QuestionnaireData } from "@normalized:N&&&entry/src/main/ets/model/QuestionnaireModel&";
import type { MBTIResult, Question, QuestionOption } from "@normalized:N&&&entry/src/main/ets/model/QuestionnaireModel&";
import { BreakpointSystem } from "@normalized:N&&&entry/src/main/ets/common/BreakpointSystem&";
import type { ResponsiveStyles } from "@normalized:N&&&entry/src/main/ets/common/BreakpointSystem&";
interface RouteParams {
    answers: Record<number, string>;
}
class ResultPageResponsive extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.__mbtiType = new ObservedPropertySimplePU('', this, "mbtiType");
        this.__typeName = new ObservedPropertySimplePU('', this, "typeName");
        this.__description = new ObservedPropertySimplePU('', this, "description");
        this.__characteristics = new ObservedPropertyObjectPU([], this, "characteristics");
        this.__strengths = new ObservedPropertyObjectPU([], this, "strengths");
        this.__weaknesses = new ObservedPropertyObjectPU([], this, "weaknesses");
        this.__careerFit = new ObservedPropertyObjectPU([], this, "careerFit");
        this.__dimensionScores = new ObservedPropertyObjectPU([], this, "dimensionScores");
        this.__styles = new ObservedPropertyObjectPU(BreakpointSystem.getResponsiveStyles('sm'), this, "styles");
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: ResultPageResponsive_Params) {
        if (params.mbtiType !== undefined) {
            this.mbtiType = params.mbtiType;
        }
        if (params.typeName !== undefined) {
            this.typeName = params.typeName;
        }
        if (params.description !== undefined) {
            this.description = params.description;
        }
        if (params.characteristics !== undefined) {
            this.characteristics = params.characteristics;
        }
        if (params.strengths !== undefined) {
            this.strengths = params.strengths;
        }
        if (params.weaknesses !== undefined) {
            this.weaknesses = params.weaknesses;
        }
        if (params.careerFit !== undefined) {
            this.careerFit = params.careerFit;
        }
        if (params.dimensionScores !== undefined) {
            this.dimensionScores = params.dimensionScores;
        }
        if (params.styles !== undefined) {
            this.styles = params.styles;
        }
    }
    updateStateVars(params: ResultPageResponsive_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__mbtiType.purgeDependencyOnElmtId(rmElmtId);
        this.__typeName.purgeDependencyOnElmtId(rmElmtId);
        this.__description.purgeDependencyOnElmtId(rmElmtId);
        this.__characteristics.purgeDependencyOnElmtId(rmElmtId);
        this.__strengths.purgeDependencyOnElmtId(rmElmtId);
        this.__weaknesses.purgeDependencyOnElmtId(rmElmtId);
        this.__careerFit.purgeDependencyOnElmtId(rmElmtId);
        this.__dimensionScores.purgeDependencyOnElmtId(rmElmtId);
        this.__styles.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__mbtiType.aboutToBeDeleted();
        this.__typeName.aboutToBeDeleted();
        this.__description.aboutToBeDeleted();
        this.__characteristics.aboutToBeDeleted();
        this.__strengths.aboutToBeDeleted();
        this.__weaknesses.aboutToBeDeleted();
        this.__careerFit.aboutToBeDeleted();
        this.__dimensionScores.aboutToBeDeleted();
        this.__styles.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private __mbtiType: ObservedPropertySimplePU<string>;
    get mbtiType() {
        return this.__mbtiType.get();
    }
    set mbtiType(newValue: string) {
        this.__mbtiType.set(newValue);
    }
    private __typeName: ObservedPropertySimplePU<string>;
    get typeName() {
        return this.__typeName.get();
    }
    set typeName(newValue: string) {
        this.__typeName.set(newValue);
    }
    private __description: ObservedPropertySimplePU<string>;
    get description() {
        return this.__description.get();
    }
    set description(newValue: string) {
        this.__description.set(newValue);
    }
    private __characteristics: ObservedPropertyObjectPU<string[]>;
    get characteristics() {
        return this.__characteristics.get();
    }
    set characteristics(newValue: string[]) {
        this.__characteristics.set(newValue);
    }
    private __strengths: ObservedPropertyObjectPU<string[]>;
    get strengths() {
        return this.__strengths.get();
    }
    set strengths(newValue: string[]) {
        this.__strengths.set(newValue);
    }
    private __weaknesses: ObservedPropertyObjectPU<string[]>;
    get weaknesses() {
        return this.__weaknesses.get();
    }
    set weaknesses(newValue: string[]) {
        this.__weaknesses.set(newValue);
    }
    private __careerFit: ObservedPropertyObjectPU<string[]>;
    get careerFit() {
        return this.__careerFit.get();
    }
    set careerFit(newValue: string[]) {
        this.__careerFit.set(newValue);
    }
    private __dimensionScores: ObservedPropertyObjectPU<string[]>;
    get dimensionScores() {
        return this.__dimensionScores.get();
    }
    set dimensionScores(newValue: string[]) {
        this.__dimensionScores.set(newValue);
    }
    private __styles: ObservedPropertyObjectPU<ResponsiveStyles>;
    get styles() {
        return this.__styles.get();
    }
    set styles(newValue: ResponsiveStyles) {
        this.__styles.set(newValue);
    }
    aboutToAppear(): void {
        // 获取设备类型
        let displayInfo = display.getDefaultDisplaySync();
        let deviceType: string = BreakpointSystem.getDeviceType(displayInfo.width);
        this.styles = BreakpointSystem.getResponsiveStyles(deviceType);
        let params: RouteParams = router.getParams() as RouteParams;
        if (params && params.answers) {
            let answerMap: Map<number, string> = new Map();
            let answerKeys: string[] = Object.keys(params.answers);
            for (let key of answerKeys) {
                let numKey: number = parseInt(key);
                answerMap.set(numKey, params.answers[numKey]);
            }
            let result: MBTIResult = QuestionnaireData.calculateMBTI(answerMap);
            this.mbtiType = result.type;
            this.typeName = result.name;
            this.description = result.description;
            this.characteristics = result.characteristics;
            this.strengths = result.strengths;
            this.weaknesses = result.weaknesses;
            this.careerFit = result.careerFit;
            this.calculateDimensions(answerMap);
        }
    }
    calculateDimensions(answers: Map<number, string>): void {
        let eScore: number = 0;
        let iScore: number = 0;
        let nScore: number = 0;
        let sScore: number = 0;
        let fScore: number = 0;
        let tScore: number = 0;
        let jScore: number = 0;
        let pScore: number = 0;
        let questions: Question[] = QuestionnaireData.getQuestions();
        answers.forEach((value: string, questionId: number): void => {
            let question: Question | undefined = questions.find((q: Question): boolean => q.id === questionId);
            if (question) {
                let option: QuestionOption | undefined = question.options.find((o: QuestionOption): boolean => o.value === value);
                if (option) {
                    let dim: string = option.dimension;
                    if (dim === 'EI') {
                        if (value === 'A') {
                            eScore++;
                        }
                        else {
                            iScore++;
                        }
                    }
                    else if (dim === 'NS') {
                        if (value === 'A') {
                            nScore++;
                        }
                        else {
                            sScore++;
                        }
                    }
                    else if (dim === 'FT') {
                        if (value === 'A') {
                            fScore++;
                        }
                        else {
                            tScore++;
                        }
                    }
                    else if (dim === 'JP') {
                        if (value === 'A') {
                            jScore++;
                        }
                        else {
                            pScore++;
                        }
                    }
                }
            }
        });
        this.dimensionScores = [
            '外向(E):' + eScore + '  内向(I):' + iScore,
            '直觉(N):' + nScore + '  实感(S):' + sScore,
            '情感(F):' + fScore + '  思考(T):' + tScore,
            '判断(J):' + jScore + '  感知(P):' + pScore
        ];
    }
    buildSection(title: string, items: string[], color: string, parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width(this.styles.cardWidth);
            Column.padding(15);
            Column.backgroundColor('#FFFFFF');
            Column.borderRadius(10);
            Column.border({
                width: 1,
                color: '#E8E8E8'
            });
            Column.alignItems(HorizontalAlign.Start);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(title);
            Text.fontSize(18);
            Text.fontWeight(FontWeight.Bold);
            Text.fontColor('#333333');
            Text.margin({ bottom: 10 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.alignItems(HorizontalAlign.Start);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = _item => {
                const item = _item;
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Text.create(item);
                    Text.fontSize(14);
                    Text.fontColor(Color.White);
                    Text.backgroundColor(color);
                    Text.borderRadius(15);
                    Text.padding({ top: 6, bottom: 6, left: 12, right: 12 });
                    Text.margin({ right: 8, bottom: 8 });
                }, Text);
                Text.pop();
            };
            this.forEachUpdateFunction(elmtId, items.slice(0, Math.ceil(items.length / 2)), forEachItemGenFunction, (item: string): string => item, false, false);
        }, ForEach);
        ForEach.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            if (items.length > Math.ceil(items.length / 2)) {
                this.ifElseBranchUpdateFunction(0, () => {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Row.create();
                    }, Row);
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        ForEach.create();
                        const forEachItemGenFunction = _item => {
                            const item = _item;
                            this.observeComponentCreation2((elmtId, isInitialRender) => {
                                Text.create(item);
                                Text.fontSize(14);
                                Text.fontColor(Color.White);
                                Text.backgroundColor(color);
                                Text.borderRadius(15);
                                Text.padding({ top: 6, bottom: 6, left: 12, right: 12 });
                                Text.margin({ right: 8, bottom: 8 });
                            }, Text);
                            Text.pop();
                        };
                        this.forEachUpdateFunction(elmtId, items.slice(Math.ceil(items.length / 2)), forEachItemGenFunction, (item: string): string => item, false, false);
                    }, ForEach);
                    ForEach.pop();
                    Row.pop();
                });
            }
            else {
                this.ifElseBranchUpdateFunction(1, () => {
                });
            }
        }, If);
        If.pop();
        Column.pop();
        Column.pop();
    }
    restart(): void {
        router.replaceUrl({
            url: 'pages/QuestionnairePageResponsive'
        }).catch((err: Error): void => {
            console.error('跳转失败：' + err.message);
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
            Text.create('MBTI测试结果');
            Text.fontSize(this.styles.titleFontSize);
            Text.fontWeight(FontWeight.Bold);
            Text.margin({ top: 25, bottom: 10 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Scroll.create();
            Scroll.layoutWeight(1);
            Scroll.scrollBar(BarState.Off);
        }, Scroll);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 15 });
            Column.width('100%');
            Column.alignItems(HorizontalAlign.Center);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 类型标识
            Column.create();
            // 类型标识
            Column.width(this.styles.cardWidth);
            // 类型标识
            Column.padding(20);
            // 类型标识
            Column.backgroundColor('#F0F6FF');
            // 类型标识
            Column.borderRadius(15);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.mbtiType);
            Text.fontSize(40);
            Text.fontWeight(FontWeight.Bold);
            Text.fontColor('#007AFF');
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.typeName);
            Text.fontSize(22);
            Text.fontColor('#333333');
            Text.margin({ top: 5 });
        }, Text);
        Text.pop();
        // 类型标识
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 描述
            Text.create(this.description);
            // 描述
            Text.fontSize(this.styles.optionFontSize);
            // 描述
            Text.fontColor('#555555');
            // 描述
            Text.lineHeight(24);
            // 描述
            Text.width(this.styles.cardWidth);
            // 描述
            Text.textAlign(TextAlign.Start);
        }, Text);
        // 描述
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 维度得分
            Column.create();
            // 维度得分
            Column.width(this.styles.cardWidth);
            // 维度得分
            Column.padding(15);
            // 维度得分
            Column.backgroundColor('#FFF9F0');
            // 维度得分
            Column.borderRadius(10);
            // 维度得分
            Column.alignItems(HorizontalAlign.Start);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('📊 各维度得分');
            Text.fontSize(18);
            Text.fontWeight(FontWeight.Bold);
            Text.margin({ bottom: 10 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = _item => {
                const score = _item;
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Text.create(score);
                    Text.fontSize(15);
                    Text.fontColor('#666666');
                    Text.margin({ bottom: 5 });
                }, Text);
                Text.pop();
            };
            this.forEachUpdateFunction(elmtId, this.dimensionScores, forEachItemGenFunction, (score: string): string => score, false, false);
        }, ForEach);
        ForEach.pop();
        // 维度得分
        Column.pop();
        // 性格特征
        this.buildSection.bind(this)('🎯 性格特征', ObservedObject.GetRawObject(this.characteristics), '#4A90E2');
        // 优势
        this.buildSection.bind(this)('💪 个人优势', ObservedObject.GetRawObject(this.strengths), '#50C878');
        // 弱点
        this.buildSection.bind(this)('⚠️ 需要注意', ObservedObject.GetRawObject(this.weaknesses), '#FF6B6B');
        // 职业推荐
        this.buildSection.bind(this)('💼 适合职业', ObservedObject.GetRawObject(this.careerFit), '#6C5CE7');
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Blank.create();
            Blank.height(20);
        }, Blank);
        Blank.pop();
        Column.pop();
        Scroll.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel('重新测试');
            Button.width(this.styles.buttonWidth);
            Button.height(48);
            Button.fontSize(18);
            Button.backgroundColor('#007AFF');
            Button.fontColor(Color.White);
            Button.borderRadius(24);
            Button.margin({ bottom: 25 });
            Button.onClick((): void => { this.restart(); });
        }, Button);
        Button.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "ResultPageResponsive";
    }
}
registerNamedRoute(() => new ResultPageResponsive(undefined, {}), "", { bundleName: "com.example.questionnaire", moduleName: "entry", pagePath: "pages/ResultPageResponsive", pageFullPath: "entry/src/main/ets/pages/ResultPageResponsive", integratedHsp: "false", moduleType: "followWithHap" });
