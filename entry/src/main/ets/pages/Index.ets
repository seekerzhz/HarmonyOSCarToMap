import webview from '@ohos.web.webview';
import { BottomTabsList } from '../viewmodel/BottomTabsModel';
import { CommonConstants as Const } from '../common/constants/CommonConstants';

@Entry
@Component
struct WebComponent {
  @State @Watch('onIndexChange') bottomTabIndex: number = 1;
  private controller: TabsController = new TabsController();

  webController : webview.WebviewController = new webview.WebviewController();

  onIndexChange() {
    this.controller.changeIndex(this.bottomTabIndex);
  }
  aboutToAppear() {
    // 配置web开启调试模式
    webview.WebviewController.setWebDebuggingAccess(true);
  }

  @Builder TabBuilder(index: number, _name: string) {
    Column() {
      Image(this.bottomTabIndex === index ? BottomTabsList[index].iconSelected : BottomTabsList[index].icon)
        .width('40%')
        .height('40%')
        .objectFit(ImageFit.Contain)

    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .justifyContent(FlexAlign.Center)
    .border({ width: { top: Const.BORDER_WIDTH }, color: "#FF182431" })
    .backgroundColor("#F1F3F5")
  }


  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.End, justifyContent: FlexAlign.End }) {
      Tabs({ barPosition: BarPosition.End, index: 1, controller: this.controller }) {
        TabContent() {
          Web({ src: $rawfile('sample.html'), controller: this.webController })
            .javaScriptAccess(true)
            .zoomAccess(true)
            .fileAccess(true)
            .wideViewModeAccess(true)
        }.tabBar(this.TabBuilder(0, 'Map'))

        TabContent() {
          Web({ src: $rawfile('drive.html'), controller: this.webController })
            .javaScriptAccess(true)
            .zoomAccess(true)
            .fileAccess(true)
            .wideViewModeAccess(true)
        }.tabBar(this.TabBuilder(1, 'Zone'))
        TabContent() {
          Web({ src: $rawfile('location.html'), controller: this.webController })
            .javaScriptAccess(true)
            .zoomAccess(true)
            .fileAccess(true)
            .wideViewModeAccess(true)
        }.tabBar(this.TabBuilder(2, 'Zone'))
        TabContent() {
          Web({ src: $rawfile('search.html'), controller: this.webController })
            .javaScriptAccess(true)
            .zoomAccess(true)
            .fileAccess(true)
            .wideViewModeAccess(true)
        }.tabBar(this.TabBuilder(3, 'Zone'))
        TabContent() {
          Web({ src: $rawfile('walk.html'), controller: this.webController })
            .javaScriptAccess(true)
            .zoomAccess(true)
            .fileAccess(true)
            .wideViewModeAccess(true)
        }.tabBar(this.TabBuilder(4, 'Zone'))

      }
      .width(Const.FULL_PERCENT)
      .height(Const.FULL_PERCENT)
      .vertical(false)
      .scrollable(false)
      .barHeight(Const.BAR_HEIGHT)
      .onChange((index: number) => {
        this.bottomTabIndex = index;
      })
    }
    .width(Const.FULL_PERCENT)
  }
/*
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.End, justifyContent: FlexAlign.End }) {
      Tabs({ barPosition: BarPosition.End, index: 1, controller: this.controller }) {
        TabContent() {
          Map()
        }.tabBar(this.TabBuilder(0, 'Map'))

        TabContent() {
          Zones()
        }.tabBar(this.TabBuilder(1, 'Zone'))

      }
      .width(Const.FULL_PERCENT)
      .height(Const.FULL_PERCENT)
      .vertical(false)
      .scrollable(false)
      .barHeight(Const.BAR_HEIGHT)
      .onChange((index: number) => {
        this.bottomTabIndex = index;
      })
    }
    .width(Const.FULL_PERCENT)

    Stack() {
      Column() {
        Web({ src: $rawfile('sample.html'), controller: this.webController })
          //Web({ src: 'https://developer.harmonyos.com/', controller: new web_webview.WebviewController()})
          .backgroundColor(Color.Orange)
          .javaScriptAccess(true)
          .zoomAccess(true)
          .fileAccess(true)
          .wideViewModeAccess(true)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('55,60,77')
  }*/
}
