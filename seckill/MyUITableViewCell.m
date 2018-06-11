//
//  MyUITableViewCell.m
//  seckill
//
//  Created by limingru on 2018/6/11.
//  Copyright © 2018 limingru. All rights reserved.
//

#import "MyUITableViewCell.h"
#import "TimerManager.h"

@interface MyUITableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *goBtn;
@property (weak, nonatomic) IBOutlet UILabel *statusLbl;
@property (weak, nonatomic) IBOutlet UILabel *timerLbl;

@end

@implementation MyUITableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.goBtn setTitle:@"ORDER" forState:UIControlStateNormal];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(timeNotify:) name:timerManagerNotify object:nil];
}

-(void)setProduct:(Product *)product {
    _product = product;
    self.timerLbl.hidden = self.goBtn.hidden = YES;
    self.statusLbl.text = _product.name;
    [self checkTime];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"dealloc >> %@",[self class]);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)go:(id)sender {
    NSLog(@"%@",[NSString stringWithFormat:@"ORDERED %@",self.product.name]);
}

-(void)timeNotify:(NSNotification *)sender {
    [self checkTime];
}

-(void)checkTime {
    NSDate *nowDate = [NSDate date];
    NSTimeInterval timeInterval = [nowDate timeIntervalSinceReferenceDate];
    NSTimeInterval diff = self.product.endTime - timeInterval;
    if (diff<=0) {
        self.timerLbl.hidden = YES;
        self.goBtn.hidden = NO;
        return;
    }
    self.timerLbl.hidden = NO;
    self.timerLbl.text = [NSString stringWithFormat:@"%.f",diff];
}


@end
