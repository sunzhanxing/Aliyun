//
//  UILabel+StringFrame.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/29.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+StringFrame.h"


@implementation UILabel (StringFrame)

- (CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}
@end

