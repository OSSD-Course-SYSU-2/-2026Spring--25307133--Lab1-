if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface StartPage_Params {
    message?: string;
}
class StartPage extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.__message = new ObservedPropertySimplePU('MBTI测试', this, "message");
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: StartPage_Params) {
        if (params.message !== undefined) {
            this.message = params.message;
        }
    }
    updateStateVars(params: StartPage_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__message.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__message.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private __message: ObservedPropertySimplePU<string>;
    get message() {
        return this.__message.get();
    }
    set message(newValue: string) {
        this.__message.set(newValue);
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width('100%');
            Column.height('100%');
            Column.justifyContent(FlexAlign.Center);
            Column.backgroundColor('#FFFFFF');
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.message);
            Text.fontSize(40);
            Text.fontWeight(FontWeight.Bold);
            Text.margin({ top: 100 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('点击下方按钮开始测试');
            Text.fontSize(18);
            Text.fontColor('#666666');
            Text.margin({ top: 20 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel('开始测试');
            Button.fontSize(20);
            Button.width('70%');
            Button.height(50);
            Button.backgroundColor('#007AFF');
            Button.fontColor(Color.White);
            Button.borderRadius(25);
            Button.margin({ top: 50 });
            Button.onClick((): void => {
                // 直接在这里开始测试，不跳转
                this.message = '功能开发中，请稍候...';
            });
        }, Button);
        Button.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "StartPage";
    }
}
registerNamedRoute(() => new StartPage(undefined, {}), "", { bundleName: "com.example.questionnaire", moduleName: "entry", pagePath: "pages/StartPage", pageFullPath: "entry/src/main/ets/pages/StartPage", integratedHsp: "false", moduleType: "followWithHap" });
