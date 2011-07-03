//
//  EmailableCellAppDelegate.h
//  EmailableCell
//
//  Created by Ahmet Ardal on 7/3/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EmailableCellViewController;

@interface EmailableCellAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    EmailableCellViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EmailableCellViewController *viewController;

@end

