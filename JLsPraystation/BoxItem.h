//
//  BoxItem.h
//  JLsPraystation
//
//  Created by Georg Duemlein on 14/04/18.
//  Copyright © 2018 Georg Duemlein. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/Appkit.h>

@interface BoxItem : NSObject

@property (assign) float width;
@property (assign) float height;
@property (assign) int space;
@property (assign) float posX;
@property (assign) float posY;
@property (assign) float speed;
@property (assign) int direction;

@property (nonatomic, retain) NSMutableArray *colors;
@property (nonatomic, strong) NSColor *color;
@property (nonatomic, retain) NSBezierPath *shape;
@property (nonatomic, retain) NSBezierPath *outline;
@property (nonatomic, assign) NSSize *size;

+ (instancetype) BoxItemWithHeight:(float)height andY:(int)y andSpace:(int)space;
- (id) initWithHeight:(float)height andY:(int)y andSpace:(int)space;

- (void) step;
- (void) draw;

@end
