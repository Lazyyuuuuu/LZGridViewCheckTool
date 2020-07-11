//
//  LZGridWindow.m
//  LZGridViewCheckTool
//
//  Created by Lazy Yuuuuu on 2020/7/9.
//

#import "LZGridWindow.h"
#import "LZGridView.h"

@interface LZGridWindow ()

@property (nonatomic, strong) LZGridView *gridView;

@end

@implementation LZGridWindow

+ (instancetype)sharedInstance
{
    static LZGridWindow *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [LZGridWindow new];
    });
    return instance;
}

- (instancetype)init
{
    return [self initWithFrame:[[UIScreen mainScreen] bounds]];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.windowLevel = UIWindowLevelStatusBar + 1.f;
        self.gridView = [[LZGridView alloc] initWithFrame:frame];
        [self addSubview:self.gridView];
        self.hidden = NO;
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)show {
    UIWindow *topWindow = [UIApplication sharedApplication].keyWindow;
    [topWindow addSubview:self.gridView];
    self.hidden = NO;
}

- (void)hide {
    self.hidden = YES;
    [self.gridView removeFromSuperview];
}

- (void)setVMarginWidthDict:(NSDictionary *)dict {
    self.gridView.vMarginWidthDict = [dict copy];
}

- (void)setVMarginWidth:(CGFloat)vMarginWidth {
    self.gridView.vMarginWidth = vMarginWidth;
}

- (void)setVColumnWidth:(CGFloat)vColumnWidth {
    self.gridView.vColumnWidth = vColumnWidth;
}

- (void)setVGutterWidth:(CGFloat)vGutterWidth {
    self.gridView.vGutterWidth = vGutterWidth;
}

- (void)setVMarginColor:(UIColor *)vMarginColor {
    self.gridView.vMarginColor = vMarginColor;
}

- (void)setVColumnColor:(UIColor *)vColumnColor {
    self.gridView.vColumnColor = vColumnColor;
}

- (void)setVGutterColor:(UIColor *)vGutterColor {
    self.gridView.vGutterColor = vGutterColor;
}

- (void)setMiddleColor:(UIColor *)MiddleColor {
    self.gridView.MiddleColor = MiddleColor;
}

- (void)setHMarginHeightDict:(NSDictionary *)dict {
    self.gridView.hMarginHeightDict = [dict copy];
}

- (void)setHMarginHeight:(CGFloat)hMarginHeight {
    self.gridView.hMarginHeight = hMarginHeight;
}

- (void)setHRowHeight:(CGFloat)hRowHeight {
    self.gridView.hRowHeight = hRowHeight;
}

- (void)setHGutterHeight:(CGFloat)hGutterHeight {
    self.gridView.hGutterHeight = hGutterHeight;
}

- (void)setHMarginColor:(UIColor *)hMarginColor {
    self.gridView.hMarginColor = hMarginColor;
}

- (void)setHRowColor:(UIColor *)hRowColor {
    self.gridView.hRowColor = hRowColor;
}

- (void)setHGutterColor:(UIColor *)hGutterColor {
    self.gridView.hGutterColor = hGutterColor;
}

- (void)setShowHGridView:(BOOL)showHGridView {
    self.gridView.showHGirdView = showHGridView;
}

- (void)setShowHMiddleLine:(BOOL)showHMiddleLine {
    self.gridView.showHMiddleLine = showHMiddleLine;
}

@end
