//
//  searchresult.m
//  Findtable
//
//  Created by svp on 4/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "searchresult.h"
#import "ViewController.h"

static NSMutableArray* arr;
@implementation searchresult

+ (NSArray *)array
{
    if (!arr)
        arr = [[NSMutableArray alloc] init];
    
    return arr;
}

@synthesize name1, venuetype, comments, img, btn1,btn2;
@synthesize tagVal;

-(IBAction)checkbox : (id) sender 
{
    NSLog(@"%d",tagVal);
	btn1.hidden = NO;
	btn2.hidden = YES;
    
}

-(IBAction)uncheck :(id)sender
{
    NSLog(@"%d,%d",btn1.hidden,btn2.hidden);
    
    NSLog(@"%d",tagVal);
    UIButton *button = sender;

    btn1.hidden = YES;
	btn2.hidden = NO;
	value = @"no value";

    UITableView *table = [ViewController returnTable];
    NSLog(@"%f",table.frame.size.width);
    UITableViewCell *cell = (UITableViewCell*)button.superview.superview;
    NSIndexPath *indexPath = [table indexPathForCell:cell];

    [[table delegate] tableView:table didSelectRowAtIndexPath:indexPath];
    		
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


@end
