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
        shotName = [[NSString alloc] initWithString:shotInitName];
        shotImage = [[UIImage alloc] initWithCGImage:shotImage.CGImage];
        isFavorite = NO;
    }
    
    return self;
}

-(void)reloadImage:(UIImage *)newImage
{
    //release old image
    [shotImage release];
    shotImage = [[UIImage alloc] initWithCGImage:newImage.CGImage];;
}

-(void)dealloc
{
    [shotName release];
    [shotImage release];
    [super dealloc];
}

@end
