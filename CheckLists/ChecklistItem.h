//
//  ChecklistItem.h
//  CheckLists
//
//  Created by Allen on 2019/2/14.
//  Copyright © 2019 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChecklistItem : NSObject<NSCoding>

@property(nonatomic,copy)NSString *text;
@property(nonatomic,assign)BOOL checked;
- (void)toggleChecked;

@end
