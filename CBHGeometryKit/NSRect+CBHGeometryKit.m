//  NSRect+CBHGeometryKit.m
//  CBHGeometryKit
//
//  Created by Christian Huxtable <chris@huxtable.ca>, January 2019.
//  Copyright (c) 2019 Christian Huxtable. All rights reserved.
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

#import "NSRect+CBHGeometryKit.h"

#import "_CBHGeometryKit+Utilities.h"

#import "NSPoint+CBHGeometryKit.h"
#import "NSSize+CBHGeometryKit.h"


#pragma mark - Creating Rects

CBH_CONST NSRect NSRect_init(const CGFloat x, const CGFloat y, const CGFloat width, const CGFloat height)
{
	return (NSRect){ (NSPoint){ .x = x, .y = y }, (NSSize){ .width = width, .height = height } };
}

CBH_CONST NSRect NSRect_initWithStructs(const NSPoint origin, const NSSize size)
{
	return (NSRect){origin, size};
}

CBH_CONST NSRect NSRect_initWithSize(const NSSize size)
{
	return (NSRect){ { .x = 0.0, .y = 0.0 }, size};
}

CBH_CONST NSRect NSRect_initWithString(NSString * const string)
{
	return NSRectFromString(string);
}

CBH_CONST NSRect NSRect_initEmpty(void)
{
	return (NSRect){ { .x = 0.0, .y = 0.0 }, { .width = 0.0, .height = 0.0 } };
}


#pragma mark - Checking Rects

CBH_CONST BOOL NSRect_isEmpty(const NSRect rect)
{
	return ( (rect.size.width <= 0.0) || (rect.size.height <= 0.0) );
}

CBH_CONST BOOL NSRect_isNegative(const NSRect rect)
{
	return ( (rect.size.width < 0.0) || (rect.size.height < 0.0) );
}

CBH_CONST BOOL NSRect_isEqual(const NSRect rect, const NSRect other)
{
	return NSEqualRects(rect, other);
}


CBH_CONST BOOL NSRect_isCovering(const NSRect rect, const NSRect other)
{
	return NSContainsRect(rect, other);
}

CBH_CONST BOOL NSRect_isIntersecting(const NSRect rect, const NSRect other)
{
	return NSIntersectsRect(rect, other);
}


CBH_CONST BOOL NSRect_isPointInRect(const NSRect rect, const NSPoint point)
{
	return NSPointInRect(point, rect);
}

CBH_CONST BOOL NSRect_isMouseInRect(const NSRect rect, const NSPoint point, const BOOL flipped)
{
	return NSMouseInRect(point, rect, flipped);
}


#pragma mark - Derived Rects

CBH_CONST NSRect NSRect_inset(const NSRect rect, const CGFloat dX, const CGFloat dY)
{
	return NSInsetRect(rect, dX, dY);
}

CBH_CONST NSRect NSRect_offset(const NSRect rect, const CGFloat dX, const CGFloat dY)
{
	return NSOffsetRect(rect, dX, dY);
}


CBH_CONST NSRect NSRect_integral(const NSRect rect)
{
	return NSIntegralRect(rect);
}

CBH_CONST NSRect NSRect_truncate(const NSRect rect)
{
	NSRect newRect;

	newRect.origin = NSPoint_truncate(rect.origin);
	newRect.size = NSSize_truncate(rect.size);

	return newRect;
}

CBH_CONST NSRect NSRect_round(const NSRect rect)
{
	NSRect newRect;

	newRect.origin = NSPoint_round(rect.origin);
	newRect.size = NSSize_round(rect.size);

	return newRect;
}

CBH_CONST NSRect NSRect_absolute(const NSRect rect)
{
	if ( !NSRect_isNegative(rect) ) { return rect; }

	NSRect newRect = rect;

	newRect.origin = NSRect_minPoint(rect);
	newRect.size = NSSize_absolute(rect.size);

	return newRect;
}


CBH_CONST NSRect NSRect_alignWithPixels(const NSRect rect)
{
	NSRect newRect;

	newRect.origin = NSPoint_nearestPixel(rect.origin);
	newRect.size = NSSize_truncate(rect.size);

	return newRect;
}


CBH_CONST NSRect NSRect_intersection(const NSRect rect, const NSRect other)
{
	return NSIntersectionRect(rect, other);
}

CBH_CONST NSRect NSRect_union(const NSRect rect, const NSRect other)
{
	return NSUnionRect(rect, other);
}


CBH_CONST NSRect NSRect_centeredInRect(const NSRect rect, const NSRect inRect)
{
	NSRect newRect = rect;

	newRect.origin.x = inRect.origin.x + ((inRect.size.width - rect.size.width) / 2.0);
	newRect.origin.y = inRect.origin.y + ((inRect.size.height - rect.size.height) / 2.0);

	return newRect;
}


#pragma mark - Derived Points

CBH_CONST NSPoint NSRect_maxPoint(const NSRect rect)
{
	NSPoint point;

	point.x = NSRect_maxX(rect);
	point.y = NSRect_maxY(rect);

	return point;
}

CBH_CONST NSPoint NSRect_midPoint(const NSRect rect)
{
	NSPoint point;

	point.x = NSRect_midX(rect);
	point.y = NSRect_midY(rect);

	return point;
}

CBH_CONST NSPoint NSRect_minPoint(const NSRect rect)
{
	NSPoint point;

	point.x = NSRect_minX(rect);
	point.y = NSRect_minY(rect);

	return point;
}


#pragma mark - Calculated Properties

CBH_CONST CGFloat NSRect_maxX(const NSRect rect)
{
	return ( rect.size.width <= 0 ) ? rect.origin.x : rect.origin.x + rect.size.width;
}

CBH_CONST CGFloat NSRect_maxY(const NSRect rect)
{
	return ( rect.size.height <= 0 ) ? rect.origin.y : rect.origin.y + rect.size.height;
}

CBH_CONST CGFloat NSRect_midX(const NSRect rect)
{
	return rect.origin.x + (rect.size.width / 2.0);
}

CBH_CONST CGFloat NSRect_midY(const NSRect rect)
{
	return rect.origin.y + (rect.size.height / 2.0);
}

CBH_CONST CGFloat NSRect_minX(const NSRect rect)
{
	return ( rect.size.width >= 0 ) ? rect.origin.x : rect.origin.x + rect.size.width;
}

CBH_CONST CGFloat NSRect_minY(const NSRect rect)
{
	return ( rect.size.height >= 0 ) ? rect.origin.y : rect.origin.y + rect.size.height;
}


#pragma mark - Description

CBH_CONST NSString *NSRect_description(const NSRect rect)
{
	return NSStringFromRect(rect);
}
