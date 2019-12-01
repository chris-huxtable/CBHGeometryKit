//  CBHGeometryKitTests+NSPoint.m
//  CBHGeometryKitTests
//
//  Created by Christian Huxtable <chris@huxtable.ca>, November 2019.
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

@import XCTest;
@import CBHGeometryKit;


#define CBHAssertEqualPoints(result, expected) XCTAssertTrue(NSPoint_isEqual(result, expected), @"The points should be the same - result:%@ expected:%@", NSPoint_description(result), NSPoint_description(expected))


@interface CBHGeometryKitTests_NSPoint : XCTestCase
@end


@implementation CBHGeometryKitTests_NSPoint

#pragma mark - Creating Points

- (void)testCreation_parametric
{
	NSPoint point = NSPoint_init(2.0, 4.0);

	XCTAssertEqual(point.x, 2.0, @"Wrong x component.");
	XCTAssertEqual(point.y, 4.0, @"Wrong y component.");
}

- (void)testCreation_string
{
	NSPoint point = NSPoint_initWithString(@"{2, 4.0}");

	XCTAssertEqual(point.x, 2.0, @"Wrong x component.");
	XCTAssertEqual(point.y, 4.0, @"Wrong y component.");
}

- (void)testCreation_zero
{
	NSPoint point = NSPoint_initZero();

	XCTAssertEqual(point.x, 0.0, @"Wrong x component.");
	XCTAssertEqual(point.y, 0.0, @"Wrong y component.");
}


#pragma mark - Checking Points

- (void)testEquality_same
{
	NSPoint a = NSPoint_init(3.0, 4.0);
	NSPoint b = NSPoint_init(3.0, 4.0);

	XCTAssertTrue(NSPoint_isEqual(a, b), @"The points should be equal.");
}

- (void)testEquality_different_x
{
	NSPoint a = NSPoint_init(4.0, 4.0);
	NSPoint b = NSPoint_init(3.0, 4.0);

	XCTAssertFalse(NSPoint_isEqual(a, b), @"The points should not be equal.");
}

- (void)testEquality_different_y
{
	NSPoint a = NSPoint_init(3.0, 3.0);
	NSPoint b = NSPoint_init(3.0, 4.0);

	XCTAssertFalse(NSPoint_isEqual(a, b), @"The points should not be equal.");
}

- (void)testEquality_different_xy
{
	NSPoint a = NSPoint_init(4.0, 3.0);
	NSPoint b = NSPoint_init(3.0, 4.0);

	XCTAssertFalse(NSPoint_isEqual(a, b), @"The points should not be equal.");
}


#pragma mark - Derivation

- (void)testDerivation_truncate
{
	NSPoint initial = NSPoint_init(4.5, 3.5);
	NSPoint expected = NSPoint_init(4.0, 3.0);

	NSPoint result = NSPoint_truncate(initial);

	CBHAssertEqualPoints(result, expected);
}

- (void)testDerivation_round
{
	NSPoint initial = NSPoint_init(4.4, 3.6);
	NSPoint expected = NSPoint_init(4.0, 4.0);

	NSPoint result = NSPoint_round(initial);

	CBHAssertEqualPoints(result, expected);
}


- (void)testDerivation_shiftPositive
{
	NSPoint initial = NSPoint_init(4.5, 3.5);
	NSPoint shift = NSPoint_init(0.5, 0.5);
	NSPoint expected = NSPoint_init(5.0, 4.0);

	NSPoint result = NSPoint_shift(initial, shift);

	CBHAssertEqualPoints(result, expected);
}

- (void)testDerivation_shiftNegative
{
	NSPoint initial = NSPoint_init(4.5, 3.5);
	NSPoint shift = NSPoint_init(-0.5, -0.5);
	NSPoint expected = NSPoint_init(4.0, 3.0);

	NSPoint result = NSPoint_shift(initial, shift);

	CBHAssertEqualPoints(result, expected);
}

- (void)testDerivation_shiftMixed
{
	NSPoint initial = NSPoint_init(4.5, 3.5);
	NSPoint shift = NSPoint_init(0.5, -0.5);
	NSPoint expected = NSPoint_init(5.0, 3.0);

	NSPoint result = NSPoint_shift(initial, shift);

	CBHAssertEqualPoints(result, expected);
}

- (void)testDerivation_nearestPixel
{
	NSPoint initial = NSPoint_init(4.0, 3.2);
	NSPoint expected = NSPoint_init(4.5, 3.5);

	NSPoint result = NSPoint_nearestPixel(initial);

	CBHAssertEqualPoints(result, expected);
}


#pragma mark - Distance

- (void)testDistance
{
	NSPoint a = NSPoint_initZero();
	NSPoint b = NSPoint_init(3.0, 4.0);

	CGFloat distance = NSPoint_distance(a, b);

	XCTAssertEqual(distance, 5.0, @"Wrong distance.");
}

- (void)testDistance_squared
{
	NSPoint a = NSPoint_initZero();
	NSPoint b = NSPoint_init(3.0, 4.0);

	CGFloat distanceSquared = NSPoint_distanceSquared(a, b);

	XCTAssertEqual(distanceSquared, 25.0, @"Wrong distance squared.");
}


#pragma mark - Description

- (void)testDescription_wholeNumbers
{
	NSPoint initial = NSPoint_init(3.0, 4.0);
	NSString *expected = @"{3, 4}";

	NSString *result = NSPoint_description(initial);

	XCTAssertEqualObjects(result, expected, @"Wrong description");
}

- (void)testDescription_realNumbers
{
	NSPoint initial = NSPoint_init(3.5, 4.5);
	NSString *expected = @"{3.5, 4.5}";

	NSString *result = NSPoint_description(initial);

	XCTAssertEqualObjects(result, expected, @"Wrong description");
}

@end
