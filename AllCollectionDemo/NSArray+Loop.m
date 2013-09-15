//
//  NSArray+Loop.m
//  AllCollectionDemo
//
//  Created by iOS17 on 9/14/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "NSArray+Loop.h"

@implementation NSArray (Loop)

- (void) loopArr
{
    for (NSString *loop in self) {
        NSLog(@"%@ lenght %d",loop,loop.length);
    }
}

@end
