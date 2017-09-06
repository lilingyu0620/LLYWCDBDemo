    //
//  LLYModel+WCTColumnCoding.mm
//  LLYWCDBDemo
//
//  Created by lly on 2017/9/6.
//  Copyright © 2017年 lly. All rights reserved.
//

#import "LLYModel.h"
#import <Foundation/Foundation.h>
#import <WCDB/WCDB.h>

@interface LLYModel (WCTColumnCoding) <WCTColumnCoding>
@end

@implementation LLYModel (WCTColumnCoding)

+ (instancetype)unarchiveWithWCTValue:(NSData *)value
{
    return value?[NSKeyedUnarchiver unarchiveObjectWithData:value]:nil;
}

- (NSData *)archivedWCTValue
{
    return [NSKeyedArchiver archivedDataWithRootObject:self];
}

+ (WCTColumnType)columnTypeForWCDB
{
    return WCTColumnTypeBinary;
}

@end
