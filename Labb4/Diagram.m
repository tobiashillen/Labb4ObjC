//
//  Diagram.m
//  Labb4
//
//  Created by Tobias Hillén on 2017-01-30.
//  Copyright © 2017 Tobias Hillén. All rights reserved.
//

#import "Diagram.h"

@implementation Diagram

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.bars = @[@{@"name": @"january",
                            @"value": @100},
                          @{@"name": @"february",
                            @"value": @80},
                            @{@"name": @"april",
                              @"value": @20}];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.bars = @[@{@"name": @"january",
                        @"value": @100},
                      @{@"name": @"february",
                        @"value": @80},
                      @{@"name": @"april",
                        @"value": @20}];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
    float maxValue = [[self.bars[0] valueForKey:@"value"] floatValue];
    float barGap = (rect.size.width / 4.0f) / self.bars.count;
    float barWidth = (rect.size.width / self.bars.count) - barGap;
    float startX = 10;
    
    for (int i = 0; i < self.bars.count; i++) {
        maxValue = MAX(maxValue, [[self.bars[i] valueForKey:@"value"] floatValue]);
    }
    
    
    float scaleValue = (rect.size.height / (maxValue + 40));
    
    for (int i = 0; i < self.bars.count; i++){
        NSNumber* barHeight = [self.bars[i] valueForKey:@"value"];
        UIBezierPath* square = [UIBezierPath bezierPathWithRect:CGRectMake
                                (startX,
                                 rect.size.height - ([barHeight floatValue] * scaleValue) - 20,
                                 barWidth,
                                 [barHeight floatValue] * scaleValue)];
        [[UIColor redColor] setStroke];
        [square stroke];
        startX += barGap + barWidth;
    }
    
}

@end
