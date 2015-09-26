//
//  CCMovedBtn.m
//  123
//
//  Created by cc on 15/9/25.
//  Copyright © 2015年 Snake. All rights reserved.
//

#import "CCMovedBtn.h"
@interface CCMovedBtn () <UIGestureRecognizerDelegate>
@property (nonatomic,assign) CGPoint startPoint;
@property (nonatomic,assign) BOOL isShaking;
@end
@implementation CCMovedBtn


-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UILongPressGestureRecognizer *gr = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longpress:) ];
        gr.minimumPressDuration = 0.5;
        [self addGestureRecognizer:gr];
    }
    return self;
    
}
-(void)longpress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        self.isShaking = YES;
        [self started:(UILongPressGestureRecognizer *)gestureRecognizer];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        [self moved:(UILongPressGestureRecognizer *)gestureRecognizer];
    } else {
        [self ended:(UILongPressGestureRecognizer *)gestureRecognizer];
    }
    
}


-(void)started:(UILongPressGestureRecognizer *)gestureRecognizer {
    self.startPoint = [gestureRecognizer locationInView:self];
    if (self.isShaking) {
        [self shake];
    }
}

-(void)moved:(UILongPressGestureRecognizer *)gestureRecognizer {
    CGPoint newPoint = [gestureRecognizer locationInView:self];
    CGFloat deltaX = newPoint.x - self.startPoint.x;
    CGFloat deltaY = newPoint.y - self.startPoint.y;
    self.center = CGPointMake(self.center.x + deltaX, self.center.y + deltaY);


}

-(void)ended:(UILongPressGestureRecognizer *)gestureRecognizer {
    self.isShaking = NO;

}

-(void)shake {
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.02 initialSpringVelocity:1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.transform = CGAffineTransformRotate(self.transform, 0.03);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.02 initialSpringVelocity:1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.transform = CGAffineTransformRotate(self.transform, -0.03);

        } completion:^(BOOL finished) {
            if (self.isShaking) {
                [self shake];
            }
        }];
    }];
    

}



@end
