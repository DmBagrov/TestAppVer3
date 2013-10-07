//
//  TAObjectManager.m
//  TestAppVer3
//
//  Created by Дмитрий Багров on 06.10.13.
//  Copyright (c) 2013 Ramotion. All rights reserved.
//
#import "TAModel.h"
#import "TAObjectManager.h"

#define imageCount 50

@implementation TAObjectManager

-(id)init
{
    if(self = [super init])
    {
        //init cache
        cacheForShots_ = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(UIImage*)loadingImage
{
    static UIImage *loadingImage = nil;
    
    if(!loadingImage)
        loadingImage = [UIImage imageNamed:@"loading.png"];
    
    return loadingImage;
}

-(void)startLoadObjects
{
    //load image in different dispatch
    
    for(int i=0; i < imageCount; i++){
        
        TAShot *newShot = [[TAShot alloc]
                            initShotWithName:[NSString stringWithFormat:@"foto%d.png",i]
                            andImage:[self loadingImage]];
            
        [cacheForShots_ addObject:newShot];
    }
    
    //start 
    [self overworkImage];
     
    //[[TAModel modelObject] needToRedisplayData];
}

//------------------------------------
// image processing methods (need rework)
//------------------------------------

-(void)overworkImage
{
    //load images parallel
    dispatch_apply(imageCount, dispatch_get_global_queue(0, 0), ^(size_t i)
    {
        CGSize newSize = CGSizeMake(250, 200);
        UIGraphicsBeginImageContext(newSize);
                       
        NSString *imageForResize = [NSString stringWithFormat:@"foto%zd",i];
        
        UIImage *newOverworkedImage = [UIImage imageNamed:imageForResize];
                       
        [newOverworkedImage drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
                       
        //reload image
        [[cacheForShots_ objectAtIndex:i] reloadImage:UIGraphicsGetImageFromCurrentImageContext()];
        
        //say model, what load new image
        //dispatch_sync(dispatch_get_global_queue(0, 0), ^
        dispatch_sync(dispatch_get_main_queue(), ^
        {
            //render on global or main dispatch?
            [[TAModel modelObject] needToRedisplayData];
        });

        UIGraphicsEndImageContext();
    });

}

//------------------------------------
// methods for interaction with model
//------------------------------------

-(TAShot*)getCachedShotByIndex:(NSInteger)index
{
    return [cacheForShots_ objectAtIndex:index];
}

-(NSInteger)getCachedShotsCount
{
    return [cacheForShots_ count];
}
//------------------------------------

-(TAShot*)getFavoriteShotByOrder:(NSInteger)order
{
    //TAShot *neededFavoriteShot;
    
    int findedFavoriteImageCounter = 0;
    
    for(int i = 0;i<[cacheForShots_ count];i++)
    {
        if([[cacheForShots_ objectAtIndex:i] isFavorite])
        {
            if (findedFavoriteImageCounter == order)
            {
                TAShot *findedShot = [cacheForShots_ objectAtIndex:i];
                return findedShot;
            }
            findedFavoriteImageCounter++;
        }
    }
    return nil;
}

-(NSInteger)getFavoriteImageCount
{
    //count favorite image async
    int favoriteImageCount = 0;
    
    //debug this thing
    for(int i=0; i<[cacheForShots_ count];i++)
    {
        if([[cacheForShots_ objectAtIndex:i] isFavorite])
        {
            favoriteImageCount ++;
        }
    }
    
    return favoriteImageCount;
}
//------------------------------------

-(void)dealloc
{
    [cacheForShots_ removeAllObjects];
    //[cacheForShots_ release];
    [super dealloc];
}

@end
