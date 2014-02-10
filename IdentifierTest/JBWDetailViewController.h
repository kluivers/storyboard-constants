//
//  JBWDetailViewController.h
//  IdentifierTest
//
//  Created by Joris Kluivers on 10/02/14.
//  Copyright (c) 2014 Joris Kluivers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JBWDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
