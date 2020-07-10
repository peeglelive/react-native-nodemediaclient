//
//  RCTNodePlayerView.h
//
//
//  Created by Mingliang Chen on 2017/11/29.
//  Copyright © 2017年 NodeMedia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTView.h>
#import <NodeMediaClient/NodeMediaClient.h>


@interface RCTNodePlayerView : UIView<NodePlayerDelegate>
@property (strong, nonatomic) NSString * _Nullable inputUrl;
@property (nonatomic) int bufferTime;
@property (nonatomic) int maxBufferTime;
@property (nonatomic) BOOL autoplay;
@property (strong, nonatomic) NSString * _Nullable scaleMode;
@property (nonatomic) RCTDirectEventBlock _Nullable onStatus;

-(int)start;
-(int)stop;
-(int)pause;


@end
