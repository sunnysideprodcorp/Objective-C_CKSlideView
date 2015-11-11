//
//  CKMovingView.h
//  CKSlideView
//
//  Copyright © 2015 SunnysideProductions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CKMovingView : UIImageView

// set the max travel distance for your view
@property float totalOffset;

// angle along which you want to slide your view
// this angle determines the direction of movement
// use degrees not radians
@property float moveAngle;

// this is the method that moves the view
// the offset parameter a percentage of self.totalOffset
- (void)moveToCenterforOffset:(float)offset;
@end
