//
//  TAObjectManager.h
//  TestAppVer3
//
//  Created by Дмитрий Багров on 06.10.13.
//  Copyright (c) 2013 Ramotion. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TAShot.h"

//import for interaction with model
//#import "TAModel.h"

@interface TAObjectManager : NSObject
{
    //need use NSCache
    NSMutableArray *cacheForShots_;
}

//methods for interaction with model
-(void)startLoadObjects;

-(TAShot*)getCachedShotByIndex:(NSInteger)index;
-(NSInteger)getCachedShotsCount;

-(TAShot*)getFavoriteShotByOrder:(NSInteger)order;
-(NSInteger)getFavoriteImageCount;

//for favoritelist


@end
