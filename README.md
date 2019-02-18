# cordova-plugin-zhugeio

诸葛移动统计的cordova插件，支持ios与Android平台

### 环境需求
* iOS 7.0+
* Android SDK 11+
* cordova-ios 4.3.0
* cordova-cli 6.4.0

### 集成方法

* 新建一个Cordova工程，添加所需平台

```
cordova create hello com.example.hello HelloWorld
cd hello
cordova platform add ios android

```

* 添加Zhuge Cordova插件，并添加ZHUGE_APP_KEY

```
cordova plugin add cordova-plugin-zhugeio --save --variable ZHUGE_APP_KEY="填写Zhuge分配给您的AppKey"

```

* 在```www/js/index.js/```中使用对应的接口

* 运行```cordova build```进行测试

### API说明

* track 追踪事件

	```
	Zhugeio.track('事件名称',{'属性1':'值1','属性2':'值2'});
	
	```
	
	也可不带属性
	
	```
	Zhugeio.track('事件名称');
	```

* 自定义时长事件 

    使用```startTrack()```开始事件

    ```
    Zhugeio.startTrack('事件名称');
 
    ```

    使用相同的事件名称结束事件

    ```
    Zhugeio.endTrack('事件名称'，{'属性1':'值1'});

    ```
    
    ```startTrack()```与```endTrack()```需成对出现，单独使用没有效果。
    
* 标记用户

    使用```identify()```标记用户
    
    ```
    Zhugeio.identify('用户ID',{'用户属性':'用户值'})
    
    ```

* 开启实时调试

    ```
    Zhugeio.openDebug();

    ```
    
* 开始日志输出
   
    该方法仅对Android平台可用，iOS平台请参阅 [iOS集成文档](http://docs.zhugeio.com/dev/iOS.html)

    ```
    Zhugeio.openLog();
    
    ```

* **选用**  设置数据上传地址

    使用```setUploadURL()```设置数据上传地址
  
    ```
    Zhugeio.setUploadURL('https://www.baidu.com','http://www.baidu.backup.com')
  
    ```
    
    参数传递需包含所用协议(http或https)
  
    **注意：**该接口仅供诸葛的私有部署用户使用，在使用时，请在调用其他所有接口之前，最开始进入应用时调用，一般情况下在```www/index.html/```中。若调用过晚，数据可能上传到诸葛默认的数据服务器中，造成统计不准。


