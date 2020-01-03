//  NSRect+CBHGeometryKit.h
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

@import Foundation;


NS_ASSUME_NONNULL_BEGIN

#pragma mark - Creating Ranges

/**
 * @name Creating Ranges
 */

/** Creates a new `NSRange` from the specified components.
 *
 * @param location  The location to start the range.
 * @param length    The length of the range.
 *
 * @return          A `NSRange` with its components provided by the _location_ and _length_.
 */
NSRange NSRange_init(NSUInteger location, NSUInteger length);

/** Creates a new `NSRange` between two points inclusively.
 *
 * @param from  The starting location for the range.
 * @param to    The ending location for the range.
 *
 * @return      A `NSRange` with its components derived from _from_ and _to_.
 */
NSRange NSRange_initFromTo(NSUInteger from, NSUInteger to);

/** Creates a new `NSRange` from a text-based representation.
 *
 * @param string    The string containing 2 integers. The first being location, the second bing length.
 *
 * @return          A `NSRange` with its components provided by the given _string_.
 *
 * @warning         If _string_ only contains a single integer it is used as the location. If _string_ does not contain any integers the returned `NSRange` will have its components set to 0.
 */
NSRange NSRange_initWithString(NSString *string);

/** Creates a new `NSRange` with both the location and length components set to 0.
 *
 * @return  A `NSRange` with its components set to 0.
 */
NSRange NSRange_initEmpty(void);


#pragma mark - Checking Range

/**
 * @name Checking Range
 */

/** Indicates whether the range is empty.
 *
 * @param range     A range to check.
 *
 * @return          A `BOOL` value that indicates if the range is empty.
 *
 * @warning         A range with a 0 length is considered empty.
 */
BOOL NSRange_isEmpty(NSRange range);

/** Indicates whether the two ranges are equal.
 *
 * @param range     A ranges to compare.
 * @param other     A ranges to compare against.
 *
 * @return          A `BOOL` value that indicates if the two ranges are identical.
 */
BOOL NSRange_isEqual(NSRange range, NSRange other);

/** Indicates whether the a location is contained in a range.
 *
 * @param range     A range.
 * @param location  A location.
 *
 * @return          A `BOOL` value that indicates if _range_ contains the _location_.
 */
BOOL NSRange_isLocationInRange(NSRange range, NSUInteger location);


#pragma mark - Derived Ranges

/**
 * @name Derived Ranges
 */

/** Derives a new `NSRange` representing the intersection (largest overlap) of two ranges.
 *
 * @param range     A range.
 * @param other     Another range.
 *
 * @return          A `NSRange` derived from the intersection of _range_ and _other_.
 *
 * @warning         If the returned range’s length field is 0, then the two ranges don’t intersect, and the value of the location field is undefined.
 */
NSRange NSRange_intersection(NSRange range, NSRange other);

/** Derives a new `NSRange` representing the union (smallest rectangle which completely includes) the two ranges.
 *
 * @param range     A range.
 * @param other     Another range.
 *
 * @return          A `NSRange` derived from the union of _range_ and _other_.
 */
NSRange NSRange_union(NSRange range, NSRange other);


#pragma mark - Calculated Properties

/**
 * @name Calculated Properties
 */

/** Derives the maximum location for the range.
 *
 * @param range     The range to get the maximum location for.
 *
 * @return          An `NSUInteger` representing the maximum location in the range.
 */
NSUInteger NSRange_max(NSRange range);

/** Derives a location with a given offset in a range.
 *
 * @param range     The range to base the location off of.
 * @param offset    The offset to get relative to the ranges location.
 *
 * @return          An `NSUInteger` representing the location of the offset inside the range.
 *
 * @warning         If the offset exceeds the ranges length `NSNotFound` will be returned.
 */
NSUInteger NSRange_locationAtOffset(NSRange range, NSUInteger offset);


#pragma mark - Description

/**
 * @name Description
 */

/** Produces a string representation of the provided rect.
 *
 * The first integer is the location, the second integer is the length.
 *
 * Example: @"{0, 1}"
 *
 * @param range     The rect.
 *
 * @return          A `NSString` representing the provided _range_.
 */
NSString *NSRange_description(NSRange range);

NS_ASSUME_NONNULL_END
