//
//  TAShot.h
//  TestAppVer3
//
//  Created by Дмитрий Багров on 06.10.13.
//  Copyright (c) 2013 Ramotion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TAShot : NSObject
{
    //NSString *shotName_;
    //UIImage *shotImage_;
}

@property(retain) NSString* shotName;
@property(retain) UIImage* shotImage;
@property BOOL isFavorite;

-(id) initShotWithName:(NSString*)shotInitName andImage:(UIImage*)shotInitImage;

//-(id)getShotLink;

-(void)reloadImage:(UIImage*)newImage;

@end
