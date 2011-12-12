//
//  FlipperController.m
//  Flipper
//
//  Created by Roberto Breve on 12/12/11.
//  Copyright (c) 2011 Icoms. All rights reserved.
//

#import "FlipperController.h"
#import <QuartzCore/QuartzCore.h>

@implementation FlipperController

@synthesize flipView = _flipView;
@synthesize imageView = _imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

-(void) setImageView:(UIImageView *)imageView{
    _imageView = imageView;
    
    [self.flipView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)]];

}

-(void) pan:(UIPanGestureRecognizer *)gesture{
    if((gesture.state == UIGestureRecognizerStateChanged) ||
       gesture.state == UIGestureRecognizerStateEnded){
        
        CGPoint translation = [gesture translationInView:self.flipView];
        
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / -1000;
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, translation.x/6 * M_PI / 180.0f, 0.0f, 1.0f, 0.0f);
        
        float ypos = self.imageView.layer.position.y;
        
        self.imageView.layer.anchorPoint = CGPointMake(0, 0.5);
        self.imageView.layer.position = CGPointMake(0, ypos);
        
        self.imageView.layer.transform = rotationAndPerspectiveTransform;
        //translation.y
        
        /*
        self.imageView.frame = CGRectMake(translation.x, translation.y, self.imageView.bounds.size.width, self.imageView.bounds.size.height);
        */
        //[gesture setTranslation:CGPointZero inView:self.flipView];
        
        [self.flipView setNeedsDisplay];
        

    }
}
 
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
 
- (void)viewDidUnload
{
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
