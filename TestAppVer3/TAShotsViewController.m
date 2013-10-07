//
//  TAFirstViewController.m
//  TestAppVer3
//
//  Created by Дмитрий Багров on 06.10.13.
//  Copyright (c) 2013 Ramotion. All rights reserved.
//

#import "TAShotsViewController.h"

@interface TAShotsViewController ()

@end

@implementation TAShotsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Shots", @"Shots");
        self.tabBarItem.image = [UIImage imageNamed:@"shots"];
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[TAModel modelObject] getCachedShotsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = [NSString stringWithFormat:@"%d",indexPath.row];
    //static NSString *cellID = @"cellIdent";
    
    //NSLog(cellID);
    TACustomCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    
    TAShot *newLoadedShot = (TAShot*)[[TAModel modelObject] getShotByIndex:indexPath.row];
    
    if(cell == nil) {
        cell = (TACustomCell*)[[TACustomCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:cellID andShot:newLoadedShot];
    } else
        {
            [cell reloadCellImage];
        }
    //NSLog(@"%d",indexPath.row);
    
    return cell;
}

							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
