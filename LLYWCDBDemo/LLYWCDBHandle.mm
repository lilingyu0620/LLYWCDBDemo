//
//  LLYWCDBHandle.m
//  LLYWCDBDemo
//
//  Created by lly on 2017/9/5.
//  Copyright © 2017年 lly. All rights reserved.
//

#import "LLYWCDBHandle.h"
#import "LLYModel.h"
#import "LLYModel+WCTTableCoding.h"

@interface LLYWCDBHandle ()

@property (nonatomic,strong) WCTDatabase *dataBase;

@end

@implementation LLYWCDBHandle

- (instancetype)init{

    self = [super init];
    if (self) {
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
        NSMutableString *documentsDirectory = [paths objectAtIndex:0];
        NSString *path =  [documentsDirectory stringByAppendingPathComponent:@"wcdb.sqlite"];
        
        _dataBase = [[WCTDatabase alloc]initWithPath:path];
    }
    
    return self;
}

- (bool)createTable:(NSString *)tableName class:(Class)mClass{

    return [self.dataBase createTableAndIndexesOfName:tableName withClass:mClass];
}

- (bool)insertModel:(id)model tableName:(NSString *)tableName{

    return [self.dataBase insertObject:model into:tableName];
}

- (bool)deleteModel:(NSString *)tableName where:(const WCTCondition &)condition{

    return [self.dataBase deleteObjectsFromTable:tableName where:condition];
}

- (BOOL)updateModel:(id)model tableName:(NSString *)tableName onProperties:(const WCTPropertyList &)propertyList{

    return [self.dataBase updateAllRowsInTable:tableName onProperties:propertyList withObject:model];
}

- (NSArray <id> *)searchFromTabel:(NSString *)tableName class:(Class)mClass{

    return [self.dataBase getAllObjectsOfClass:mClass fromTable:tableName];
    
//    WCTTable *table = [database getTableOfName:@"message"
//                                     withClass:Message.class];
//    //查询
//    //SELECT * FROM message ORDER BY localID
//    NSArray<Message *> *message = [table getObjectsOrderBy:Message.localID.order()];
}



@end
