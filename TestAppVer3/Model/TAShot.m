//
//  TAShot.m
//  TestAppVer3
//
//  Created by Дмитрий Багров on 06.10.13.
//  Copyright (c) 2013 Ramotion. All rights reserved.
//

#import "TAShot.h"

@implementation TAShot

@synthesize shotName, shotImage, isFavorite;

-(id)initShotWithName:(NSString *)shotInitName andImage:(UIImage *)shotInitImage
{
    if(self = [super init])
    {
        //rework!!!!
        shotName = [shotInitName copy];
        shotImage = shotInitImage;
        isFavorite = NO;
    }
    
    return self;
}

-(void)reloadImage:(UIImage *)newImage
{
    //rework!!!
    shotImage = [newImage retain];
}

-(void)dealloc
{
    [shotName release];
    [shotImage release];
    [super dealloc];
}

@end
