//
//  LZGridView.m
//  LZGirdViewCheckTool
//
//  Created by Lazy Yuuuuu on 2020/7/9.
//

#import "LZGridView.h"


@implementation LZGridView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.vMarginWidthDict = @{@"414": @(19.f), @"375": @(17.f), @"360": @(16.f), @"320": @(15.f)};
    self.vMarginWidth = 0.f;
    self.vColumnWidth = 8.f;
    self.vGutterWidth = 8.f;
    self.vMarginColor = [UIColor clearColor];
    self.vColumnColor = [UIColor colorWithRed:(0x32/255.0) green:(0x8A/255.0) blue:(0xF4/255.0) alpha:0.3];
    self.vGutterColor = [UIColor clearColor];
    
    self.MiddleColor = [UIColor colorWithRed:(0xB9/255.0) green:(0xB4/255.0) blue:(0xB7/255.0) alpha:0.3];
    
    self.hMarginHeightDict = nil;
    self.hMarginHeight = 0.f;
    self.hRowHeight = 4.f;
    self.hGutterHeight = 4.f;
    self.hMarginColor = [UIColor clearColor];
    self.hRowColor = [UIColor colorWithRed:(0xFF/255.0) green:(0xA1/255.0) blue:(0xE2/255.0) alpha:0.3];
    self.hGutterColor = [UIColor clearColor];
    self.showHMiddleLine = NO;
    
    self.showHGirdView = YES;
    self.opaque = NO;
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = NO;
    
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    CGContextSetShouldAntialias(context, NO);
    
    CGFloat xPos = 0;
    xPos = [self drawVMarginWithPos:xPos];
    xPos = [self drawVColumnGutterWithPos:xPos];
    xPos = [self drawVMarginWithPos:xPos];
    
    if (self.showHGirdView) {
        CGFloat yPos = 0;
        yPos = [self drawHMarginWithPos:yPos];
        yPos = [self drawHRowGutterWithPos:yPos];
        yPos = [self drawHMarginWithPos:yPos];
    }
}

#pragma mark - vertical

- (CGFloat)drawVMarginWithPos:(CGFloat)pos {
    if (self.vMarginWidth == 0 && self.vMarginWidthDict.count > 0) {
        NSString *key = [NSString stringWithFormat:@"%0.f", CGRectGetWidth([[UIScreen mainScreen] bounds])];
        NSNumber *marginWidth = [self.vMarginWidthDict objectForKey:key];
        if (marginWidth != nil) {
            self.vMarginWidth = [marginWidth floatValue];
        }
    }
    if (self.vMarginWidth <= 0) {
        return pos;
    }
    CGFloat realPos = pos + self.vMarginWidth * 0.5;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.vMarginColor.CGColor);
    CGContextSetLineWidth(context, self.vMarginWidth);
    CGContextMoveToPoint(context, realPos, 0);
    CGContextAddLineToPoint(context, realPos, CGRectGetHeight(self.bounds));
    CGContextStrokePath(context);
    return pos + self.vMarginWidth;
}

- (CGFloat)drawVColumnGutterWithPos:(CGFloat)pos {
    CGFloat totalWidth = CGRectGetWidth(self.bounds) - self.vMarginWidth * 2;
    BOOL needMid = ((int)(totalWidth - self.vColumnWidth) % (int)(self.vColumnWidth + self.vGutterWidth)) == 0 ? NO : YES;
    CGFloat midWidth = 0;
    int columnCount = (int)(totalWidth - self.vColumnWidth) / (int)(self.vColumnWidth + self.vGutterWidth);
    if (needMid) {
        midWidth = totalWidth - self.vColumnWidth - columnCount * (self.vColumnWidth + self.vGutterWidth);
    }
    if (midWidth > self.vColumnWidth) {
        midWidth = midWidth - self.vColumnWidth;
        columnCount++;
    } else if (midWidth == self.vColumnWidth) {
        midWidth = 0;
    }
    BOOL isColumn = YES;
    for (int i = 0; i < columnCount * 2 + 1; i++) {
        if (i == columnCount && midWidth > 0) {
            pos = [self drawVMiddleWithPos:pos width:midWidth];
        } else if (isColumn) {
            pos = [self drawVColumnWithPos:pos];
        } else {
            pos = [self drawVGutterWithPos:pos];
        }
        isColumn = !isColumn;
    }
    
    return pos;
}

- (CGFloat)drawVMiddleWithPos:(CGFloat)pos width:(CGFloat)width {
    CGFloat realPos = pos + width * 0.5;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.MiddleColor.CGColor);
    CGContextSetLineWidth(context, width);
    CGContextMoveToPoint(context, realPos, 0);
    CGContextAddLineToPoint(context, realPos, CGRectGetHeight(self.bounds));
    CGContextStrokePath(context);
    return pos + width;
}

- (CGFloat)drawVColumnWithPos:(CGFloat)pos {
    CGFloat realPos = pos + self.vColumnWidth * 0.5;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.vColumnColor.CGColor);
    CGContextSetLineWidth(context, self.vColumnWidth);
    CGContextMoveToPoint(context, realPos, 0);
    CGContextAddLineToPoint(context, realPos, CGRectGetHeight(self.bounds));
    CGContextStrokePath(context);
    return pos + self.vColumnWidth;
}

- (CGFloat)drawVGutterWithPos:(CGFloat)pos {
    CGFloat realPos = pos + self.vGutterWidth * 0.5;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.vGutterColor.CGColor);
    CGContextSetLineWidth(context, self.vGutterWidth);
    CGContextMoveToPoint(context, realPos, 0);
    CGContextAddLineToPoint(context, realPos, CGRectGetHeight(self.bounds));
    CGContextStrokePath(context);
    return pos + self.vGutterWidth;
}

#pragma mark - horizontal
- (CGFloat)drawHMarginWithPos:(CGFloat)pos {
    if (self.hMarginHeight == 0 && self.hMarginHeightDict.count > 0) {
        NSString *key = [NSString stringWithFormat:@"%0.f", CGRectGetWidth([[UIScreen mainScreen] bounds])];
        NSNumber *marginWidth = [self.hMarginHeightDict objectForKey:key];
        if (marginWidth != nil) {
            self.hMarginHeight = [marginWidth floatValue];
        }
    }
    if (self.hMarginHeight <= 0) {
        return pos;
    }
    CGFloat realPos = pos + self.hMarginHeight * 0.5;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.hMarginColor.CGColor);
    CGContextSetLineWidth(context, self.hMarginHeight);
    CGContextMoveToPoint(context, 0, realPos);
    CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds), realPos);
    CGContextStrokePath(context);
    return pos + self.hMarginHeight;
}

- (CGFloat)drawHRowGutterWithPos:(CGFloat)pos {
    CGFloat totalHeight = CGRectGetHeight(self.bounds) - self.hMarginHeight * 2;
    BOOL needMid = ((int)(totalHeight - self.hRowHeight) % (int)(self.hRowHeight + self.hGutterHeight)) == 0 ? NO : YES;
    CGFloat midHeight = 0;
    int rowCount = (int)(totalHeight - self.hRowHeight) / (int)(self.hRowHeight + self.hGutterHeight);
    if (needMid) {
        midHeight = totalHeight - self.hRowHeight - rowCount * (self.hRowHeight + self.hGutterHeight);
    }
    if (midHeight > self.hRowHeight) {
        midHeight = midHeight - self.hRowHeight;
        rowCount++;
    } else if (midHeight == self.hRowHeight) {
        midHeight = 0;
    }
    BOOL isRow = YES;
    for (int i = 0; i < rowCount * 2 + 1; i++) {
        if (self.showHMiddleLine && i == rowCount && midHeight > 0) {
            pos = [self drawHMiddleWithPos:pos height:midHeight];
        } else if (isRow) {
            pos = [self drawHRowWithPos:pos];
        } else {
            pos = [self drawHGutterWithPos:pos];
        }
        isRow = !isRow;
    }
    
    return pos;
}

- (CGFloat)drawHMiddleWithPos:(CGFloat)pos height:(CGFloat)height {
    CGFloat realPos = pos + height * 0.5;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.MiddleColor.CGColor);
    CGContextSetLineWidth(context, height);
    CGContextMoveToPoint(context, 0, realPos);
    CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds), realPos);
    CGContextStrokePath(context);
    return pos + height;
}

- (CGFloat)drawHRowWithPos:(CGFloat)pos {
    CGFloat realPos = pos + self.hRowHeight * 0.5;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.hRowColor.CGColor);
    CGContextSetLineWidth(context, self.hRowHeight);
    CGContextMoveToPoint(context, 0, realPos);
    CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds), realPos);
    CGContextStrokePath(context);
    return pos + self.hRowHeight;
}

- (CGFloat)drawHGutterWithPos:(CGFloat)pos {
    CGFloat realPos = pos + self.hGutterHeight * 0.5;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.hGutterColor.CGColor);
    CGContextSetLineWidth(context, self.hGutterHeight);
    CGContextMoveToPoint(context, 0, realPos);
    CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds), realPos);
    CGContextStrokePath(context);
    return pos + self.hGutterHeight;
}

@end
