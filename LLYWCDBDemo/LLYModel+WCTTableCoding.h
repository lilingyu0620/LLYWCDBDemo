//
//  LLYModel+WCTTableCoding.h
//  LLYWCDBDemo
//
//  Created by lly on 2017/9/5.
//  Copyright © 2017年 lly. All rights reserved.
//

#import "LLYModel.h"
#import <WCDB/WCDB.h>

@interface LLYModel (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(userId)
WCDB_PROPERTY(name)
WCDB_PROPERTY(age)
WCDB_PROPERTY(job)
WCDB_PROPERTY(address)

@end
