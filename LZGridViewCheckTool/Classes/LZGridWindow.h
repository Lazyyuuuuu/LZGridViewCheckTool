//
//  LZGridWindow.h
//  LZGridViewCheckTool
//
//  Created by Lazy Yuuuuu on 2020/7/9.
//

#import <UIKit/UIKit.h>


@interface LZGridWindow : UIWindow

+ (instancetype)sharedInstance;

/// show the grid view to check
- (void)show;

/// hide the grid view
- (void)hide;

/// set vertical Lines margin width
/// different width for different device
/// default is @{@"414": @(19.f), @"375": @(17.f), @"320": @(15.f)};
/// @param dict margin width for different device
- (void)setVMarginWidthDict:(NSDictionary *)dict;

/// set vertical Lines margin width, default is 0.f
/// if vMarginWidthDict has value this will be ignore
/// @param vMarginWidth margin width
- (void)setVMarginWidth:(CGFloat)vMarginWidth;

/// set vertical column width, default is 8.f
/// @param vColumnWidth column width
- (void)setVColumnWidth:(CGFloat)vColumnWidth;

/// set vertical gutter width, default is 8.f
/// @param vGutterWidth gutter width
- (void)setVGutterWidth:(CGFloat)vGutterWidth;

/// set vertical margin color, default is [UIColor clearColor]
/// @param vMarginColor margin color
- (void)setVMarginColor:(UIColor *)vMarginColor;

/// set vertical column color, default is #328af4,alpha 0.3
/// @param vColumnColor column color
- (void)setVColumnColor:(UIColor *)vColumnColor;

/// set vertical gutter color, default is [UIColor clearColor]
/// @param vGutterColor gutter color
- (void)setVGutterColor:(UIColor *)vGutterColor;

/// set vertical middle line color, default is [UIColor clearColor]
/// @param MiddleColor middle line color
- (void)setMiddleColor:(UIColor *)MiddleColor;

/// set horizontal Lines margin height
/// different height for different device
/// default is nil
/// @param dict margin height for different device
- (void)setHMarginHeightDict:(NSDictionary *)dict;

/// set horizontal Lines margin height, default is 0.f
/// if hMarginHeightDict has value this will be ignore
/// @param hMarginHeight margin height
- (void)setHMarginHeight:(CGFloat)hMarginHeight;

/// set horizontal row height, default is 4.f
/// @param hRowHeight row height
- (void)setHRowHeight:(CGFloat)hRowHeight;

/// set horizontal gutter height, default is 4.f
/// @param hGutterHeight gutter height
- (void)setHGutterHeight:(CGFloat)hGutterHeight;

/// set horizontal margin color, default is [UIColor clearColor]
/// @param hMarginColor margin color
- (void)setHMarginColor:(UIColor *)hMarginColor;

/// set horizontal row color,, default is #ffa1e2,alpha 0.3
/// @param hRowColor row color
- (void)setHRowColor:(UIColor *)hRowColor;

/// set horizontal gutter color, default is [UIColor clearColor]
/// @param hGutterColor gutter color
- (void)setHGutterColor:(UIColor *)hGutterColor;

/// set should show horizontal grid view
/// @param showHGridView should show horizontal grid view
- (void)setShowHGridView:(BOOL)showHGridView;

/// set should show horizontal middle line
/// @param showHMiddleLine should show horizontal middle line
- (void)setShowHMiddleLine:(BOOL)showHMiddleLine;

@end

