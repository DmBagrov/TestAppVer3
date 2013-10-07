//
//  TAModel.h
//  TestAppVer3
//
//  Created by Дмитрий Багров on 06.10.13.
//  Copyright (c) 2013 Ramotion. All rights reserved.
//

#import <Foundation/Foundation.h>

//
#import "TAObjectManager.h"
#import "TAShot.h"

//for interaction with controllers
#import "TANativeController.h"

@class TAModel;
@protocol TAModelDelegate <NSObject>

@required
-(void)reloadCells;
@end

@interface TAModel : NSObject
{
    TAObjectManager *objManager;
}

@property (nonatomic, unsafe_unretained) id<TAModelDelegate> delegate;

+(TAModel*) modelObject;

//model methods for interaction with controllers
-(TAShot*)getShotByIndex:(NSInteger)index;
-(NSInteger)getCachedShotsCount;

-(TAShot*)getFavoriteShotByOrder:(NSInteger) order;
-(NSInteger)getFavoriteImageCount;

//model for interaction with Object manager
-(void)needToRedisplayData;

@end
