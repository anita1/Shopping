//
//  ViewController.h
//  GroceryApp
//
//  Created by DIVYA PRABHA on 16/08/12.
//  Copyright (c) 2012 divi12.prabha@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    IBOutlet UITextField *item;
    int indexVal;
    int cellIndex;
    UIAlertView *alert;
    NSMutableArray *indexArray;
    //    UITableViewCell *cell;
}

+(NSMutableArray*)addArray:(NSMutableArray*)arr;

//@property(retain,nonatomic) UITableView *itemList;

@end
