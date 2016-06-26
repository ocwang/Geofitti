//
//  DrawView.h
//  RasterManipulation
//
//  Created by Plamen Petkov on 10/3/14.
//
//

#import <UIKit/UIKit.h>

@interface DrawView_DisplayingRasterImages : UIView

@property (strong, nonatomic) UIImage *useThisImage;
-(id) initWithFrame:(CGRect)frame withImage:(UIImage *)image;

@end
