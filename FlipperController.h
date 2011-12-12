//
//  FlipperController.h
//  Flipper
//
//  Created by Roberto Breve on 12/12/11.
//  Copyright (c) 2011 Icoms. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlipView.h"

@interface FlipperController : UIViewController

@property (nonatomic, weak)  IBOutlet FlipView *flipView;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
