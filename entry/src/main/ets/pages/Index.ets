import webview from '@ohos.web.webview';

@Entry
@Component
struct WebComponent {

  webController : webview.WebviewController = new webview.WebviewController();
  aboutToAppear() {
    // 配置web开启调试模式
    webview.WebviewController.setWebDebuggingAccess(true);
  }
  build() {

    Stack() {
      Column() {
        //1ae3b208fcec004751062b013ee633bc
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
  }
}
