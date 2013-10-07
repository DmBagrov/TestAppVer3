//
//  TACustomCell.m
//  TestAppVer3
//
//  Created by Дмитрий Багров on 06.10.13.
//  Copyright (c) 2013 Ramotion. All rights reserved.
//

#import "TACustomCell.h"

@implementation TACustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andShot:(TAShot *)shot
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        tiedShot = shot;
        self.textLabel.text = [shot shotName];
        self.imageView.image = [shot shotImage];
        
        //add button
        favoriteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        favoriteButton.frame = CGRectMake(250.0, 5.0, 60.0, 60.0);
        [self addSubview:favoriteButton];
        //
        
        [self renderFavoriteStatus:[tiedShot isFavorite]];
        [favoriteButton addTarget:self action:@selector(favoriteButtonPressed:) forControlEvents:UIControlEventTouchDown];
    }
    return self;
}

-(IBAction)favoriteButtonPressed:(id)sender
{
    //delete image from favorite list
    if([tiedShot isFavorite])
    {
        [self renderFavoriteStatus:NO];
        tiedShot.isFavorite = NO;
    }
    else
    //add image to favorite list
    {
        [self renderFavoriteStatus:YES];
        tiedShot.isFavorite = YES;
    }
}

-(void)reloadCellImage
{
    //load image in different thread
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^
    {
        self.imageView.image = [tiedShot shotImage];
    });
    
    [self renderFavoriteStatus:[tiedShot isFavorite]];
}

-(void)renderFavoriteStatus:(BOOL)isFavorite
{
    if(isFavorite)
    {
        [favoriteButton setImage:[UIImage imageNamed:@"favorite.png"] forState:UIControlStateNormal];
    }
    else
    {
        [favoriteButton setImage:[UIImage imageNamed:@"unfavorite.png"] forState:UIControlStateNormal];
    }
}

-(void)dealloc
{
    [tiedShot release];
    [favoriteButton release];
    [super dealloc];
}

@end
