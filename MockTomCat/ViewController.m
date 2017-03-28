//
//  ViewController.m
//  MockTomCat
//
//  Created by 丫丫 on 17/3/28.
//  Copyright © 2017年 丫丫. All rights reserved.
//

#import "ViewController.h"

const int count_eat =  40;       //吃东西的图片的个数
const int count_fart = 28;      //放P的图片的个数
const int count_drink = 81;     //喝牛奶的图片的个数
const int count_angry = 26;     //生气的图片的个数
const int count_cymbal = 13;    //敲锣的图片的个数
const int count_pic = 24;       //扔东西的图片的个数
const int count_scratch = 56;   //挠人的图片的个数
const int count_knockout = 81;  //敲晕的图片的个数
const int count_footleft = 30;  //左脚被点的图片个数
const int count_footright = 30; //右键被点的图片的个数

const float const_rate = 0.12f;//每张图片显示的时间

@interface ViewController ()
@property (strong, nonatomic) UIImageView *mainView;

@property(nonatomic,strong)UIButton * eatButton;//吃东西的按钮
@property(nonatomic,strong)UIButton * fartButton;//放P的按钮
@property(nonatomic,strong)UIButton * drinkButton;//喝东西的按钮
@property(nonatomic,strong)UIButton * scratchButton;//挠人的按钮
@property(nonatomic,strong)UIButton * pieButton;//扔东西的按钮
@property(nonatomic,strong)UIButton * cymbalButton;//敲锣的按钮

@property(nonatomic,strong)UIButton * knockoutButton;//被敲晕的按钮
@property(nonatomic,strong)UIButton * footleftButton;//左脚被点的按钮
@property(nonatomic,strong)UIButton * footrightButton;//右脚被点的按钮
@property(nonatomic,strong)UIButton * angryButton;//生气的按钮

- (void)btnClick:(id) sender;
- (void)play:(NSString *)name count: (int)_count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mainView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIImage * mainImage = [UIImage imageNamed:@"angry_00.jpg"];
    
    //NSString *fullName = [[NSBundle mainBundle]pathForResource:@"angry_00.jpg" ofType:nil];
//    UIImage *mainImage = [UIImage imageWithContentsOfFile:fullName];
    self.mainView.image = mainImage;
    
    self.eatButton = [self createButton:@"eat.png" rect:CGRectMake(10, 400, 60, 60) tag:1];
    self.fartButton = [self createButton:@"fart.png" rect:CGRectMake(10, 470, 60, 60) tag:2];
    self.drinkButton = [self createButton:@"drink.png" rect:CGRectMake(10, 540, 60, 60) tag:3];
    self.scratchButton = [self createButton:@"scratch.png" rect:CGRectMake(305, 400, 60, 60) tag:4];
    self.pieButton = [self createButton:@"pie.png" rect:CGRectMake(305, 470, 60, 60) tag:5];
    self.cymbalButton = [self createButton:@"cymbal.png" rect:CGRectMake(305, 540, 60, 60) tag:6];
    self.knockoutButton = [self createButton:nil rect:CGRectMake(70, 120, 230, 230) tag:7];
    self.footleftButton = [self createButton:nil rect:CGRectMake(145, 675, 40, 40) tag:8];
    //self.footleftButton.backgroundColor = [UIColor redColor];
    self.footrightButton = [self createButton:nil rect:CGRectMake(215, 675, 40, 40) tag:9];
    //self.footrightButton.backgroundColor = [UIColor blueColor];
    self.angryButton = [self createButton:nil rect:CGRectMake(250, 520, 40, 80) tag:10];
    
    [self.view addSubview:self.mainView];
    [self.view addSubview:self.eatButton];
    [self.view addSubview:self.fartButton];
    [self.view addSubview:self.drinkButton];
    [self.view addSubview:self.scratchButton];
    [self.view addSubview:self.pieButton];
    [self.view addSubview:self.cymbalButton];
    [self.view addSubview:self.footleftButton];
    [self.view addSubview:self.footrightButton];
    [self.view addSubview:self.knockoutButton];
    [self.view addSubview:self.angryButton];
}

- (UIButton *)createButton:(NSString *)imgName rect:(CGRect)_rect tag:(NSInteger)_tag
{
    UIButton *btn = [[UIButton alloc]initWithFrame:_rect];
    UIImage *img = [UIImage imageNamed:imgName];
    btn.tag = _tag;
    
    [btn setImage:img forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (void)btnClick: (id)sender
{
    UIButton *btn = sender;
    switch (btn.tag) {
        case 1:
            [self play:@"eat" count:count_eat];
            break;
        case 2:
            [self play:@"fart" count:count_fart];
            break;
        case 3:
            [self play:@"drink" count:count_drink];
            break;
        case 4:
            [self play:@"scratch" count:count_scratch];
            break;
        case 5:
            [self play:@"pie" count:count_pic];
            break;
        case 6:
            [self play:@"cymbal" count:count_cymbal];
            break;
        case 7:
            [self play:@"knockout" count:count_knockout];
            break;
        case 8:
            [self play:@"footRight" count:count_footright];
            break;
        case 9:
            [self play:@"footLeft" count:count_footleft];
            break;
        case 10:
            [self play:@"angry" count:count_angry];
            break;
        default:
            break;
    }
}

- (void)play:(NSString *)name count: (int)_count
{
    if ([self.mainView isAnimating])
    {
        return;
    }
    
    NSMutableArray *picArray = [[NSMutableArray alloc]initWithCapacity:50];
    for (int i = 0; i < _count; i++)
    {
        NSString *fileName = [NSString stringWithFormat:@"%@_%02d.jpg", name, i];
        NSString *fullName = [[NSBundle mainBundle]pathForResource:fileName ofType:nil];
        UIImage *img = [UIImage imageWithContentsOfFile:fullName];
        
        [picArray addObject:img];
    }
    
    self.mainView.animationImages = picArray;
    
    self.mainView.animationDuration = _count * const_rate;
    self.mainView.animationRepeatCount = 1;
    [self.mainView startAnimating];
    
    //clear images
    [self.mainView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_count*const_rate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
