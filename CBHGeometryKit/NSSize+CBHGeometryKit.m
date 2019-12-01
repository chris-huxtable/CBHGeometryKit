//  NSSize+CBHGeometryKit.m
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

#import "NSSize+CBHGeometryKit.h"

#import "_CBHGeometryKit+Utilities.h"


#pragma mark - Creating Sizes

CBH_CONST NSSize NSSize_init(const CGFloat width, const CGFloat height)
{
	return (NSSize){ .width = width, .height = height };
}

CBH_CONST NSSize NSSize_initWithString(NSString * const string)
{
	return NSSizeFromString(string);
}

CBH_CONST NSSize NSSize_initEmpty(void)
{
	return (NSSize){ .width = 0.0, .height = 0.0 };
}


#pragma mark - Checking Sizes

CBH_CONST BOOL NSSize_isEmpty(const NSSize size)
{
	return ( (size.width <= 0.0) || (size.height <= 0.0) );
}

CBH_CONST BOOL NSSize_isNegative(const NSSize size)
{
	return ( (size.width < 0.0) || (size.height < 0.0) );
}

CBH_CONST BOOL NSSize_isEqual(const NSSize size, const NSSize other)
{
	return ( (size.width == other.width) && (size.height == other.height) );
}


#pragma mark - Derived Sizes

CBH_CONST NSSize NSSize_truncate(const NSSize size)
{
	NSSize newSize;

	newSize.width = trunc(size.width);
	newSize.height = trunc(size.height);

	return newSize;
}

CBH_CONST NSSize NSSize_round(const NSSize size)
{
	NSSize newSize;

	newSize.width = round(size.width);
	newSize.height = round(size.height);

	return newSize;
}

CBH_CONST NSSize NSSize_absolute(const NSSize size)
{
	NSSize newSize;

	newSize.width = fabs(size.width);
	newSize.height = fabs(size.height);

	return newSize;
}


CBH_CONST NSSize NSSize_scale(const NSSize size, const NSSize delta)
{
	return NSSize_scaleParametric(size, delta.width, delta.height);
}

CBH_CONST NSSize NSSize_scaleParametric(const NSSize size, const CGFloat dWidth, const CGFloat dHeight)
{
	NSSize newSize = size;

	newSize.width += dWidth;
	newSize.height += dHeight;

	return newSize;
}


#pragma mark - Description

CBH_CONST NSString *NSSize_description(const NSSize size)
{
	return NSStringFromSize(size);
}
