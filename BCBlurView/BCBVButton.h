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

@interface BCBVButton : UIButton

/**
 * The radius that should be taken into account for each pixel for bluring.
 *
 * The default value for the blurRadius is 1.0f
 *
 * @warning Increasing the blurRadius increases the calculation time dramatically! Keep it as low as possible!
 */
@property (nonatomic, assign, readwrite) CGFloat blurRadius UI_APPEARANCE_SELECTOR;

/**
 * The corner radius of the button.
 *
 * This property sets the cornerRadius of the button's layer and enables the maskToBounds property of the layer.
 * It is used to clip the corners of the blur effect. You should set this property to the value that matches your button images.
 * By default the value for the cornerRadius is not set. This results in an untouched cornerRadius and maskToBounds property of the underlying layer.
 */
@property (nonatomic, assign, readwrite) CGFloat cornerRadius UI_APPEARANCE_SELECTOR;

/**
 * The color of the button's border.
 *
 * This property sets the borderColor of the button's layer.
 * If not nil, the borderWidth of the layer is set to 1.0f or 0.0f otherwise.
 * By default, this value is not set. This results in the default behavior of the underlying layer.
 *
 * @note if this value has never been set, it might return a black UIColor which is not visible.
 * This is the result of the underlying layer behavior.
 */
@property (nonatomic, copy, readwrite) UIColor* borderColor UI_APPEARANCE_SELECTOR;

/**
 * Creates and returns a new instance of a BCBVButton.
 */
+ (instancetype)blurButton;

@end
