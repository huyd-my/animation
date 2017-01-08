//
//  ViewController.m
//  test
//
//  Created by apple7 on 16/12/5.
//  Copyright © 2016年 apple7. All rights reserved.
//

#import "ViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "MKJExplosionView.h"

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet CHTCollectionViewWaterfallLayout *customLayout;

@property(nonatomic,strong) NSArray *list;
@property(nonatomic,strong) UIButton *button;
@property(nonatomic,strong) UIButton *button1;
@property(nonatomic,strong) MKJExplosionView *mkjView;  //下雪的爱心


@end

static NSString *identify1 = @"FirstCollectionViewCell";
static NSString *identify2 = @"SecondCollectionViewCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mkjView = [[MKJExplosionView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [self.view addSubview:self.mkjView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
