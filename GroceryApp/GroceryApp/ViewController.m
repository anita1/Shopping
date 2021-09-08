//
//  ViewController.m
//  GroceryApp
//
//  Created by DIVYA PRABHA on 16/08/12.
//  Copyright (c) 2012 divi12.prabha@gmail.com. All rights reserved.
//

#import "ViewController.h"
#import "searchresult.h"

@interface ViewController ()

@end

static NSMutableArray *itemArray;
static NSMutableArray *selectedItems;
//static NSMutableArray *indexArray;
static  UITableView *itemList;
static BOOL isChoice;

static NSMutableArray *copyIndex;

@implementation ViewController

+(UITableView*)returnTable
{
    NSLog(@"table:%f",itemList.frame.size.width);
    return itemList;
}

//+(void)addArray:(NSMutableArray*)arr
//{
//    indexArray = arr;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    indexArray = [[NSMutableArray alloc]init];
    selectedItems = [[NSMutableArray alloc]init];
    
    copyIndex = [[NSMutableArray alloc]init];
    
    item.delegate =self;
    //itemList.editing = YES;
    itemList = [[UITableView alloc]initWithFrame:CGRectMake(10, 126, 300, 319)];
    [self.view addSubview:itemList];
    
    itemList.dataSource = self;
    itemList.delegate = self;
    itemArray = [[NSMutableArray alloc]init];
   
	// Do any additional setup after loading the view, typically from a nib.
}


-(IBAction)addItem:(id)sender
{
    NSLog(@"%@",item.text);
    
    if (item.text.length == 0) {
        UIAlertView *newAlert = [[UIAlertView alloc]initWithTitle:@"Add Item" message:@"Enter an item" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [newAlert show];
    }
    
    else if ([itemArray containsObject:item.text])
    {
        UIAlertView *dupAlert = [[UIAlertView alloc]initWithTitle:@"Duplicate item" message:@"Item already added to the list" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [dupAlert show];
    }
    
    else {
        NSLog(@"item:%@",item.text);
        [itemArray addObject:item.text];
        
        [itemList reloadData];

    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [item resignFirstResponder];
    return YES;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [itemArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    static NSString *simpleTableIdentifier = @"Cell";
    [searchresult array];
    searchresult *cell = (searchresult *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"searchresult" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    } 

    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cell.tagVal = indexPath.row;
    cell.name1.text = [itemArray objectAtIndex:indexPath.row];
    
    item.text = @"";

    if (selectedItems.count>0) {
        
        NSLog(@"%d",selectedItems.count);
        NSLog(@"%d",indexPath.row);
        
        for (int i=0; i<selectedItems.count; i++) {
                NSString *str = [selectedItems objectAtIndex:i];
                if (isChoice == YES && [[itemArray objectAtIndex:indexPath.row]isEqualToString:str]) {
                    cell.btn2.hidden = NO;
        }
        
        }
        
        if (selectedItems.count == itemArray.count && indexPath.row ==itemArray.count-1) {
            alert = [[UIAlertView alloc]initWithTitle:@"Item List Purchased" message:@"All items in the list are purchased.Do you want to delete the list?" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel",nil];
            
            if(!alert.visible)
            {
                [alert show];
            }
            
        }
        

    }
    NSLog(@"%d",indexPath.row);
    
               
    return cell;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView == alert) {
        if (buttonIndex == 0)
        {
            itemArray = [[NSMutableArray alloc]init];
            selectedItems = [[NSMutableArray alloc]init];
            [itemList reloadData];
        }
        else if (buttonIndex == 1)
        {
            NSLog(@"cancel");
        }

    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![selectedItems containsObject:[itemArray objectAtIndex:indexPath.row]]) {
        [selectedItems addObject:[itemArray objectAtIndex:indexPath.row]];
        
    }
    
    else {
        [selectedItems removeObject:[itemArray objectAtIndex:indexPath.row]];
    }         
        [indexArray addObject:indexPath];
    
        [self tableView:itemList moveRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:1] toIndexPath:[NSIndexPath indexPathForRow:itemArray.count-1 inSection:1]];
    
    
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath 
{

    NSLog(@"move from:%d to:%d", fromIndexPath.row, toIndexPath.row);
    // fetch the object at the row being moved
    NSString *r = [itemArray objectAtIndex:fromIndexPath.row]; 
    
    // checks to make sure we add and remove the right rows
    if (fromIndexPath.row > toIndexPath.row) {
        
        // insert the object at the target row
        [itemArray insertObject:r atIndex:toIndexPath.row];
        
        // remove the original from the data structure
        [itemArray removeObjectAtIndex:(fromIndexPath.row + 1)];
    }
    else if (fromIndexPath.row < toIndexPath.row) {
        
        // insert the object at the target row
        [itemArray insertObject:r atIndex:(toIndexPath.row + 1)];
        
        // remove the original from the data structure
        [itemArray removeObjectAtIndex:(fromIndexPath.row)];
        
    }
    NSLog(@"item:%@",itemArray);
    isChoice = YES;
    cellIndex = toIndexPath.row;
    [itemList reloadData];
}


- (BOOL)tableView:(UITableView *)tableView 
canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
