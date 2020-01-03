//  NSRange+CBHGeometryKit.m
//  CBHGeometryKit
//
//  Created by Christian Huxtable <chris@huxtable.ca>, September 2016.
//  Copyright (c) 2016 Christian Huxtable. All rights reserved.
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

#import "NSRange+CBHGeometryKit.h"

#import "_CBHGeometryKit+Utilities.h"


#pragma mark - Creating Ranges

CBH_CONST NSRange NSRange_init(const NSUInteger location, const NSUInteger length)
{
	return NSMakeRange(location, length);
}

CBH_CONST NSRange NSRange_initFromTo(const NSUInteger from, const NSUInteger to)
{
	return NSMakeRange(from, to - from);
}

CBH_CONST NSRange NSRange_initWithString(NSString * const string)
{
	return NSRangeFromString(string);
}

CBH_CONST NSRange NSRange_initEmpty()
{
	return NSMakeRange(0, 0);
}


#pragma mark - Checking Range

CBH_CONST BOOL NSRange_isEmpty(const NSRange range)
{
	return ( range.length <= 0 );
}

CBH_CONST BOOL NSRange_isEqual(const NSRange range, const NSRange other)
{
	return NSEqualRanges(range, other);
}


CBH_CONST BOOL NSRange_isLocationInRange(const NSRange range, const NSUInteger location)
{
	return NSLocationInRange(location, range);
}


#pragma mark - Derived Ranges

CBH_CONST NSRange NSRange_intersection(const NSRange range, const NSRange other)
{
	return NSIntersectionRange(range, other);
}

CBH_CONST NSRange NSRange_union(const NSRange range, const NSRange other)
{
	return NSUnionRange(range, other);
}


#pragma mark - Calculated Properties

CBH_CONST NSUInteger NSRange_max(const NSRange range)
{
	return NSMaxRange(range);
}

CBH_CONST NSUInteger NSRange_locationAtOffset(const NSRange range, const NSUInteger offset)
{
	if ( offset >= range.length ) { return NSNotFound; }
	return range.location + offset;
}


#pragma mark - Description

CBH_CONST NSString *NSRange_description(const NSRange range)
{
	return NSStringFromRange(range);
}
