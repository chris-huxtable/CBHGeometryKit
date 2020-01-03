//  NSRect+CBHGeometryKit.h
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

#pragma mark - Creating Rects

/**
 * @name Creating Rects
 */

/** Creates a new `NSRect` from the specified values.
 *
 * @param x             The x component.
 * @param y             The y component.
 * @param width         The width component.
 * @param height        The height component.
 *
 * @return              A `NSRect` with its components provided by _x_, _y_, _width_, and _height_.
 */
NSRect NSRect_init(CGFloat x, CGFloat y, CGFloat width, CGFloat height);

/** Creates a new `NSRect` from the specified structs.
 *
 * @param origin        The origin point component.
 * @param size          The size component.
 *
 * @return              A `NSRect` with its components provided by the _origin_ and _size_.
 */
NSRect NSRect_initWithStructs(NSPoint origin, NSSize size);

/** Creates a new `NSRect` with an origin at {0, 0} and a specified size.
 *
 * @param size          The size component.
 *
 * @return              A `NSRect` with an origin at {0, 0} and its size component provided by _size_.
 */
NSRect NSRect_initWithSize(NSSize size);

/** Creates a new `NSRect` from a text-based representation.
 *
 * @param string        The string of the form "{{x, y}, {width, height}}".
 *
 * @return              A `NSRect` with its components provided by _x_, _y_, _width_, and _height_.
 *
 * @warning             If _string_ does not contain any numbers the returned `NSRect` will have its components set to 0.
 */
NSRect NSRect_initWithString(NSString *string);

/** Creates a new `NSRect` with both the x, y, width, and height components set to 0.
 *
 * @return              A `NSRect` with its components set to 0.
 */
NSRect NSRect_initEmpty(void);


#pragma mark - Checking Rects

/**
 * @name Checking Rects
 */

/** Indicates whether the rect is empty.
 *
 * @param rect          A rect to check.
 *
 * @return              A `BOOL` value that indicates if the rects size component is empty.
 *
 * @warning             A rect size with a 0 or negative component is considered empty.
 */
BOOL NSRect_isEmpty(NSRect rect);

/** Indicates whether the rect is negative.
*
* @param rect           A rect to check.
*
* @return               A `BOOL` value that indicates if the rects size has a component which is less than 0.
*/
BOOL NSRect_isNegative(const NSRect rect);

/** Indicates whether the two rects are equal.
 *
 * @param rect          A rect to compare.
 * @param other         A rect to compare against.
 *
 * @return              A `BOOL` value that indicates if the two rects are identical.
 */
BOOL NSRect_isEqual(NSRect rect, NSRect other);


/** Indicates whether a rect is completely covering another rect.
 *
 * @param rect          The covering rect.
 * @param other         The covered rect.
 *
 * @return              A `BOOL` value that indicates if _rect_ is completely covering _other_.
 */
BOOL NSRect_isCovering(NSRect rect, NSRect other);

/** Indicates whether the two rects intersect.
 *
 * @param rect          A rect.
 * @param other         Another rect.
 *
 * @return              A `BOOL` value that indicates if _rect_ is intersecting _other_.
 */
BOOL NSRect_isIntersecting(NSRect rect, NSRect other);

/** Indicates whether the a point is contained in a rect.
 *
 * @param rect          A rect.
 * @param point         A point.
 *
 * @return              A `BOOL` value that indicates if _rect_ contains the _point_.
 */
BOOL NSRect_isPointInRect(NSRect rect, NSPoint point);

/** Indicates whether the a mouse point is contained in a rect.
 *
 * @param rect          A rect.
 * @param point         A mouse point.
 * @param flipped       Indicates if the underlying view is flipped.
 *
 * @return              A `BOOL` value that indicates if _rect_ contains the mouse _point_.
 */
BOOL NSRect_isMouseInRect(NSRect rect, NSPoint point, BOOL flipped);


#pragma mark - Derived Rects

/**
 * @name Derived Rects
 */

/** Derives a new `NSRect` which has been inset by the specified amounts.
 *
 * @param rect          The rect to inset.
 * @param dX            The delta for the sides parallel to the x axis.
 * @param dY            The delta for the sides parallel to the y axis.
 *
 * @return              A `NSRect` derived from _rect_ by having its sides inset.
 */
NSRect NSRect_inset(NSRect rect, CGFloat dX, CGFloat dY);

/** Derives a new `NSRect` for which the x, and y components have been offset by the given amounts.
 *
 * @param rect          The rect to offset.
 * @param dX            The delta for the x component.
 * @param dY            The delta for the y component.
 *
 * @return              A `NSRect` derived from _rect_ by having its origin offset.
 */
NSRect NSRect_offset(NSRect rect, CGFloat dX, CGFloat dY);


/** Derives a new `NSRect` by adjusting its sides to be integer values.
 *
 * @param rect          The rect to adjust.
 *
 * @return              A `NSRect` derived from _rect_ by adjusting its sides to be integer values.
 *
 * @warning             Wraps NSIntegralRect
 */
NSRect NSRect_integral(NSRect rect);


/** Derives a new `NSRect` for which the x, y, width, and height components have been truncated.
 *
 * @param rect          The rect to truncate.
 *
 * @return              A `NSRect` derived from _rect_ by having its components truncated.
 */
NSRect NSRect_truncate(NSRect rect);

/** Derives a new `NSRect` for which the x, y, width, and height components have been rounded.
 *
 * @param rect          The rect to round.
 *
 * @return              A `NSRect` derived from _rect_ by having its components rounded.
 */
NSRect NSRect_round(NSRect rect);

/** Derives a new `NSRect` for which the size components have been converted to absolute values.
 *
 * @param rect          The rect to convert.
 *
 * @return              A `NSRect` derived from _rect_ by having its components converted to absolute values.
 */
NSRect NSRect_absolute(NSRect rect);


/** Derives a new `NSRect` for which the x, y, width, and height components have been truncated and the origin x and y has been shifted by 0.5.
 *
 * @param rect          The rect to align.
 *
 * @return              A `NSRect` derived from _rect_ by having its components truncated and the origin components shifted by 0.5
 */
NSRect NSRect_alignWithPixels(NSRect rect);


/** Derives a new `NSRect` representing the intersection (largest overlap) of two rects.
 *
 * @param rect          A rect.
 * @param other         Another rect.
 *
 * @return              A `NSRect` derived from the intersection of _rect_ and _other_.
 *
 * @warning             If there is no overlap an empty rect with its origin at {0, 0} is returned.
 */
NSRect NSRect_intersection(NSRect rect, NSRect other);

/** Derives a new `NSRect` representing the union (smallest rectangle which completely covers) the two rects.
 *
 * @param rect          A rect.
 * @param other         Another rect.
 *
 * @return              A `NSRect` derived from the union of _rect_ and _other_.
 *
 * @warning             If one of the rects are empty the other rect is returned. If both are empty, an empty rect is returned with its origin at {0, 0}.
 */
NSRect NSRect_union(NSRect rect, NSRect other);

/** Derives a new `NSRect` with the same size as the first given rect shifted so the it is aligned with the center of the second rect.
 *
 * @param rect          The rect to center.
 * @param inRect        The rect to center on.
 *
 * @return              A `NSRect` derived from _rect_ but is centered on _other_.
 */
NSRect NSRect_centeredInRect(NSRect rect, NSRect inRect);


#pragma mark - Derived Points

/**
 * @name Derived Points
 */

/** Derives a `NSPoint` maximum x and y values for the rect.
 *
 * @param rect          The rect to get the maximum point for.
 *
 * @return              A `NSPoint` with the maximum x and y values for the rect.
 *
 * @warning             In the case of a negative size, this may be the origin.
 */
NSPoint NSRect_maxPoint(NSRect rect);

/** Derives a `NSPoint` with the middle x and y values for the rect.
 *
 * @param rect          The rect to get the middle point for.
 *
 * @return              A `NSPoint` with the minimum x and y values for the rect.
 */
NSPoint NSRect_midPoint(NSRect rect);

/** Derives a `NSPoint` minimum x and y values for the rect.
 *
 * @param rect          The rect to get the minimum point for.
 *
 * @return              A `NSPoint` with the minimum x and y values for the rect.
 *
 * @warning             In the case of a negative size, this is not the origin.
 */
NSPoint NSRect_minPoint(NSRect rect);


#pragma mark - Calculated Properties

/** Derives the maximum x value for the rect.
 *
 * @param rect          The rect to get the maximum x value for.
 *
 * @return              A `CGFloat` representing the maximum x value for the rect.
 *
 * @warning             In the case of a negative size, this may be the origins x value.
 */
CGFloat NSRect_maxX(NSRect rect);

/** Derives the maximum y value for the rect.
 *
 * @param rect          The rect to get the maximum y value for.
 *
 * @return              A `CGFloat` representing the maximum y value for the rect.
 *
 * @warning             In the case of a negative size, this may be the origins y value.
 */
CGFloat NSRect_maxY(NSRect rect);

/** Derives the middle x value for the rect.
 *
 * @param rect          The rect to get the middle x value for.
 *
 * @return              A `CGFloat` representing the middle x value for the rect.
 */
CGFloat NSRect_midX(NSRect rect);

/** Derives the middle y value for the rect.
 *
 * @param rect          The rect to get the middle y value for.
 *
 * @return              A `CGFloat` representing the middle y value for the rect.
 */
CGFloat NSRect_midY(NSRect rect);

/** Derives the minimum x value for the rect.
 *
 * @param rect          The rect to get the minimum x value for.
 *
 * @return              A `CGFloat` representing the minimum x value for the rect.
 *
 * @warning             In the case of a negative size, this is not the origins x value.
 */
CGFloat NSRect_minX(NSRect rect);

/** Derives the minimum y value for the rect.
 *
 * @param rect          The rect to get the minimum y value for.
 *
 * @return              A `CGFloat` representing the minimum y value for the rect.
 *
 * @warning             In the case of a negative size, this is not the origins y value.
 */
CGFloat NSRect_minY(NSRect rect);


#pragma mark - Description

/**
 * @name Description
 */

/** Produces a string representation of the provided rect.
 *
 * Example: @"{{1, 2}, {3, 4}}"
 *
 * @param rect          The rect.
 *
 * @return              A `NSString` representing the provided _rect_.
 */
NSString *NSRect_description(NSRect rect);

NS_ASSUME_NONNULL_END
