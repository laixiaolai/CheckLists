//
//  AddItemTableViewController.h
//  CheckLists
//
//  Created by Allen on 2019/2/15.
//  Copyright © 2019 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddItemTableViewController;
@class ChecklistItem;

@protocol AddItemTableViewControllerDelegate<NSObject>
- (void)addItemViewControllerDidCancel:(AddItemTableViewController *)controller;
- (void)addItemViewController:(AddItemTableViewController *)controller didFinishAddingItem:(ChecklistItem *)item;
- (void)addItemViewController:(AddItemTableViewController *)controller didFinishEditingItem:(ChecklistItem *)item;
@end

@interface AddItemTableViewController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) id<AddItemTableViewControllerDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) ChecklistItem *itemToEdit;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
