//
//  ItemDetailTableViewController.h
//  CheckLists
//
//  Created by Allen on 2019/2/15.
//  Copyright © 2019 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemDetailViewController;
@class ChecklistItem;

@protocol ItemDetailViewControllerDelegate<NSObject>
- (void)itemDetailViewControllerDidCancel:(ItemDetailViewController *)controller;
- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem *)item;
- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *)item;
@end

@interface ItemDetailViewController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) id<ItemDetailViewControllerDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) ChecklistItem *itemToEdit;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
