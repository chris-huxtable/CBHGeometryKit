//  NSSize+CBHGeometryKit.h
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

@import Foundation;


NS_ASSUME_NONNULL_BEGIN

#pragma mark - Creating Sizes

/**
 * @name Creating Sizes
 */

/** Creates a new `NSSize` from the specified values.
 *
 * @param width         The width component.
 * @param height        The height component.
 *
 * @return              A `NSSize` with its components provided by _width_ and _height_.
 */
NSSize NSSize_init(CGFloat width, CGFloat height);

/** Creates a new `NSSize` from a text-based representation.
 *
 * @param string        The string of the form "{width, height}".
 *
 * @return              A `NSSize` with its components provided by _width_ and _height_.
 *
 * Note: If _string_ does not contain any numbers the returned `NSSize` will have its components set to 0.
 */
NSSize NSSize_initWithString(NSString *string);

/** Creates a new `NSSize` with both the width and height components set to 0.
 *
 * @return              A `NSSize` with its components set to 0.
 */
NSSize NSSize_initEmpty(void);


#pragma mark - Checking Sizes

/**
 * @name Checking Sizes
 */

/** Indicates whether the size is empty.
 *
 * @param size          A size to check.
 *
 * @return              A `BOOL` value that indicates if the size is empty.
 *
 * Note: A size with a 0 or negative component is considered empty.
 */
BOOL NSSize_isEmpty(NSSize size);

/** Indicates whether the size has a component that is negative.
 *
 * @param size          A size to check.
 *
 * @return              A `BOOL` value that indicates if the size has a component that is negative.
 */
BOOL NSSize_isNegative(NSSize size);

/** Indicates whether the two sizes are equal.
 *
 * @param size          A size to compare.
 * @param other         A size to compare against.
 *
 * @return              A `BOOL` value that indicates if the two sizes are identical.
 */
BOOL NSSize_isEqual(NSSize size, NSSize other);


#pragma mark - Derived Sizes

/**
 * @name Derived Sizes
 */

/** Derives a new `NSSize` for which the width and height components have been truncated.
 *
 * @param size          The size to truncate.
 *
 * @return              A `NSSize` derived from _size_ by having its components truncated.
 */
NSSize NSSize_truncate(NSSize size);

/** Derives a new `NSSize` for which the width and height components have been rounded.
 *
 * @param size          The size to round.
 *
 * @return              A `NSSize` derived from _size_ by having its components rounded.
 */
NSSize NSSize_round(NSSize size);

/** Derives a new `NSSize` for which the width and height components have been converted to their absolute values.
 *
 * @param size          The size to round.
 *
 * @return              A `NSSize` derived from _size_ by having its components converted to their absolute values.
 */
NSSize NSSize_absolute(NSSize size);


/** Derives a new `NSSize` for which the width and height components have been shifted by the components of a second point.
 *
 * @param size          The size to scale.
 * @param delta         A size containing the values to scale _size_ by.
 *
 * @return              A `NSSize` derived from _size_ by having it components scaled by the provided amounts.
 */
NSSize NSSize_scale(NSSize size, NSSize delta);

/** Derives a new `NSSize` for which the width and height components have been scaled by the provided values.
 *
 * @param size          The size to shift.
 * @param dWidth        A value by which to shift _size_'s _width_ component.
 * @param dHeight       A value by which to shift _size_'s _height_ component.
 *
 * @return              A `NSPoint` derived from _point_ by having its components scaled by the provided amounts.
 */
NSSize NSSize_scaleParametric(NSSize size, CGFloat dWidth, CGFloat dHeight);


#pragma mark - Description

/**
 * @name Description
 */

/** Produces a string representation of the provided size.
 *
 * @param size          The size.
 *
 * @return              A `NSString` representing the provided _size_.
 *
 * Example: @"{1, 2}"
 */
NSString *NSSize_description(NSSize size);

NS_ASSUME_NONNULL_END
