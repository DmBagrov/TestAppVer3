//
//  TAModel.m
//  TestAppVer3
//
//  Created by Дмитрий Багров on 06.10.13.
//  Copyright (c) 2013 Ramotion. All rights reserved.
//

#import "TAModel.h"

@implementation TAModel

static TAModel *modelObject_ = nil;

//singleton pattern
+(TAModel*)modelObject
{
    @synchronized(self)
    {
        if(modelObject_ == nil)
        {
            modelObject_ = [NSAllocateObject([self class], 0, NULL) init];
        }
    }
    return modelObject_;
}

-(id)init
{
    self = [super init];
    
    //save link
    modelObject_ = self;
    
    //create data manager
    dispatch_async(dispatch_get_global_queue(0, 0), ^
    {
        objManager = [[TAObjectManager alloc] init];
        //start Load objects
        [objManager startLoadObjects];
        //
    });
    
    return self;
}

//----------------------------

+(id) allocWithZone:(NSZone *)zone
{
    return [[self modelObject] retain];
}

/*
-(id) copyWithZone:(NSZone*)zone
{
    return self;
}

-(id)retain
{
    return self;
}

-(NSUInteger) retainCount
{
    return NSUIntegerMax;
}

-(id)autorelease
{
    return self;
}
*/
//---------------------------
//model methods for interaction with controller
//----------------------------

-(NSInteger)getCachedShotsCount
{
    return [objManager getCachedShotsCount];
}

-(TAShot*)getShotByIndex:(NSInteger)index
{
    return [objManager getCachedShotByIndex:index];
}

//----------------------------

-(NSInteger)getFavoriteImageCount
{
    return [objManager getFavoriteImageCount];
}

-(TAShot*)getFavoriteShotByOrder:(NSInteger)order
{
    return [objManager getFavoriteShotByOrder:order];
}

//----------------------------
//model methods for interaction with object manager
//----------------------------


-(void)needToRedisplayData
{
    [_delegate reloadCells];
}

-(void)dealloc
{
    [objManager release];
    [super dealloc];
}



@end
