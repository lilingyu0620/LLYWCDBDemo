//
//  LLYFamily.h
//  LLYWCDBDemo
//
//  Created by lly on 2017/9/6.
//  Copyright © 2017年 lly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLYModel.h"


@interface LLYFamily : NSObject

@property (nonatomic,assign) int fId;
@property (nonatomic,strong) LLYModel *memOne;
@property (nonatomic,strong) LLYModel *memTwo;
@property (nonatomic,strong) LLYModel *memThree;

@end
