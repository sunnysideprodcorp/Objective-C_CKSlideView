//
//  CKSlideView.m
//  CKSlideView
//
//  Copyright © 2015 SunnysideProductions. All rights reserved.
//


#import "CKSlideView.h"
#import "CKMovingView.h"
#import "math.h"

@interface CKSlideView () <UIScrollViewDelegate>

@end

@implementation CKSlideView

- (void) viewDidLoad {
    
    // determining layout availability
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.width = screenRect.size.width;
    self.height = screenRect.size.height;

    // views are stored here
    self.viewsArray = [[NSMutableArray alloc] init];
    
    // setup the scrollview which contains all the CKMovingViews
    self.sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    self.sv.delegate = self;
    self.sv.contentSize = CGSizeMake(self.numPages*self.width, self.height);
    self.sv.pagingEnabled = YES;
    self.sv.opaque = YES;
    [self.view addSubview:self.sv];

}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {

    // determine where you are in self.sv
    int index = (int)floor(self.sv.contentOffset.x/self.width);
    float leftRight = self.sv.contentOffset.x/self.width - (float)index;

    // move the CKMovingViews in the current view and also in the one just before and after
    // in case there are desired effects from bleeding over form neighboring pages
    // you can do some cool jump-between-pages type animations that way
    for(int i = MAX(0, index - 1); i <= MIN(self.viewsArray.count - 1, index + 1); i++){
        if(self.viewsArray.count > 0){
            NSMutableArray *subviews = self.viewsArray[i];
            for(int j = 0; j < subviews.count; j++){
                CKMovingView *view = subviews[j];
                float useFactor = MIN(leftRight, (1 - leftRight));
                float useOffset = useFactor/.5;
                [view moveToCenterforOffset:useOffset];
            }
        }

    }
}

// taken from http://stackoverflow.com/questions/9678373/generate-random-numbers-between-two-numbers-in-objective-c
- (int) generateRandomNumberWithlowerBound:(int)lowerBound upperBound:(int)upperBound
{
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    return rndValue;
}



@end
