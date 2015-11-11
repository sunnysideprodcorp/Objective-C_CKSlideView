//
//  Example3.m
//  CKSlideView
//
//  Created by Aileen Nielsen on 11/11/15.
//  Copyright © 2015 SunnysideProductions. All rights reserved.
//

#define MOVE_ANGLE 30
#import "CKMovingView.h"
#import "Example3.h"

@implementation Example3


- (void) viewDidLoad {
    [super viewDidLoad];
    
    // parameters for displaying subviews
    float boxWidth = self.width*.4;
    float boxHeight = self.height*.15;
    float outerHorizontalMargin = self.width*.1; //(self.width*.5 - boxWidth)/2 * 1.3;
    float totalMovement = self.width*.15;
    
    NSArray *frameLocations = @[[NSValue valueWithCGRect: CGRectMake(self.width*.3, self.height*.2, boxWidth, boxHeight )], [NSValue valueWithCGRect: CGRectMake(self.width*.1, self.height*.4, boxWidth, boxHeight )], [NSValue valueWithCGRect: CGRectMake(self.width*.6, self.height*.4, boxWidth, boxHeight )]];
    
    for(int i = 0; i < self.numPages; i++){ // per indexed 'page' in the scrollview
        
        // to hold all views in ith scrollview page so they can be called when scrollViewDidScroll indicates nearby location
        NSMutableArray *views_i = [[NSMutableArray alloc] init];
        
        // show viewer where they are with a label
        UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(outerHorizontalMargin + i*self.width, self.height*.1, self.width*.4, self.height*.05)];
        numberLabel.text = [NSString stringWithFormat:@"Slide # %d", (i+1)];
        numberLabel.textAlignment = NSTextAlignmentLeft;
        numberLabel.font = [UIFont systemFontOfSize:40.0];
        [self.sv addSubview:numberLabel];
        
        
        
        for(int j = 0; j < 3; j++){ // horizontal count
            CGRect frame = [[frameLocations objectAtIndex:j] CGRectValue];
            frame.origin.x += i*self.width;
                CKMovingView * lilView = [[CKMovingView alloc] initWithFrame: frame];
                
                // rotate to give an askew aesthetic
                CGAffineTransform transform = CGAffineTransformRotate(CGAffineTransformIdentity, pow(-1, j) * [self generateRandomNumberWithlowerBound:4 upperBound:15] * M_PI/180);
                lilView.transform = transform;
                
                // add an image
                lilView.backgroundColor = [UIColor whiteColor];
                lilView.opaque = YES; // supposed to help performance
                lilView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpeg", j+ 1]];
                lilView.contentMode = UIViewContentModeScaleAspectFit;
                
                // layering
                lilView.layer.borderColor = [UIColor grayColor].CGColor;
                lilView.layer.borderWidth = 3;
                
                // CKMovingView setup parameters to establish pattern of movement
                lilView.totalOffset = totalMovement;
                int moveAngle = [self generateRandomNumberWithlowerBound:MOVE_ANGLE - 3 upperBound:MOVE_ANGLE+3];
            if(j == 0) moveAngle = -120;
            else if (j == 1) moveAngle = 0;
            else if (j == 2) moveAngle = 120;
                lilView.moveAngle = pow(-1, j) * ABS(180 * ABS(j-1) - moveAngle);
                
                [self.sv addSubview:lilView];
                [views_i addObject:lilView];
        }
        [self.viewsArray addObject: views_i];
    }
}


@end
