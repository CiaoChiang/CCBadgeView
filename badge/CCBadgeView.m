//
//  CCBadgeView.m
//  badge
//
//  Created by Ciao Chiang on 8/7/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#define BADGECOLOR [UIColor redColor]
#define TEXTCOLOR [UIColor whiteColor]

#import "CCBadgeView.h"
@interface CCBadgeView()
@property (strong, nonatomic) UIView *badgeView;
@property (strong, nonatomic) UILabel *badgeLabel;
@end

@implementation CCBadgeView

- (void) awakeFromNib {

}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initVisual];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initVisual];
    }
    return self;
}

- (void) initVisual {
    // Set Badge Visual
    self.badgeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [self.badgeView setBackgroundColor: BADGECOLOR];
    [self.badgeView.layer setCornerRadius:self.badgeView.frame.size.width/2];
    
    // Set Badge Shadow
    [self.badgeView.layer setShadowOpacity:0.2];
    [self.badgeView.layer setShadowRadius:0.8];
    [self.badgeView.layer setShadowOffset:CGSizeMake(0.6, 0.6)];
    [self.badgeView.layer setShadowColor:[UIColor blackColor].CGColor];
    
    // Set Label Visual
    self.badgeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.badgeView.frame.size.width,self.badgeView.frame.size.height)];
    [self.badgeLabel setFont:[UIFont fontWithName:@"Avenir-Heavy" size:15]];
    [self.badgeLabel setTextAlignment:NSTextAlignmentCenter];
    [self.badgeLabel setTextColor:[UIColor whiteColor]];
    
    [self.badgeView addSubview:self.badgeLabel];
    
    [self addSubview:self.badgeView];
}

- (void) resizeBadge{
    CGSize textSize = [[self.badgeLabel text] sizeWithAttributes:@{NSFontAttributeName:[self.badgeLabel font]}];
    CGFloat width = (textSize.width < 16)?20:textSize.width+8;
    self.badgeView.frame = CGRectMake(0, 0, width, self.badgeView.frame.size.height);
    self.badgeLabel.frame = CGRectMake(0, 0, width, self.badgeView.frame.size.height);
}


#pragma mark - Property Setter
- (void) setBadgeNumber:(int)quantity{
    if (quantity) {
        [self.badgeView setHidden:NO];
        
        NSString *wording = (quantity > 99)?@"99+":[NSString stringWithFormat:@"%d", quantity];
        [self.badgeLabel setText:wording];
        [self resizeBadge];
    }else{
        [self.badgeView setHidden:YES];
    }
}

- (void) setBadgeColor:(UIColor *)badgeColor{
    UIColor *color = (badgeColor)?badgeColor:BADGECOLOR;
    [self setBackgroundColor:color];
}

- (void) setTextColor:(UIColor *)textColor{
    UIColor *color = (textColor)?textColor:TEXTCOLOR;
    [self.badgeLabel setTextColor:color];
}

@end
