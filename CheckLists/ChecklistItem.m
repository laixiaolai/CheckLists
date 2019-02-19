//
//  ChecklistItem.m
//  CheckLists
//
//  Created by Allen on 2019/2/14.
//  Copyright © 2019 Allen. All rights reserved.
//

#import "ChecklistItem.h"

@implementation ChecklistItem

- (void)toggleChecked{
    self.checked=!self.checked;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.text forKey:@"Text"];
    [aCoder encodeBool:self.checked forKey:@"Checked"];
}

@end
