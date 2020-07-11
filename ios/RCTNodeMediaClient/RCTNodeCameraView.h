//
//  RCTNodeCameraView.h
//  
//
//  Created by Mingliang Chen on 2017/12/12.
//  Copyright © 2017年 NodeMedia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NodeMediaClient/NodeMediaClient.h>
#import <React/RCTView.h>

@interface RCTNodeCameraView : UIView <NodePublisherDelegate>
@property (strong, nonatomic) NSString *outputUrl;
@property (nonatomic) BOOL autopreview;
@property (strong,nonatomic) NSDictionary *camera;
@property (strong,nonatomic) NSDictionary *audio;
@property (strong,nonatomic) NSDictionary *video;
@property (nonatomic) BOOL denoise;
@property (nonatomic) NSInteger smoothSkinLevel;
@property (nonatomic) RCTDirectEventBlock onStatus;

@property (nonatomic) BOOL flashEnable;
@property (nonatomic) BOOL micEnable;

-(int)startprev;
-(int)stopprev;
-(int)start;
-(int)stop;
-(int)switchCamera;


@end
