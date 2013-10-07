//
//  TASecondViewController.m
//  TestAppVer3
//
//  Created by Дмитрий Багров on 06.10.13.
//  Copyright (c) 2013 Ramotion. All rights reserved.
//

#import "TAFavoriteViewController.h"

@interface TAFavoriteViewController ()

@end

@implementation TAFavoriteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Favorite", @"Favorite");
        self.tabBarItem.image = [UIImage imageNamed:@"favorite"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[TAModel modelObject] getFavoriteImageCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = [NSString stringWithFormat:@"%d",indexPath.row];
    //static NSString *cellIdent = @"cellIdent";
    
    TACustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    TAShot *newLoadedShot = [[TAModel modelObject] getFavoriteShotByOrder:indexPath.row];
    
    if(cell != nil){
       [cell release];
    }
        cell = [[TACustomCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:cellID andShot:newLoadedShot];
    /*} else
       // {
          //  [cell reloadCellImage];
        }
     */
    
    NSLog(@"%d",indexPath.row);
    
    return cell;
}




@end
