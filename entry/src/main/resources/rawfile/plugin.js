AMap.plugin(
    [
        "AMap.ToolBar",
        "AMap.Scale",
        "AMap.HawkEye",
        "AMap.MapType",
        "AMap.Geolocation",
        "AMap.ControlBar",
    ],
    function () {
        //添加工具条控件，工具条控件集成了缩放、平移、定位等功能按钮在内的组合控件
        map.addControl(new AMap.ToolBar());

        //添加比例尺控件，展示地图在当前层级和纬度下的比例尺
        map.addControl(new AMap.Scale());

        //添加鹰眼控件，在地图右下角显示地图的缩略图
        map.addControl(new AMap.HawkEye({ isOpen: true }));

        //添加类别切换控件，实现默认图层与卫星图、实施交通图层之间切换的控制
        map.addControl(new AMap.MapType());

        //添加定位控件，用来获取和展示用户主机所在的经纬度位置
        map.addControl(new AMap.Geolocation());

        //添加控制罗盘控件，用来控制地图的旋转和倾斜
        map.addControl(new AMap.ControlBar());
    }
);