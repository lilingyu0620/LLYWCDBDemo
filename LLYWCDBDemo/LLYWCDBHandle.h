//
//  LLYWCDBHandle.h
//  LLYWCDBDemo
//
//  Created by lly on 2017/9/5.
//  Copyright © 2017年 lly. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <WCDB/WCDB.h>

@class LLYModel;

@interface LLYWCDBHandle : NSObject

- (bool)createTable:(NSString *)tableName class:(Class)mClass;
- (bool)insertModel:(id)model tableName:(NSString *)tableName;
- (bool)deleteModel:(NSString *)tableName where:(const WCTCondition &)condition;
- (BOOL)updateModel:(id)model tableName:(NSString *)tableName onProperties:(const WCTPropertyList &)propertyList;
- (NSArray <id> *)searchFromTabel:(NSString *)tableName class:(Class)mClass;

@end
