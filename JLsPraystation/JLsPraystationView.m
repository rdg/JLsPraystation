//
//  JLsPraystationView.m
//  JLsPraystation
//
//  Created by Georg Duemlein on 22/04/18.
//  Copyright © 2018 Georg Duemlein. All rights reserved.
//

#import "JLsPraystationView.h"
#import <BoxItem.h>

@implementation JLsPraystationView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        
        self.items =  [NSMutableArray arrayWithCapacity:10];
        float height = self.bounds.size.height * 0.5;
        for (int row=0; row < SSRandomIntBetween(7, 10); row++) {
            [self.items addObject: [BoxItem BoxItemWithHeight:height andY: self.bounds.size.height * 0.25 andSpace:self.bounds.size.width]];
        }
        self.outline = [[NSBezierPath alloc] init];
        [self.outline setLineWidth:1.0];
        CGFloat dash_pattern[]={5., 5.};
        [self.outline setLineDash:dash_pattern count:1 phase:1];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    
    [[NSColor blackColor] set];
    [[NSBezierPath bezierPathWithRect:[self bounds]] fill];
    CGRect rect = CGRectMake(0, self.bounds.size.height * 0.25, self.bounds.size.width, self.bounds.size.height * 0.5);
    [[NSColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1] set];
    [[NSBezierPath bezierPathWithRect:rect] fill];

    for (BoxItem *item in self.items) {
        [item step];
        [item draw];
    }

    [[NSColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1] set];
    [self.outline removeAllPoints];
    [self.outline moveToPoint:CGPointMake(0, self.bounds.size.height * 0.25)];
    [self.outline lineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height * 0.25)];
    [self.outline moveToPoint:CGPointMake(0, self.bounds.size.height * 0.75)];
    [self.outline lineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height * 0.75)];
    [self.outline stroke];

    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
