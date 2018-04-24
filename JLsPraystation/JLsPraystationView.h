//
//  JLsPraystationView.h
//  JLsPraystation
//
//  Created by Georg Duemlein on 22/04/18.
//  Copyright © 2018 Georg Duemlein. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>
#import <BoxItem.h>

@interface JLsPraystationView : ScreenSaverView

@property (nonatomic, retain) NSBezierPath *outline;
@property (nonatomic, strong) NSMutableArray *items;

@end
