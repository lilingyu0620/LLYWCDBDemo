//
//  ViewController.m
//  LLYWCDBDemo
//
//  Created by lly on 2017/9/5.
//  Copyright © 2017年 lly. All rights reserved.
//

#import "ViewController.h"
#import "LLYWCDBHandle.h"
#import "LLYModel.h"
#import "LLYModel+WCTTableCoding.h"
#import "LLYCustomTypeVC.h"


static NSString * const tableName = @"LLY";


@interface ViewController ()

@property (nonatomic,strong) LLYWCDBHandle *wcdbHandle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _wcdbHandle = [[LLYWCDBHandle alloc]init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnClicked:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 1000:
        {
            //建表
            bool bRet = [self.wcdbHandle createTable:tableName class:LLYModel.class];
            NSLog(@"建表 %d",bRet);
        }
            break;
            
        case 1001:
        {
            LLYModel *model = [[LLYModel alloc]init];
            int uId =  (arc4random() % 1000) + 1;
            model.userId = uId;
            model.name = [NSString stringWithFormat:@"lly%d",uId];
            model.age = 30;
            model.job = @"iOS";
            model.address = @"beijing";
            //插入
            [self.wcdbHandle insertModel:model tableName:tableName];
        }
            break;
            
        case 1002:
        {
            //删除
            [self.wcdbHandle deleteModel:tableName where:LLYModel.age > 500];
        }
            break;
            
        case 1003:
        {
            //修改
            LLYModel *model = [[LLYModel alloc]init];
            model.age = 100;

            [self.wcdbHandle updateModel:model tableName:tableName onProperties:LLYModel.age];
        }
            break;
            
        case 1004:
        {
            //查询
            NSArray *array = [self.wcdbHandle searchFromTabel:tableName class:LLYModel.class];
            NSLog(@"array = %@",array);
        }
            break;
            
        default:
            break;
    }
    
}

- (IBAction)customTypeBtn:(id)sender {
    
    LLYCustomTypeVC *typeVC = [[LLYCustomTypeVC alloc]init];
    [self presentViewController:typeVC animated:YES completion:^{
        
    }];
    
}

@end
