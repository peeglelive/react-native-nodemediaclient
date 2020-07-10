//
//  RCTNodeCameraView.m
//  
//
//  Created by Mingliang Chen on 2017/12/12.
//  Copyright © 2017年 NodeMedia. All rights reserved.
//

#import "RCTNodeMediaClient.h"
#import "RCTNodeCameraView.h"
#import <NodeMediaClient/NodeMediaClient.h>

@interface RCTNodeCameraView()

@property (strong,nonatomic) NodePublisher *np;

@end

@implementation RCTNodeCameraView

- (id)init {
  self = [super init];
  if(self) {
    _np = [[NodePublisher alloc] initWithPremium:[RCTNodeMediaClient premium]];
    [_np setNodePublisherDelegate:self];
    _autopreview = NO;
    _outputUrl = nil;
    _camera = nil;
    _audio = nil;
    _video = nil;
    _onStatus = nil;
  }
  return self;
}

-(void) onEventCallback:(nonnull id)sender event:(int)event msg:(nonnull NSString*)msg {
    if (!_onStatus) {
        return;
    }
    
    NSLog(@"Calling _onStatus with event %i and msg %@", event, msg);
    _onStatus(@{ @"msg": msg, @"event": [NSNumber numberWithInteger:event] });
}

-(void)setOutputUrl:(NSString *)outputUrl {
  [_np setOutputUrl:outputUrl];
}

-(void)setAutopreview:(BOOL)autopreview {
  _autopreview = autopreview;
  if(_camera && _video && autopreview) {
    [_np startPreview];
  }
}
- (void)setCamera:(NSDictionary *)camera {
  _camera = camera;
  int cameraId = [[camera objectForKey:@"cameraId"] intValue];
  BOOL cameraFrontMirror = [[camera objectForKey:@"cameraFrontMirror"] boolValue];
  [_np setCameraPreview:self cameraId:cameraId frontMirror:cameraFrontMirror];
  if(_autopreview && _video) {
    [_np startPreview];
  }
}

- (void)setAudio:(NSDictionary *)audio {
  _audio = audio;
  int audioBitrate = [[audio objectForKey:@"bitrate"] intValue];
  int audioProfile = [[audio objectForKey:@"profile"] intValue];
  int audioSamplerate = [[audio objectForKey:@"samplerate"] intValue];
  [_np setAudioParamBitrate:audioBitrate profile:audioProfile sampleRate:audioSamplerate];
}

- (void)setVideo:(NSDictionary *)video {
  _video = video;
  int videoPreset = [[video objectForKey:@"preset"] intValue];
  int videoFPS = [[video objectForKey:@"fps"] intValue];
  int videoBitrate = [[video objectForKey:@"bitrate"] intValue];
  int videoProfile = [[video objectForKey:@"profile"] intValue];
  BOOL videoFrontMirror = [[video objectForKey:@"videoFrontMirror"] boolValue];
  [_np setVideoParamPreset:videoPreset fps:videoFPS bitrate:videoBitrate profile:videoProfile frontMirror:videoFrontMirror];
  if(_autopreview && _camera) {
    [_np startPreview];
  }
}

- (void)setDenoise:(BOOL)denoise {
  _denoise = denoise;
  [_np setDenoiseEnable:denoise];
}

- (void)setSmoothSkinLevel:(NSInteger)smoothSkinLevel {
  _smoothSkinLevel = smoothSkinLevel;
  [_np setBeautyLevel:smoothSkinLevel];
}

- (void)setOnStatus:(RCTDirectEventBlock)onStatus {
    _onStatus = onStatus;
}

- (void)setFlashEnable:(BOOL)flashEnable {
  [_np setFlashEnable:flashEnable];
}

-(int)startprev {
  return [_np startPreview];
}

-(int)stopprev {
  return [_np stopPreview];
}

-(int)start {
  return [_np start];
}

-(int)stop {
  return [_np stop];
}

-(int)switchCamera {
  return [_np switchCamera];
}

@end
