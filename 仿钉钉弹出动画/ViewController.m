//
//  ViewController.m
//  仿钉钉弹出动画
//
//  Created by KAbun on 17/4/19.
//  Copyright © 2017年 KABIN. All rights reserved.
//

#import "ViewController.h"
#import "BlurEffectMenu.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<BlurEffectMenuDelegate>

@property(nonatomic,strong)UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"1.jpg"]]];
    [self.view addSubview:self.btn];
}

- (UIButton *)btn{
    if (!_btn) {
        _btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setFrame:CGRectMake(kScreenWidth/2-30.0, kScreenHeight-49.0-60.0, 60.0, 60.0)];
        [_btn setTitle:@"点击" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_btn.layer setBorderWidth:0.5];
        [_btn.layer setBorderColor:[UIColor darkGrayColor].CGColor];
        [_btn.layer setCornerRadius:30.0];
        [_btn.layer setMasksToBounds:YES];
        [_btn setBackgroundColor:[UIColor lightGrayColor]];
        [_btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

#pragma mark - Event
- (void)btnClicked{
    BlurEffectMenuItem *addMattersItem=[[BlurEffectMenuItem alloc]init];
    [addMattersItem setTitle:@"添加事项"];
    [addMattersItem setIcon:[UIImage imageNamed:@"addMatters"]];
    
    BlurEffectMenuItem *addSchedulesItem=[[BlurEffectMenuItem alloc]init];
    [addSchedulesItem setTitle:@"添加日程"];
    [addSchedulesItem setIcon:[UIImage imageNamed:@"addSchedule"]];
    
    BlurEffectMenuItem *setupChatItem=[[BlurEffectMenuItem alloc]init];
    [setupChatItem setTitle:@"发起会话"];
    [setupChatItem setIcon:[UIImage imageNamed:@"setupChat"]];
    
    BlurEffectMenuItem *searchContactsItem=[[BlurEffectMenuItem alloc]init];
    [searchContactsItem setTitle:@"查找联系人"];
    [searchContactsItem setIcon:[UIImage imageNamed:@"searchContacts"]];
    
    BlurEffectMenu *menu=[[BlurEffectMenu alloc]initWithMenus:@[addMattersItem,addSchedulesItem,setupChatItem,searchContactsItem]];
    [menu setDelegate:self];
    menu.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [menu setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:menu animated:YES completion:nil];}

#pragma mark - BlurEffectMenu Delegate
- (void)blurEffectMenuDidTapOnBackground:(BlurEffectMenu *)menu{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)blurEffectMenu:(BlurEffectMenu *)menu didTapOnItem:(BlurEffectMenuItem *)item{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"item.title:%@",item.title);
    
}

@end
