//
//  BoxItem.m
//  JLsPraystation
//
//  Created by Georg Duemlein on 14/04/18.
//  Copyright © 2018 Georg Duemlein. All rights reserved.
//

#import "BoxItem.h"

@implementation BoxItem

+ (instancetype) BoxItemWithHeight:(float)height andY:(int)y andSpace:(int)space
{
    BoxItem *item = [[BoxItem alloc] initWithHeight:height andY:y andSpace:space];
    return item;
}

- (id) initWithHeight:(float)height andY:(int)y andSpace:(int)space
{
    self = [super init];
    if (self)
    {
        self.width = 50 + arc4random_uniform(50);
        self.height = height;
        self.space = space;
        self.posX = 55 + arc4random_uniform(space - 110);
        self.posY = y;
        self.speed = 2 + ((float)arc4random() / UINT32_MAX) * 2;
        
        if ((float)arc4random() / UINT32_MAX < 0.5)
        {
            self.direction = 1;
        }else{
            self.direction = -1;
        }
        self.colors = [NSMutableArray arrayWithCapacity:(4)];
        [self.colors addObject:[NSColor colorWithCalibratedRed:0
                                                         green:0
                                                          blue:0
                                                         alpha:0.7 + 0.3 * (float)arc4random() / UINT32_MAX]];
        [self.colors addObject:[NSColor colorWithCalibratedRed:1
                                                         green:1
                                                          blue:1
                                                         alpha:0.7 + 0.3 * (float)arc4random() / UINT32_MAX]];
        [self.colors addObject:[NSColor colorWithCalibratedRed:97.0 / 255.0
                                                         green:35.0 / 255.0
                                                          blue:159.0 / 255.0
                                                         alpha:0.7 + 0.3 * (float)arc4random() / UINT32_MAX]];
        
        [self.colors addObject:[NSColor colorWithCalibratedRed:240.0 / 255.0
                                                         green:78.0 / 255.0
                                                          blue:152.0 / 255.0
                                                         alpha:0.7 + 0.3 * (float)arc4random() / UINT32_MAX]];
        [self.colors addObject:[NSColor colorWithCalibratedRed:97.0 / 255.0
                                                         green:35.0 / 255.0
                                                          blue:159.0 / 255.0
                                                         alpha:0.7 + 0.3 * (float)arc4random() / UINT32_MAX]];
        
        [self.colors addObject:[NSColor colorWithCalibratedRed:240.0 / 255.0
                                                         green:78.0 / 255.0
                                                          blue:152.0 / 255.0
                                                         alpha:0.7 + 0.3 * (float)arc4random() / UINT32_MAX]];
        
        self.shape = [[NSBezierPath alloc] init];
        self.outline = [[NSBezierPath alloc] init];
        [self.outline setLineWidth:1.0];
        CGFloat dash_pattern[]={2 + arc4random_uniform(2), 1 + arc4random_uniform(2)};
        [self.outline setLineDash:dash_pattern count:1 phase:1];
        self.color =  [self.colors objectAtIndex:arc4random_uniform([self.colors count])];

    }
    return self;
}

-(void) step
{
    self.posX += self.speed * self.direction;
    
    if (self.posX + self.width > self.space || self.posX < 0) {
        self.direction *= -1;
        if (self.posX + self.width > self.space) {
            self.posX = self.space - self.width - 1;
        }else{
            self.posX = 1;
        }
    }
    
}

-(void) draw
{
    CGRect rect = CGRectMake(self.posX, self.posY, self.width, self.height);
    [self.color set];
    [[NSBezierPath bezierPathWithRect:rect] fill];
    
    [self.outline removeAllPoints];

    [self.outline moveToPoint:CGPointMake(self.posX, self.posY)];
    [self.outline lineToPoint:CGPointMake(self.posX, self.posY + self.height)];
    [self.outline moveToPoint:CGPointMake(self.posX + self.width, self.posY)];
    [self.outline lineToPoint:CGPointMake(self.posX + self.width, self.posY + self.height)];
    
    [[NSColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1] set];
    [self.outline stroke];
}
@end
