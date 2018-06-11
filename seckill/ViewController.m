//
//  ViewController.m
//  seckill
//
//  Created by limingru on 2018/6/11.
//  Copyright © 2018 limingru. All rights reserved.
//

#import "ViewController.h"
#import "MyUITableViewCell.h"
#import "Product.h"
#import "TimerManager.h"
#define IDENTIFIER  @"identifier"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *activityTableView;
@property (strong,nonatomic)NSMutableArray<Product *> *products;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[TimerManager manager] start];
    self.products = [Product demoProducts];
    [self.activityTableView registerNib:[UINib nibWithNibName:@"MyUITableViewCell" bundle:nil] forCellReuseIdentifier:IDENTIFIER];
    self.activityTableView.delegate = self;
    self.activityTableView.dataSource = self;
    self.activityTableView.estimatedRowHeight = 30.0f;
}

#pragma mark -- UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.products.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyUITableViewCell *cell = (MyUITableViewCell*)[tableView dequeueReusableCellWithIdentifier:IDENTIFIER];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ((indexPath.row + 1)%2==0) {
        cell.backgroundColor = [UIColor greenColor];
    } else {
        cell.backgroundColor = [UIColor blueColor];
    }
    cell.product = self.products[indexPath.row];
    return cell;
}
@end
