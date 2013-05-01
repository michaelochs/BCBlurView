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

#import "ViewController.h"

#import <QuartzCore/QuartzCore.h>
#import <BCBlurView/BCBlurView.h>


@interface ViewController ()

@property (nonatomic, weak, readwrite) IBOutlet BCBVView* blurView;
@property (nonatomic, weak, readwrite) IBOutlet BCBVButton* buttonGloss;
@property (nonatomic, weak, readwrite) IBOutlet BCBVButton* buttonStandard;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.blurView.blurRadius = 2.0f;
	self.blurView.layer.borderColor = [[UIColor redColor] CGColor];
	self.blurView.layer.borderWidth = 1.0f;
	
	self.buttonGloss.blurRadius = 2.0f;
	self.buttonGloss.cornerRadius = 10.0f;
	
	self.buttonStandard.blurRadius = 3.0f;
	self.buttonStandard.cornerRadius = 10.0f;
	self.buttonStandard.borderColor = [UIColor whiteColor];
}

@end
