//  NSPoint+CBHGeometryKit.m
//  CBHGeometryKit
//
//  Created by Christian Huxtable <chris@huxtable.ca>, September 2018.
//  Copyright (c) 2018 Christian Huxtable. All rights reserved.
//
//  Permission to use, copy, modify, and/or distribute this software for any
//  purpose with or without fee is hereby granted, provided that the above
//  copyright notice and this permission notice appear in all copies.
//
//  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
//  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
//  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

#import "NSPoint+CBHGeometryKit.h"

#import "_CBHGeometryKit+Utilities.h"
#import <math.h>


#pragma mark - Creating Points

CBH_CONST NSPoint NSPoint_init(const CGFloat x, const CGFloat y)
{
	return (NSPoint){ .x = x, .y = y };
}

CBH_CONST NSPoint NSPoint_initWithString(NSString * const string)
{
	return NSPointFromString(string);
}

CBH_CONST NSPoint NSPoint_initZero(void)
{
	return (NSPoint){ .x = 0.0, .y = 0.0 };
}


#pragma mark - Checking Points

CBH_CONST BOOL NSPoint_isEqual(const NSPoint point, const NSPoint other)
{
	return ( (point.x == other.x) && (point.y == other.y) );
}


#pragma mark - Derived Points

CBH_CONST NSPoint NSPoint_truncate(const NSPoint point)
{
	NSPoint newPoint = point;

	newPoint.x = trunc(point.x);
	newPoint.y = trunc(point.y);

	return newPoint;
}

CBH_CONST NSPoint NSPoint_round(const NSPoint point)
{
	NSPoint newPoint = point;

	newPoint.x = round(point.x);
	newPoint.y = round(point.y);

	return newPoint;
}

CBH_CONST NSPoint NSPoint_shift(const NSPoint point, const NSPoint delta)
{
	return NSPoint_shiftParametric(point, delta.x, delta.y);
}

CBH_CONST NSPoint NSPoint_shiftParametric(const NSPoint point, const CGFloat x, const CGFloat y)
{
	NSPoint newPoint = point;
	
	newPoint.x += x;
	newPoint.y += y;

	return newPoint;
}

CBH_CONST NSPoint NSPoint_nearestPixel(const NSPoint point)
{
	NSPoint newPoint = point;

	newPoint.x = trunc(point.x) + 0.5;
	newPoint.y = trunc(point.y) + 0.5;

	return newPoint;
}


#pragma mark - Distance

CBH_CONST CGFloat NSPoint_distance(const NSPoint start, const NSPoint end)
{
#if CGFLOAT_IS_DOUBLE
	return (CGFloat)sqrt(NSPoint_distanceSquared(start, end));
#else
	return (CGFloat)sqrtf(NSPoint_distanceSquared(start, end));
#endif
}

CBH_CONST CGFloat NSPoint_distanceSquared(const NSPoint start, const NSPoint end)
{
	NSPoint newPoint = start;

	newPoint.x -= end.x;
	newPoint.y -= end.y;
	
	newPoint.x *= newPoint.x;
	newPoint.y *= newPoint.y;
	
	return newPoint.x + newPoint.y;
}


#pragma mark - Description

CBH_CONST NSString *NSPoint_description(const NSPoint point)
{
	return NSStringFromPoint(point);
}
