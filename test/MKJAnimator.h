//
//  MKJAnimator.h
//  test
//
//  Created by apple7 on 16/12/5.
//  Copyright © 2016年 apple7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MKJAnimatorDelegate <NSObject>

-(void) animationFinish;

@end

@interface MKJAnimator : NSObject <UIViewControllerTransitionCoordinator>

@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,assign) CGRect destinationRec;
@property(nonatomic,assign) CGRect originalRec;
@property(nonatomic,assign) BOOL isPush;
@property(nonatomic,assign) id<MKJAnimatorDelegate>Delegate;

@end
