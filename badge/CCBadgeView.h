//
//  CCBadgeView.h
//  badge
//
//  Created by Ciao Chiang on 8/7/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCBadgeView : UIView
@property (nonatomic,setter=setBadgeNumber:) int quantity;
@property (strong, nonatomic, setter = setBadgeColor:) UIColor *badgeColor;
@property (strong, nonatomic, setter = setTextColor:) UIColor *textColor;
@end
