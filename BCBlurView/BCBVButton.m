//
//  BCCChartView.h
//  BCCharts
//
//	Copyright 2013 bitecode, Michael Ochs
//
//	Licensed under the Apache License, Version 2.0 (the "License");
//	you may not use this file except in compliance with the License.
//	You may obtain a copy of the License at
//
//	http://www.apache.org/licenses/LICENSE-2.0
//
//	Unless required by applicable law or agreed to in writing, software
//	distributed under the License is distributed on an "AS IS" BASIS,
//	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//	See the License for the specific language governing permissions and
//	limitations under the License.
//

#import "BCBVButton.h"

#import <QuartzCore/QuartzCore.h>
#import "UIView+BCBlurView.h"


@implementation BCBVButton

@dynamic cornerRadius;
@dynamic borderColor;

+ (instancetype)blurButton
{
	return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		_blurRadius = 1.0f;
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		_blurRadius = 1.0f;
	}
	return self;
}



#pragma mark - drawing

- (void)drawRect:(CGRect)rect
{
	[self drawBluredBackground:self.blurRadius inRect:rect];
}



#pragma mark - custom getter / setter

- (void)setBlurRadius:(CGFloat)blurRadius
{
	_blurRadius = blurRadius;
	[self setNeedsDisplay];
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
	self.layer.cornerRadius = cornerRadius;
	self.layer.masksToBounds = YES;
}

- (CGFloat)cornerRadius
{
	return self.layer.cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor
{
	self.layer.borderColor = [borderColor CGColor];
	self.layer.borderWidth = (borderColor ? 1.0f : 0.0f);
}

- (UIColor*)borderColor
{
	return (self.layer.borderWidth > 0.0f ? [UIColor colorWithCGColor:self.layer.borderColor] : nil);
}

@end
