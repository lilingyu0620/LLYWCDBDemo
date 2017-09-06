//
//  LLYFamily+WCTTableCoding.h
//  LLYWCDBDemo
//
//  Created by lly on 2017/9/6.
//  Copyright © 2017年 lly. All rights reserved.
//

#import "LLYFamily.h"
#import <WCDB/WCDB.h>

@interface LLYFamily (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(memOne)
WCDB_PROPERTY(memTwo)
WCDB_PROPERTY(memThree)
WCDB_PROPERTY(fId)

@end
