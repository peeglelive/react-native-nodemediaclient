# react-native-nodemediaclient
[![npm](https://img.shields.io/npm/v/react-native-nodemediaclient.svg)](https://www.npmjs.com/package/react-native-nodemediaclient)
[![npm](https://img.shields.io/npm/dm/react-native-nodemediaclient.svg)](https://www.npmjs.com/package/react-native-nodemediaclient)  
This project is the react-native packaging of NodeMediaClient-Android and NodeMediaClient-iOS SDK.
Complete live publish and play functions, providing the exact same API call. You can publish two platforms just by developing one set of programs.  
[中文介绍](https://github.com/NodeMedia/react-native-nodemediaclient/blob/master/README_CN.md)

## 0.Enter the project directory
cd AwesomeProject

## 1.install
yarn add react-native-nodemediaclient

## 2.link
react-native link react-native-nodemediaclient

## 3.Install dependencies
cd ios  
pod install

## 4.NodeCameraView Permission

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

## 5.Example

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

## Demo project
![img](https://raw.githubusercontent.com/NodeMedia/iShow-RN/master/1519740855033.gif)
https://github.com/NodeMedia/iShow-RN
