//
//  AddItemTableViewController.m
//  CheckLists
//
//  Created by Allen on 2019/2/15.
//  Copyright © 2019 Allen. All rights reserved.
//

#import "AddItemTableViewController.h"
#import "ChecklistItem.h"

@interface AddItemTableViewController ()

@end

@implementation AddItemTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.itemToEdit != nil){
        self.title = @"Edit Item";
        self.textField.text = self.itemToEdit.text;
        self.doneBarButton.enabled = YES;
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
//viewWillAppear⽅法是iOS所提供的视图控制器方法，其作⽤是当界⾯跳转到当前界⾯但还没有显示出其中的内容时执⾏一些任务
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];//成为当前的控制焦点（第一响应者）。
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;//禁止选中某一行，防止选中行变灰
}


- (IBAction)cancel:(id)sender {
    [self.delegate addItemViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
    if(self.itemToEdit == nil){
        ChecklistItem *item = [[ChecklistItem alloc] init];
        item.text = self.textField.text;
        item.checked = NO;
        [self.delegate addItemViewController:self didFinishAddingItem:item];
    }
    else{
        self.itemToEdit.text = self.textField.text;
        [self.delegate addItemViewController:self didFinishEditingItem:self.itemToEdit];
    }
    
}

- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newText = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
    if([newText length]>0){
        self.doneBarButton.enabled = YES;
    }
    else{
        self.doneBarButton.enabled = NO;
    }
    return YES;
}

@end
