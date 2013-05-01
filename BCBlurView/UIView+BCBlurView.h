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

#import <UIKit/UIKit.h>

@interface UIView (BCBlurView)

/**
 * Blurs and draws whatever is behind this view into the current graphics context
 *
 * @param blurRadius The radius that should be taken into account for each pixel for bluring.
 * @param rect The portion of the view’s bounds that needs to be updated. If you call this method in drawRect: you can simply pass its rect value.
 *
 * @warning Increasing the blurRadius increases the calculation time dramatically! Keep it as low as possible!
 */
- (void)drawBluredBackground:(CGFloat)blurRadius inRect:(CGRect)rect;

@end
