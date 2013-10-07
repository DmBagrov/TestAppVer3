//
//  TACustomCell.h
//  TestAppVer3
//
//  Created by Дмитрий Багров on 06.10.13.
//  Copyright (c) 2013 Ramotion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAShot.h"

@interface TACustomCell : UITableViewCell
{
    TAShot *tiedShot;
    UIButton *favoriteButton;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andShot:(TAShot*)shot;

- (void)reloadCellImage;

@end
