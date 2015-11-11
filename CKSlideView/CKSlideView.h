//
//  CKSlideView.h
//  CKSlideView
//
//  Copyright © 2015 SunnysideProductions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CKSlideView : UIViewController

// these properties & methods should be treated as private and public only for purposes of inheritance
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat width;
- (void) scrollViewDidScroll:(UIScrollView *)scrollView;

// CKSlideView has a member UIScrollView to which you should append all views
@property (nonatomic) UIScrollView *sv;

// track views per 'page'
// insert all views for 'page' i into an array and insert that array into viewsArray at index i
@property NSMutableArray *viewsArray;

// total number of 'pages' for your CKSlideView
@property int numPages;

// utility function if you want to randomize your rotation angles and/or displacements a bit
-(int) generateRandomNumberWithlowerBound:(int)lowerBound
                               upperBound:(int)upperBound;

// note there are no redrawing methods
// this means unless you are using autolayout, the views will not be intelligently repositioned
// I wrote this for an app that has mandatory portrait layout
// you'd need some kind of redraw function to make this more flexible

@end
