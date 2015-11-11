##CKSlideView

This app was inspired by the iPad NYT Cooking App, which features photos of food that drift apart and back together as you page through the offerings. It's quite small, and is designed for cases where you will put all your content in a horizontal scroll view. 

Two custom classes were written to create this functionality. First, CKSlideView itself hosts the scroll view, serves as the scroll view's delegate, and calls the movement functions for the CKMovingView subviews. CKMovingView is subclasses from UIImageView so that it can be used to display ordinary drawn content or image files. 

Setup is quite easy. Create an instance of a subclass of CKSlideView, which you've cusotmized yourself with viewDidLoad to create and add the desired CKMovingViews to self.sv within CKSlideView:

```
    CKSlideViewSubclass *sv = [[CKSlideViweSublcass alloc] init];
    sv.numPages = 6;
```

Then you can load this. I assume in your viewDidLoad for this CKSlideViewSubclass, you create the CKMovingViews you want, perhaps like so:

```
               // within some loop for i = scroll view index, and j and k = layout loops
               CKMovingView * lilView = [[CKMovingView alloc] initWithFrame:CGRectMake(self.width * i + outerHorizontalMargin * ABS(k-1) + k*(self.width - boxWidth - outerHorizontalMargin), beginHeight+boxHeight*j, boxWidth, boxHeight)];
                
                // rotate to give an askew aesthetic
                CGAffineTransform transform = CGAffineTransformRotate(CGAffineTransformIdentity, pow(-1, j) * [self generateRandomNumberWithlowerBound:displayRotation - 3 upperBound:displayRotation + 4] * M_PI/180);
                lilView.transform = transform;
                
                
                // CKMovingView setup parameters to establish pattern of movement
                lilView.totalOffset = totalMovement;
                int moveAngle = [self generateRandomNumberWithlowerBound:MOVE_ANGLE - 3 upperBound:MOVE_ANGLE+3];
                lilView.moveAngle = pow(-1, j) * ABS(180 * ABS(k-1) - moveAngle);
                
 
               [self.sv addSubview:lilView];
 
                 
               [views_i addObject:lilView];

...
       // outside of j, k loop
       // add array of views for a given scroll view 'page' index to self.viewsArray
       [self.viewsArray addObject: views_i];

```

That's it. Set it and forget it. You're all done. 


A couple of provisos slash think of this as a to-do-list:

1. This was written assuming an app that enforces portrait orientation. You'd have to write some kind of redraw() function to extend this for rotations

2. I haven't done any performance optimization but mostly relied on setting view opacities to YES to help performance. It would be good to experiment with lazy loading/displays.

3. Would be nice to move views along a user-defined path rather than just along a straight line with an angle.

4. Would be good to offer other property adjustments depending on scrolling, such as opacity. This would be easy to implement if desired so I may leave this as an exercise to the reader.

