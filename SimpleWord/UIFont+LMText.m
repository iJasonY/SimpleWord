//
//  UIFont+LMText.m
//  SimpleWord
//
//  Created by Chenly on 16/6/30.
//  Copyright © 2016年 Little Meaning. All rights reserved.
//

#import "UIFont+LMText.h"

@implementation UIFont (LMText)

- (BOOL)bold {
    // 通过fontName来判断粗体
    UIFont *template = [UIFont lm_fontWithFontSize:self.fontSize bold:YES italic:self.italic];
    return [self.fontDescriptor.fontAttributes isEqual:template.fontDescriptor.fontAttributes];
}

- (BOOL)italic {
    // 通过是否包含 matrix 判断斜体
    return self.fontDescriptor.fontAttributes[@"NSCTFontMatrixAttribute"] != nil;
}

- (float)fontSize {
    return [self.fontDescriptor.fontAttributes[@"NSFontSizeAttribute"] floatValue];
}

+ (instancetype)lm_fontWithFontSize:(float)fontSize bold:(BOOL)bold italic:(BOOL)italic {

    UIFont *font = bold ? [UIFont boldSystemFontOfSize:fontSize] : [UIFont systemFontOfSize:fontSize];
    if (italic) {
        CGAffineTransform matrix = CGAffineTransformMake(1, 0, tanf(15 * (CGFloat)M_PI / 180), 1, 0, 0);
        UIFontDescriptor *descriptor = [UIFontDescriptor fontDescriptorWithName:font.fontName matrix:matrix];
        font = [UIFont fontWithDescriptor:descriptor size:fontSize];
    }
    return font;
}

@end