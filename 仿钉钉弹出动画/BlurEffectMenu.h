//
//  BlurEffectMenu.h
//  仿钉钉弹出动画
//
//  Created by KAbun on 17/4/19.
//  Copyright © 2017年 KABIN. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlurEffectMenu,BlurEffectMenuItem;

@protocol BlurEffectMenuDelegate <NSObject>

//点击背景dismiss
- (void)blurEffectMenuDidTapOnBackground:(BlurEffectMenu *)menu;
//点击item
- (void)blurEffectMenu:(BlurEffectMenu *)menu didTapOnItem:(BlurEffectMenuItem *)item;

@end

@interface BlurEffectMenuItem : NSObject

@property (nonatomic,copy) NSString *title;//标题
@property (nonatomic,strong) UIImage *icon;//图标
@end

@interface BlurEffectMenu : UIViewController

@property (nonatomic,assign) id<BlurEffectMenuDelegate>delegate;
@property (nonatomic,copy) NSArray *menuItemArr;
//初始化
- (instancetype)initWithMenus:(NSArray *)menus;


@end
