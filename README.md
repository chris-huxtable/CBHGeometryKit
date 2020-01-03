# CBHGeometryKit

[![release](https://img.shields.io/github/release/chris-huxtable/CBHGeometryKit.svg)](https://github.com/chris-huxtable/CBHGeometryKit/releases)
[![pod](https://img.shields.io/cocoapods/v/CBHGeometryKit.svg)](https://cocoapods.org/pods/CBHGeometryKit)
[![licence](https://img.shields.io/badge/licence-ISC-lightgrey.svg?cacheSeconds=2592000)](https://github.com/chris-huxtable/CBHGeometryKit/blob/master/LICENSE)
[![coverage](https://img.shields.io/badge/coverage-100%25-brightgreen.svg?cacheSeconds=2592000)](https://github.com/chris-huxtable/CBHGeometryKit)

`CBHGeometryKit` provides a consistent interface for dealing with Foundation geometry types and expands on existing functions to make a number of other operations easier.

Specifically it provides functions for:
- `NSPoint`
- `NSSize`
- `NSRect`
- `NSRange`


## `NSPoint`
```objective-c
#pragma mark - Creating Points

NSPoint NSPoint_init(CGFloat x, CGFloat y);
NSPoint NSPoint_initWithString(NSString *string);
NSPoint NSPoint_initZero(void);


#pragma mark - Checking Points

BOOL NSPoint_isEqual(NSPoint point, NSPoint other);


#pragma mark - Derived Points

NSPoint NSPoint_truncate(NSPoint point);
NSPoint NSPoint_round(NSPoint point);

NSPoint NSPoint_shift(NSPoint point, NSPoint delta);
NSPoint NSPoint_shiftParametric(NSPoint point, CGFloat dX, CGFloat dY);

NSPoint NSPoint_nearestPixel(NSPoint point);


#pragma mark - Distance

CGFloat NSPoint_distance(NSPoint start, NSPoint end);
CGFloat NSPoint_distanceSquared(NSPoint start, NSPoint end);


#pragma mark - Description

NSString *NSPoint_description(NSPoint point);
```


## `NSSize`
```objective-c
#pragma mark - Creating Sizes

NSSize NSSize_init(CGFloat width, CGFloat height);
NSSize NSSize_initWithString(NSString *string);
NSSize NSSize_initEmpty(void);


#pragma mark - Checking Sizes

BOOL NSSize_isEmpty(NSSize size);
BOOL NSSize_isNegative(NSSize size);
BOOL NSSize_isEqual(NSSize size, NSSize other);


#pragma mark - Derived Sizes

NSSize NSSize_truncate(NSSize size);
NSSize NSSize_round(NSSize size);
NSSize NSSize_absolute(NSSize size);

NSSize NSSize_scale(NSSize size, NSSize delta);
NSSize NSSize_scaleParametric(NSSize size, CGFloat dWidth, CGFloat dHeight);


#pragma mark - Description

NSString *NSSize_description(NSSize size);
```


## `NSRect`
```objective-c
#pragma mark - Creating Rects

NSRect NSRect_init(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
NSRect NSRect_initWithStructs(NSPoint origin, NSSize size);
NSRect NSRect_initWithSize(NSSize size);
NSRect NSRect_initWithString(NSString *string);
NSRect NSRect_initEmpty(void);


#pragma mark - Checking Rects

BOOL NSRect_isEmpty(NSRect rect);
BOOL NSRect_isNegative(NSRect rect);
BOOL NSRect_isEqual(NSRect rect, NSRect other);

BOOL NSRect_isCovering(NSRect rect, NSRect other);
BOOL NSRect_isIntersecting(NSRect rect, NSRect other);

BOOL NSRect_isPointInRect(NSRect rect, NSPoint point);
BOOL NSRect_isMouseInRect(NSRect rect, NSPoint point, BOOL flipped);


#pragma mark - Derived Rects

NSRect NSRect_inset(NSRect rect, CGFloat dX, CGFloat dY);
NSRect NSRect_offset(NSRect rect, CGFloat dX, CGFloat dY);

NSRect NSRect_integral(NSRect rect);
NSRect NSRect_truncate(NSRect rect);
NSRect NSRect_round(NSRect rect);
NSRect NSRect_absolute(NSRect rect);

NSRect NSRect_alignWithPixels(NSRect rect);

NSRect NSRect_intersection(NSRect rect, NSRect other);
NSRect NSRect_union(NSRect rect, NSRect other);

NSRect NSRect_centeredInRect(NSRect rect, NSRect inRect);


#pragma mark - Derived Points

NSPoint NSRect_minPoint(NSRect rect);
NSPoint NSRect_midPoint(NSRect rect);
NSPoint NSRect_maxPoint(NSRect rect);


#pragma mark - Calculated Properties

CGFloat NSRect_maxX(NSRect rect);
CGFloat NSRect_maxY(NSRect rect);

CGFloat NSRect_midX(NSRect rect);
CGFloat NSRect_midY(NSRect rect);

CGFloat NSRect_minX(NSRect rect);
CGFloat NSRect_minY(NSRect rect);


#pragma mark - Description

NSString *NSRect_description(NSRect rect);
```


## `NSRange`
```objective-c
#pragma mark - Creating Ranges

NSRange NSRange_init(NSUInteger location, NSUInteger length);
NSRange NSRange_initFromTo(NSUInteger from, NSUInteger to);
NSRange NSRange_initWithString(NSString *string);
NSRange NSRange_initEmpty();


#pragma mark - Checking Range

BOOL NSRange_isEmpty(NSRange range);
BOOL NSRange_isEqual(NSRange range, NSRange other);
BOOL NSRange_isLocationInRange(NSRange range, NSUInteger location);


#pragma mark - Derived Ranges

NSRange NSRange_intersection(NSRange range, NSRange other);
NSRange NSRange_union(NSRange range, NSRange other);


#pragma mark - Calculated Properties

NSUInteger NSRange_max(NSRange range);
NSUInteger NSRange_locationAtOffset(NSRange range, NSUInteger offset);


#pragma mark - Description

NSString *NSRange_description(NSRange range);
```


## Licence
CBHGeometryKit is available under the [ISC license](https://github.com/chris-huxtable/CBHGeometryKit/blob/master/LICENSE).
