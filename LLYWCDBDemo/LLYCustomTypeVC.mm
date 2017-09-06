//
//  LLYCustomTypeVC.m
//  LLYWCDBDemo
//
//  Created by lly on 2017/9/6.
//  Copyright © 2017年 lly. All rights reserved.
//

#import "LLYCustomTypeVC.h"
#import "LLYWCDBHandle.h"
#import "LLYModel.h"
#import "LLYFamily.h"
#import "LLYFamily+WCTTableCoding.h"

static NSString * const tableName = @"FAMILY";

@interface LLYCustomTypeVC ()

@property (nonatomic,strong) LLYWCDBHandle *wcdbHandle;


@end

@implementation LLYCustomTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
            bool bRet = [self.wcdbHandle createTable:tableName class:LLYFamily.class];
            NSLog(@"建表 %d",bRet);
        }
            break;
            
        case 1001:
        {
            LLYModel *model1 = [[LLYModel alloc]init];
            int uId =  (arc4random() % 1000) + 1;
            model1.userId = uId;
            model1.name = [NSString stringWithFormat:@"lly%d",uId];
            model1.age = 30;
            model1.job = @"iOS";
            model1.address = @"beijing";
            
            LLYModel *model2 = [[LLYModel alloc]init];
            int uId2 =  (arc4random() % 1000) + 1;
            model2.userId = uId2;
            model2.name = [NSString stringWithFormat:@"lly%d",uId2];
            model2.age = 30;
            model2.job = @"iOS";
            model2.address = @"beijing";
            
            LLYModel *model3 = [[LLYModel alloc]init];
            int uId3 =  (arc4random() % 1000) + 1;
            model3.userId = uId3;
            model3.name = [NSString stringWithFormat:@"lly%d",uId3];
            model3.age = 30;
            model3.job = @"iOS";
            model3.address = @"beijing";
            
            
            
            LLYFamily *family = [[LLYFamily alloc]init];
            family.memOne = model1;
            family.memTwo = model2;
            family.memThree = model3;
            family.fId = (arc4random() % 1000) + 1;
            //插入
            [self.wcdbHandle insertModel:family tableName:tableName];
        }
            break;
            
        case 1002:
        {
            //删除
            [self.wcdbHandle deleteModel:tableName where:LLYFamily.fId > 500];
        }
            break;
            
        case 1003:
        {
            //修改
            LLYModel *model1 = [[LLYModel alloc]init];
            int uId =  (arc4random() % 1000) + 1;
            model1.userId = uId;
            model1.name = [NSString stringWithFormat:@"crr%d",uId];
            model1.age = 30;
            model1.job = @"iOS";
            model1.address = @"beijing";
            
            LLYFamily *family = [[LLYFamily alloc]init];
            family.memOne = model1;
            family.fId = (arc4random() % 1000) + 1;
            
            [self.wcdbHandle updateModel:family tableName:tableName onProperties:LLYFamily.memOne];
        }
            break;
            
        case 1004:
        {
            //查询
            NSArray *array = [self.wcdbHandle searchFromTabel:tableName class:LLYFamily.class];
            NSLog(@"array = %@",array);
        }
            break;
            
        default:
            break;
    }
}

- (IBAction)pop:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
