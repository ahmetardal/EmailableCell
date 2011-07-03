//
//  EmailableCellViewController.h
//  EmailableCell
//
//  Created by Ahmet Ardal on 7/3/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "EmailableCell.h"

@interface EmailableCellViewController: UIViewController<UITableViewDelegate,
                                                            UITableViewDataSource,
                                                            EmailableCellDelegate,
                                                            MFMailComposeViewControllerDelegate>
{
    UITableView *demoTableView;
    NSArray *emailAddresses;
}

@property (nonatomic, retain) IBOutlet UITableView *demoTableView;
@property (nonatomic, retain) NSArray *emailAddresses;

@end
