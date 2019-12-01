//  CBHGeometryKitTests+NSSize.m
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


#define CBHAssertEqualSizes(result, expected) XCTAssertTrue(NSSize_isEqual(result, expected), @"The sizes should be the same - result:%@ expected:%@", NSSize_description(result), NSSize_description(expected))


@interface CBHGeometryKitTests_NSSize : XCTestCase
@end


@implementation CBHGeometryKitTests_NSSize

#pragma mark - Creating Sizes

- (void)testInitialization_parametric
{
	NSSize size = NSSize_init(2.0, 4.0);

	XCTAssertEqual(size.width, 2.0, @"Wrong width component.");
	XCTAssertEqual(size.height, 4.0, @"Wrong height component.");
}

- (void)testInitialization_string
{
	NSSize size = NSSize_initWithString(@"{2, 4.0}");

	XCTAssertEqual(size.width, 2.0, @"Wrong width component.");
	XCTAssertEqual(size.height, 4.0, @"Wrong height component.");
}

- (void)testInitialization_zero
{
	NSSize size = NSSize_initEmpty();

	XCTAssertEqual(size.width, 0.0, @"Wrong width component.");
	XCTAssertEqual(size.height, 0.0, @"Wrong height component.");

	XCTAssertTrue(NSSize_isEmpty(size), @"Expected an empty size.");
}


#pragma mark - Checking Sizes

- (void)testEquality_same
{
	NSSize a = NSSize_init(3.0, 4.0);
	NSSize b = NSSize_init(3.0, 4.0);

	XCTAssertTrue(NSSize_isEqual(a, b), @"The sizes should be equal.");
}

- (void)testEquality_different_x
{
	NSSize a = NSSize_init(4.0, 4.0);
	NSSize b = NSSize_init(3.0, 4.0);

	XCTAssertFalse(NSSize_isEqual(a, b), @"The sizes should not be equal.");
}

- (void)testEquality_different_y
{
	NSSize a = NSSize_init(3.0, 3.0);
	NSSize b = NSSize_init(3.0, 4.0);

	XCTAssertFalse(NSSize_isEqual(a, b), @"The sizes should not be equal.");
}

- (void)testEquality_different_xy
{
	NSSize a = NSSize_init(4.0, 3.0);
	NSSize b = NSSize_init(3.0, 4.0);

	XCTAssertFalse(NSSize_isEqual(a, b), @"The sizes should not be equal.");
}


- (void)testEmpty_both
{
	NSSize size = NSSize_init(0.0, 0.0);

	XCTAssertTrue(NSSize_isEmpty(size), @"The size should be empty.");
}

- (void)testEmpty_none
{
	NSSize size = NSSize_init(10.0, 10.0);

	XCTAssertFalse(NSSize_isEmpty(size), @"The size should not be empty.");
}

- (void)testEmpty_width
{
	NSSize size = NSSize_init(0.0, 10.0);

	XCTAssertTrue(NSSize_isEmpty(size), @"The size should be empty.");
}

- (void)testEmpty_height
{
	NSSize size = NSSize_init(10.0, 0.0);

	XCTAssertTrue(NSSize_isEmpty(size), @"The size should be empty.");
}

- (void)testEmpty_negative
{
	NSSize size = NSSize_init(10.0, -10.0);

	XCTAssertTrue(NSSize_isEmpty(size), @"The size should be empty.");
}


- (void)testNegative_both
{
	NSSize size = NSSize_init(-10.0, -10.0);

	XCTAssertTrue(NSSize_isNegative(size), @"The size should be negative.");
}

- (void)testNegative_none
{
	NSSize size = NSSize_init(10.0, 10.0);

	XCTAssertFalse(NSSize_isNegative(size), @"The size should not be negative.");
}

- (void)testNegative_empty
{
	NSSize size = NSSize_init(0.0, 0.0);

	XCTAssertFalse(NSSize_isNegative(size), @"The size should not be negative.");
}

- (void)testNegative_width
{
	NSSize size = NSSize_init(-10.0, 10.0);

	XCTAssertTrue(NSSize_isNegative(size), @"The size should be negative.");
}

- (void)testNegative_height
{
	NSSize size = NSSize_init(10.0, -10.0);

	XCTAssertTrue(NSSize_isNegative(size), @"The size should be negative.");
}


#pragma mark - Derivation

- (void)testDerivationTruncate
{
	NSSize initial = NSSize_init(4.5, 3.5);
	NSSize expected = NSSize_init(4.0, 3.0);

	NSSize result = NSSize_truncate(initial);

	CBHAssertEqualSizes(result, expected);
}

- (void)testDerivationRound
{
	NSSize initial = NSSize_init(4.4, 3.6);
	NSSize expected = NSSize_init(4.0, 4.0);

	NSSize result = NSSize_round(initial);

	CBHAssertEqualSizes(result, expected);
}

- (void)testDerivationAbsolute_both
{
	NSSize initial = NSSize_init(-1.0, -1.0);
	NSSize expected = NSSize_init(1.0, 1.0);

	NSSize result = NSSize_absolute(initial);

	CBHAssertEqualSizes(result, expected);
}

- (void)testDerivationAbsolute_not
{
	NSSize initial = NSSize_init(1.0, 1.0);
	NSSize expected = NSSize_init(1.0, 1.0);

	NSSize result = NSSize_absolute(initial);

	CBHAssertEqualSizes(result, expected);
}

- (void)testDerivationAbsolute_width
{
	NSSize initial = NSSize_init(-1.0, 1.0);
	NSSize expected = NSSize_init(1.0, 1.0);

	NSSize result = NSSize_absolute(initial);

	CBHAssertEqualSizes(result, expected);
}

- (void)testDerivationAbsolute_height
{
	NSSize initial = NSSize_init(1.0, -1.0);
	NSSize expected = NSSize_init(1.0, 1.0);

	NSSize result = NSSize_absolute(initial);

	CBHAssertEqualSizes(result, expected);
}

- (void)testDerivationScale
{
	NSSize initial = NSSize_init(4.0, 4.0);
	NSSize expected = NSSize_init(5.5, 2.5);

	NSSize result = NSSize_scale(initial, NSSize_init(1.5, -1.5));

	CBHAssertEqualSizes(result, expected);
}


#pragma mark - Description

- (void)testDescription_wholeNumbers
{
	NSSize initial = NSSize_init(3.0, 4.0);
	NSString *expected = @"{3, 4}";

	NSString *result = NSSize_description(initial);

	XCTAssertEqualObjects(result, expected, @"Wrong description");
}

- (void)testDescription_realNumbers
{
	NSSize initial = NSSize_init(3.5, 4.5);
	NSString *expected = @"{3.5, 4.5}";

	NSString *result = NSSize_description(initial);

	XCTAssertEqualObjects(result, expected, @"Wrong description");
}

@end
