//
//  LZGridView.h
//  LZGirdViewCheckTool
//
//  Created by Lazy Yuuuuu on 2020/7/9.
//

#import <UIKit/UIKit.h>


@interface LZGridView : UIView

@property (nonatomic, strong) NSDictionary *vMarginWidthDict;
@property (nonatomic, assign) CGFloat vMarginWidth;
@property (nonatomic, assign) CGFloat vColumnWidth;
@property (nonatomic, assign) CGFloat vGutterWidth;
@property (nonatomic, strong) UIColor *vMarginColor;
@property (nonatomic, strong) UIColor *vColumnColor;
@property (nonatomic, strong) UIColor *vGutterColor;

@property (nonatomic, strong) UIColor *MiddleColor;

@property (nonatomic, strong) NSDictionary *hMarginHeightDict;
@property (nonatomic, assign) CGFloat hMarginHeight;
@property (nonatomic, assign) CGFloat hRowHeight;
@property (nonatomic, assign) CGFloat hGutterHeight;
@property (nonatomic, strong) UIColor *hMarginColor;
@property (nonatomic, strong) UIColor *hRowColor;
@property (nonatomic, strong) UIColor *hGutterColor;
@property (nonatomic, assign) BOOL showHGirdView;
@property (nonatomic, assign) BOOL showHMiddleLine;

@end

