# BCBlurView

BCBlurView is a category on UIView that adds the functionality to render whatever is behind the UIView and add a blur filter to it.
In addition to that there is a BCBVView and a BCBVButton provided that make use of this category for easier access to the blur method.


## Requirements

BCBlurView is build for use with ARC environment.
It's build for use with iOS6 or later. It may run on earlier os versions but it is untested.


## Dependencies

To use BCBlurView you need to link the following frameworks:
- UIKit
- QuartzCore
- CoreImage


## Install

Add the BCBlurView project to your project and set the header search path to the path that contains the BCBlurView project folder.
Add BCBlurView as a target dependency and in the linker phase.
Make sure to set the -ObjC linker flag in your build settings.
See BCBlurViewDemo target for a reference, if you have problems, linking the library.


## Licence

Copyright 2013 bitecode, Michael Ochs

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
