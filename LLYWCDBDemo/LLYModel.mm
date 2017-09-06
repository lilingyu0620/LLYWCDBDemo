//
//  LLYModel.m
//  LLYWCDBDemo
//
//  Created by lly on 2017/9/5.
//  Copyright © 2017年 lly. All rights reserved.
//

#import "LLYModel.h"

#import <WCDB/WCDB.h>


@implementation LLYModel

WCDB_IMPLEMENTATION(LLYModel)
WCDB_SYNTHESIZE(LLYModel,userId)
WCDB_SYNTHESIZE(LLYModel,name)
WCDB_SYNTHESIZE(LLYModel,age)
WCDB_SYNTHESIZE(LLYModel,job)
WCDB_SYNTHESIZE(LLYModel,address)

//WCDB_PRIMARY(LLYModel,userId)


- (void)encodeWithCoder:(NSCoder *)encoder{

    [encoder encodeObject:@(_userId) forKey:@"userId"];
    
    [encoder encodeObject:_name forKey:@"name"];
    
    [encoder encodeObject:@(_age) forKey:@"age"];
    
    [encoder encodeObject:_job forKey:@"job"];
    
    [encoder encodeObject:_address forKey:@"address"];

}

- (id)initWithCoder:(NSCoder *)decoder{

    _userId = [[decoder decodeObjectForKey:@"userId"] integerValue];
    
    _name = [decoder decodeObjectForKey:@"name"];
    
    _age = [[decoder decodeObjectForKey:@"age"] integerValue];
    
    _job = [decoder decodeObjectForKey:@"job"];
    
    _address = [decoder decodeObjectForKey:@"address"];
    
    return self;
}

@end
