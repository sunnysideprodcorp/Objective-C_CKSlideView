//
//  CKMovingView.m
//  CKSlideView
//
//  Copyright © 2015 SunnysideProductions. All rights reserved.
//

#import "CKMovingView.h"
#import "math.h"

@interface CKMovingView ()
// used to anchor the view
@property CGPoint selfCenter;
@end

@implementation CKMovingView

- (id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.selfCenter = self.center;
    }
    return self;
}

- (void)moveToCenterforOffset:(float)offset{
    float moveFactor = offset*self.totalOffset;
    self.center = CGPointMake(moveFactor*cos(M_PI/180 * self.moveAngle) + self.selfCenter.x, -1*moveFactor*sin(M_PI/180 * self.moveAngle) + self.selfCenter.y);
}



@end
