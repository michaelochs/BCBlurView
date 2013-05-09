//
//  UIView+BCBlurView.m
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

#import "UIView+BCBlurView.h"

#import <QuartzCore/QuartzCore.h>


@implementation UIView (BCBlurView)

- (void)drawBluredBackground:(CGFloat)blurRadius inRect:(CGRect)rect
{
	if (blurRadius == 0.0f || self.hidden) { // not visible anyway! We don't need to make the expensive drawing
		return;
	}
	
#ifdef DEBUG
	clock_t time = clock();
#endif
	
	// render the background we want to blur
	self.hidden = YES; // make the button itself invisible as it should not be rendered!
	
	// walk up the view hierarchy to find the first view that is opaque
	UIView* viewToRender = self.superview;
	while (!viewToRender.opaque) {
		if (viewToRender.superview) {
			viewToRender = viewToRender.superview;
		} else {
			break; // maybe the window isn't set opaque!
		}
	}
	
	CGRect renderRect = [viewToRender convertRect:rect fromView:self];
	
	UIGraphicsBeginImageContext(rect.size);
	
	CGContextTranslateCTM(UIGraphicsGetCurrentContext(), -CGRectGetMinX(renderRect), CGRectGetMaxY(renderRect));
	CGContextScaleCTM(UIGraphicsGetCurrentContext(), 1.0f, -1.0f);
	
	[viewToRender.layer renderInContext:UIGraphicsGetCurrentContext()];
	
	CGImageRef blurInputReference = [UIGraphicsGetImageFromCurrentImageContext() CGImage];
	
	UIGraphicsEndImageContext();
	
	self.hidden = NO; // make the button itself visible again for display!
	
	// blur the rendered background
	CIImage* inputImage = [CIImage imageWithCGImage:blurInputReference];
	CIFilter* blur = [CIFilter filterWithName:@"CIGaussianBlur"];
	[blur setDefaults];
	[blur setValue:@(blurRadius) forKey:@"inputRadius"];
	[blur setValue:inputImage forKey:@"inputImage"];
	
	CIImage* outputImage = [blur outputImage];
	CIContext* context = [CIContext contextWithOptions:nil];
	CGImageRef blurOutput = [context createCGImage:outputImage fromRect:outputImage.extent];
	
	// render the blured background - note we need to use the extent of the output image, as it is larger as the original rect!
	CGContextDrawImage(UIGraphicsGetCurrentContext(), outputImage.extent, blurOutput);
	
	CGImageRelease(blurOutput);
	
#ifdef DEBUG
	clock_t duration = clock() - time;
	NSLog(@"Glossy drawing took %lu ticks (%f seconds)", duration, ((float)duration)/CLOCKS_PER_SEC);
#endif
}

@end
