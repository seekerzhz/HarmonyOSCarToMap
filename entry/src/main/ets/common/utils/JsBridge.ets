

import WebView from '@ohos.web.webview'; // 导入 WebView 模块
import contact from '@ohos.contact'; // 导入联系人模块
import { code } from '../constant/CodeConstant'; // 导入常量
import { ParamsItem } from '../../viewmodel/ParamsItem'; // 导入参数模型
import { JavaScriptItem } from '../../viewmodel/JavaScriptItem'; // 导入 JavaScript 模型
import Logger from './Logger'; // 导入日志模块

/**
 * 定义桥接器类，连接 WebView 和 ArkTS。
 */
export default class JsBridge {
  controller: WebView.WebviewController; // 控制器对象

  constructor(controller: WebView.WebviewController) {
    this.controller = controller;
  }

  /**
   * 获取 JavaScript 代理对象。
   *
   * @returns JavaScript 代理对象。
   */
  get javaScriptProxy(): JavaScriptItem {
    let result: JavaScriptItem = {
      object: {
        call: this.call
      },
      name: "JSBridgeHandle",
      methodList: ['call'],
      controller: this.controller
    }
    return result;
  }

  /**
   * 初始化桥接器。
   */
  initJsBridge(): void {
    this.controller.runJavaScript(code);
  }

  /**
   * 使用系统能力获取联系人。
   */
  chooseContact = (): Promise<string> => {
    // 初始化手机号和姓名
    let phone = '';
    let name = '';
    return new Promise((resolve) => {
      Logger.info('选择通讯录...');
      // 调用选择联系人方法
      let promise = contact.selectContact();
      Logger.info('选择通讯录...');
      // 处理选择联系人结果
      promise.then((info: Array
