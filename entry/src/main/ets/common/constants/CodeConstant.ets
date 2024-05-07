// CodeConstant.ets
/**
 * 异步执行脚本
 */
export const code = `
  // 创建一个对象，用于存储回调函数，键为回调 ID，值为回调函数
  const JSBridgeMap = {};
  // 初始化回调 ID
  let callID = 0;

  // 执行H5回调函数
  function JSBridgeCallback(id, params) {
    // 从 JSBridgeMap 中取出对应的回调函数并执行
    JSBridgeMap[id](params);
    // 将对应的回调函数从 JSBridgeMap 中移除
    JSBridgeMap[id] = null;
    delete JSBridgeMap[id];
  }

  // 在 window 中声明 callNative 方法供 H5 调用
  window.ohosCallNative = {
    callNative(method, params, callback) {
      // 生成一个新的回调 ID
      const id = callID++;
      // 构造传递给原生代码的参数对象，包括回调 ID 和数据
      const paramsObj = {
        callID: id,
        data: params || null
      }
      // 将回调函数存储到 JSBridgeMap 中，以便后续执行
      JSBridgeMap[id] = callback || (() => {});
      // 调用原生代码的处理方法，并传递参数对象
      JSBridgeHandle.call(method, JSON.stringify(paramsObj));
    }
  }
`;
