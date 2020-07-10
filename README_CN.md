# react-native-nodemediaclient
[![npm](https://img.shields.io/npm/v/react-native-nodemediaclient.svg)](https://www.npmjs.com/package/react-native-nodemediaclient)
[![npm](https://img.shields.io/npm/dm/react-native-nodemediaclient.svg)](https://www.npmjs.com/package/react-native-nodemediaclient)  
该项目是NodeMediaClient-Android与NodeMediaClient-iOS SDK的react-native封装。  
具备完整的直播播放与发布功能，提供完全一样的API调用。使您只需开发一套程序即可发布两个平台。

## 1.安装
yarn add react-native-nodemediaclient

## 2.链接
react-native link

## 3.手动修改

### Android
android/build.gradle
```
allprojects {
    repositories {
        mavenLocal()
        jcenter()
        maven {
            // All of React Native (JS, Obj-C sources, Android binaries) is installed from npm
            url "$rootDir/../node_modules/react-native/android"
        }
        
        // 添加这一段
        maven { 
            url 'https://jitpack.io' 
        }
    }
}
```

### iOS
ios/Podfile
```
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
# ‘QLive’ 是此处的用例项目名，请改为你的项目名。
target 'QLive' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for QLive
  pod 'NodeMediaClient'
end
```

## 4.安装 NodeMediaClient-SDK
### Android
打开并编译项目，Android Studio会自动下载并链接sdk库而无需额外的操作。

### iOS
```bash
cd ios
pod install
```
打开 QLive.xcworkspace 来编译和管理项目

## 5.权限
### Android
```  
    <uses-feature android:name="android.hardware.camera"/>
    <uses-feature android:name="android.hardware.camera.autofocus"/>

    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-permission android:name="android.permission.RECORD_AUDIO"/>
    <uses-permission android:name="android.permission.FLASHLIGHT"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
```

### iOS
Project -> Info

```
Privacy - Camera Usage Description
Privacy - Microphone Usage Description
```

## 6.例子

### NodePlayerView

```
import {  NodePlayerView } from 'react-native-nodemediaclient';

......

<NodePlayerView 
  style={{ height: 200 }}
  ref={(vp) => { this.vp = vp }}
  inputUrl={"rtmp://192.168.0.10/live/stream"}
  scaleMode={"ScaleAspectFit"}
  bufferTime={300}
  maxBufferTime={1000}
  autoplay={true}
/>
```


### NodeCameraView
```
import {  NodeCameraView } from 'react-native-nodemediaclient';

......

<NodeCameraView 
  style={{ height: 400 }}
  ref={(vb) => { this.vb = vb }}
  outputUrl = {"rtmp://192.168.0.10/live/stream"}
  camera={{ cameraId: 1, cameraFrontMirror: true }}
  audio={{ bitrate: 32000, profile: 1, samplerate: 44100 }}
  video={{ preset: 12, bitrate: 400000, profile: 1, fps: 15, videoFrontMirror: false }}
  autopreview={true}
/>

<Button
  onPress={() => {
    if (this.state.isPublish) {
      this.setState({ publishBtnTitle: 'Start Publish', isPublish: false });
      this.vb.stop();
    } else {
      this.setState({ publishBtnTitle: 'Stop Publish', isPublish: true });
      this.vb.start();
    }
  }}
  title={this.state.publishBtnTitle}
  color="#841584"
/>
```
## Demo 项目
![img](https://raw.githubusercontent.com/NodeMedia/iShow-RN/master/1519740855033.gif)
https://github.com/NodeMedia/iShow-RN
