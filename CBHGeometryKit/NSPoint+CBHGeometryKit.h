//  NSPoint+CBHGeometryKit.h
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

@import Foundation;


NS_ASSUME_NONNULL_BEGIN

#pragma mark - Creating Points

/**
 * @name Creating Points
 */

/** Creates a new `NSPoint` from the specified values.
 *
 * @param x             The x component.
 * @param y             The y component.
 *
 * @return              A `NSPoint` with its components provided by _x_ and _y_.
 */
NSPoint NSPoint_init(CGFloat x, CGFloat y);

/** Creates a new `NSPoint` from a text-based representation.
 *
 * @param string        The string of the form "{x, y}".
 *
 * @return              A `NSPoint` with its components provided by _x_ and _y_.
 *
 * Note: If _string_ does not contain any numbers the returned `NSPoint` will have its components set to 0.
 */
NSPoint NSPoint_initWithString(NSString *string);

/** Creates a new `NSPoint` with both the x and y components set to 0.
 *
 * @return              A `NSPoint` with its components set to 0.
 */
NSPoint NSPoint_initZero(void);


#pragma mark - Checking Points

/**
 * @name Checking Points
 */

/** Indicates whether the two points are equal.
 *
 * @param point         A point to compare.
 * @param other         A point to compare against.
 *
 * @return              A `BOOL` value that indicates if the two points are identical.
 */
BOOL NSPoint_isEqual(NSPoint point, NSPoint other);


#pragma mark - Derived Points

/**
 * @name Derived Points
 */

/** Derives a new `NSPoint` for which the x and y components have been truncated.
 *
 * @param point         The point to truncate.
 *
 * @return              A `NSPoint` derived from _point_ by having its components truncated.
 */
NSPoint NSPoint_truncate(NSPoint point);

/** Derives a new `NSPoint` for which the x and y components have been rounded to the nearest whole value.
 *
 * @param point         The point to round.
 *
 * @return              A `NSPoint` derived from _point_ by having its components rounded.
 */
NSPoint NSPoint_round(NSPoint point);


/** Derives a new `NSPoint` for which the x and y components have been shifted by the components of a second point.
 *
 * @param point         The point to shift.
 * @param delta         A point containing the delta values to shift _point_ by.
 *
 * @return              A `NSPoint` derived from _point_ by having it components shifted by the provided amounts.
 */
NSPoint NSPoint_shift(NSPoint point, NSPoint delta);

/** Derives a new `NSPoint` for which the x and y components have been shifted by the provided values.
 *
 * @param point         The point to shift.
 * @param dX            A value by which to shift _point_'s x component.
 * @param dY            A value by which to shift _point_'s y component.
 *
 * @return              A `NSPoint` derived from _point_ by having its components shifted by the provided amounts.
 */
NSPoint NSPoint_shiftParametric(NSPoint point, CGFloat dX, CGFloat dY);


/** Derives a new `NSPoint` for which the x and y components fall in the middle of a pixel.
 *
 * @param point         The point to adjust.
 *
 * @return              A `NSPoint` derived from _point_ by having its components truncated and then shifted by 0.5 so that it falls in the middle of a pixel.
 */
NSPoint NSPoint_nearestPixel(NSPoint point);


#pragma mark - Distance

/**
 * @name Distance
 */

/** Calculates the distance between two points.
 *
 * @param start         The starting point.
 * @param end           The ending point.
 *
 * @return              A `CGFloat` representing the distance between the two points.
 *
 * Note: This function makes use of `sqrt()` and is considered slow. If preforming distance comparison consider comparing the squared distances instead.
 */
CGFloat NSPoint_distance(NSPoint start, NSPoint end);

/** Calculates the squared distance between two points.
 *
 * @param start         The starting point.
 * @param end           The ending point.
 *
 * @return              A `CGFloat` representing the distance between the two points.
 *
 * Note: This function does __NOT__ make use of `sqrt()`. Comparison of this value can be much quicker than comparing the actual distances.
 */
CGFloat NSPoint_distanceSquared(NSPoint start, NSPoint end);


#pragma mark - Description

/**
 * @name Description
 */

/** Produces a string representation of the provided point.
 *
 * @param point         The point.
 *
 * @return              A `NSString` representing the provided _point_.
 */
NSString *NSPoint_description(NSPoint point);

NS_ASSUME_NONNULL_END
