//
//  TANativeController.m
//  TestAppVer3
//
//  Created by Дмитрий Багров on 06.10.13.
//  Copyright (c) 2013 Ramotion. All rights reserved.
//

#import "TANativeController.h"

@interface TANativeController () <TAModelDelegate>
{
}

@end

@implementation TANativeController

-(void)reloadCells
{
    //NSLog(@"i redisplay data");
    [self.tableView reloadData];
}

//---------------------------
// method for interaction with model
//---------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[TAModel modelObject] setDelegate:self];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //reload view - need to update after return
    [self reloadCells];
}

@end
