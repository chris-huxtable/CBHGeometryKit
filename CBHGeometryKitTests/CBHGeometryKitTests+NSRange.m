//  CBHGeometryKitTests+NSRange.m
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


#define CBHAssertEqualRanges(result, expected) XCTAssertTrue(NSRange_isEqual(result, expected), @"The ranges should be the same - result:%@ expected:%@", NSRange_description(result), NSRange_description(expected))


@interface CBHGeometryKitTests_NSRange : XCTestCase
@end


@implementation CBHGeometryKitTests_NSRange

#pragma mark - Creating Ranges

- (void)testInitialization_parametric
{
	NSRange range = NSRange_init(2, 4);

	XCTAssertEqual(range.location, 2, @"Wrong location component.");
	XCTAssertEqual(range.length, 4, @"Wrong length component.");
}

- (void)testInitialization_fromTo
{
	NSRange range = NSRange_initFromTo(2, 6);

	XCTAssertEqual(range.location, 2, @"Wrong location component.");
	XCTAssertEqual(range.length, 4, @"Wrong length component.");

	XCTAssertEqual(NSRange_max(range), 6, @"Expected max index to be different.");
}

- (void)testInitialization_string
{
	NSRange range = NSRange_initWithString(@"{2, 4}");

	XCTAssertEqual(range.location, 2, @"Wrong location component.");
	XCTAssertEqual(range.length, 4, @"Wrong length component.");
}

- (void)testInitialization_zero
{
	NSRange range = NSRange_initEmpty();

	XCTAssertEqual(range.location, 0, @"Wrong location component.");
	XCTAssertEqual(range.length, 0, @"Wrong length component.");

	XCTAssertTrue(NSRange_isEmpty(range), @"Expected an empty range.");
}


#pragma mark - Calculated Properties

- (void)testLocationIn_true
{
	NSRange range = NSRange_init(1, 2);

	XCTAssertTrue(NSRange_isLocationInRange(range, 1), @"The location should be in the range.");
	XCTAssertTrue(NSRange_isLocationInRange(range, 2), @"The location should be in the range.");
}

- (void)testLocationIn_false
{
	NSRange range = NSRange_init(1, 2);

	XCTAssertFalse(NSRange_isLocationInRange(range, 0), @"The location should not be in the range.");
	XCTAssertFalse(NSRange_isLocationInRange(range, 3), @"The location should not be in the range.");
}


#pragma mark - Derived Ranges

- (void)testIntersection
{
	NSRange initial = NSRange_init(0, 4);
	NSRange other = NSRange_init(3, 3);

	NSRange expected = NSRange_init(3, 1);
	NSRange result = NSRange_intersection(initial, other);

	CBHAssertEqualRanges(result, expected);
}

- (void)testUnion
{
	NSRange initial = NSRange_init(1, 2);
	NSRange other = NSRange_init(5, 2);

	NSRange expected = NSRange_init(1, 6);
	NSRange result = NSRange_union(initial, other);

	CBHAssertEqualRanges(result, expected);
}

#pragma mark - Calculated Properties

- (void)testLocationAtOffset
{
	NSRange range = NSRange_init(1, 2);

	XCTAssertEqual(NSRange_locationAtOffset(range, 0), 1, @"The location is not correct.");
	XCTAssertEqual(NSRange_locationAtOffset(range, 1), 2, @"The location is not correct.");
	XCTAssertEqual(NSRange_locationAtOffset(range, 2), NSNotFound, @"The location is not correct.");
}


#pragma mark - Description

- (void)testDescription
{
	NSRange initial = NSRange_init(1, 2);
	NSString *expected = @"{1, 2}";

	NSString *result = NSRange_description(initial);

	XCTAssertEqualObjects(result, expected, @"Wrong description");
}

@end
