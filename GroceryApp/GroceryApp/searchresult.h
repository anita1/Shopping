//
//  searchresult.h
//  Findtable
//
//  Created by svp on 4/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface searchresult : UITableViewCell 
{
	IBOutlet UIImageView *img;
	IBOutlet UILabel *name1;
	IBOutlet UILabel *venuetype;
	IBOutlet UILabel *comments;
	IBOutlet UIButton *btn1;
	IBOutlet UIButton *btn2;
	NSMutableArray *indexarr;
	NSString *value;
    
	
}



@property (nonatomic, retain)IBOutlet UIImageView *img;
@property (nonatomic, retain)IBOutlet UILabel *name1;
@property (nonatomic, retain)IBOutlet UILabel *venuetype;
@property (nonatomic, retain)IBOutlet UILabel *comments;
@property (nonatomic, retain)IBOutlet UIButton *btn1;
@property (nonatomic, retain)IBOutlet UIButton *btn2;
@property int tagVal;

+ (NSArray *)array;

-(IBAction)checkbox: (id) sender;
-(IBAction)uncheck:(id)sender;

@end
