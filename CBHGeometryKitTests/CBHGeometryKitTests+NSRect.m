//  CBHGeometryKitTests+NSRect.m
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


#define CBHAssertEqualRects(result, expected) XCTAssertTrue(NSRect_isEqual(result, expected), @"The rects should be the same - result:%@ expected:%@", NSRect_description(result), NSRect_description(expected))


@interface CBHGeometryKitTests_NSRect : XCTestCase
@end


@implementation CBHGeometryKitTests_NSRect

#pragma mark - Creating Rects

- (void)testInitialization_parametric
{
	NSRect rect = NSRect_init(1.0, 2.0, 3.0, 4.0);

	XCTAssertEqual(rect.origin.x, 1.0, @"Wrong x component.");
	XCTAssertEqual(rect.origin.y, 2.0, @"Wrong y component.");
	XCTAssertEqual(rect.size.width, 3.0, @"Wrong width component.");
	XCTAssertEqual(rect.size.height, 4.0, @"Wrong height component.");
}

- (void)testInitialization_struct
{
	NSRect rect = NSRect_initWithStructs(NSPoint_init(1.0, 2.0), NSSize_init(3.0, 4.0));

	XCTAssertEqual(rect.origin.x, 1.0, @"Wrong x component.");
	XCTAssertEqual(rect.origin.y, 2.0, @"Wrong y component.");
	XCTAssertEqual(rect.size.width, 3.0, @"Wrong width component.");
	XCTAssertEqual(rect.size.height, 4.0, @"Wrong height component.");
}

- (void)testInitialization_size
{
	NSRect rect = NSRect_initWithSize(NSSize_init(3.0, 4.0));

	XCTAssertEqual(rect.origin.x, 0.0, @"Wrong x component.");
	XCTAssertEqual(rect.origin.y, 0.0, @"Wrong y component.");
	XCTAssertEqual(rect.size.width, 3.0, @"Wrong width component.");
	XCTAssertEqual(rect.size.height, 4.0, @"Wrong height component.");
}

- (void)testInitialization_string
{
	NSRect rect = NSRect_initWithString(@"{{1, 2}, {3.0, 4.0}}");

	XCTAssertEqual(rect.origin.x, 1.0, @"Wrong x component.");
	XCTAssertEqual(rect.origin.y, 2.0, @"Wrong y component.");
	XCTAssertEqual(rect.size.width, 3.0, @"Wrong width component.");
	XCTAssertEqual(rect.size.height, 4.0, @"Wrong height component.");
}

- (void)testInitialization_zero
{
	NSRect rect = NSRect_initEmpty();

	XCTAssertEqual(rect.origin.x, 0.0, @"Wrong x component.");
	XCTAssertEqual(rect.origin.y, 0.0, @"Wrong y component.");
	XCTAssertEqual(rect.size.width, 0.0, @"Wrong width component.");
	XCTAssertEqual(rect.size.height, 0.0, @"Wrong height component.");

	XCTAssertTrue(NSRect_isEmpty(rect), @"Expected an empty size.");
}


#pragma mark - Checking Rects

- (void)testEquality_same
{
	NSRect a = NSRect_init(1.0, 2.0, 3.0, 4.0);
	NSRect b = NSRect_init(1.0, 2.0, 3.0, 4.0);

	XCTAssertTrue(NSRect_isEqual(a, b), @"The rects should be equal.");
}

- (void)testEquality_differentOrigin
{
	NSRect a = NSRect_init(1.0, 1.0, 3.0, 4.0);
	NSRect b = NSRect_init(1.0, 2.0, 3.0, 4.0);

	XCTAssertFalse(NSRect_isEqual(a, b), @"The rects should not be equal.");
}

- (void)testEquality_differentSize
{
	NSRect a = NSRect_init(1.0, 2.0, 3.0, 3.0);
	NSRect b = NSRect_init(1.0, 2.0, 3.0, 4.0);

	XCTAssertFalse(NSRect_isEqual(a, b), @"The rects should not be equal.");
}

- (void)testEquality_differentOriginAndSize
{
	NSRect a = NSRect_init(1.0, 1.0, 3.0, 3.0);
	NSRect b = NSRect_init(1.0, 2.0, 3.0, 4.0);

	XCTAssertFalse(NSRect_isEqual(a, b), @"The rects should not be equal.");
}


- (void)testEmpty_all
{
	NSRect rect = NSRect_init(0.0, 0.0, 0.0, 0.0);

	XCTAssertTrue(NSRect_isEmpty(rect), @"The rects should be empty.");
}

- (void)testEmpty_origin
{
	NSRect rect = NSRect_init(0.0, 10.0, 0.0, 0.0);

	XCTAssertTrue(NSRect_isEmpty(rect), @"The rects should be empty.");
}

- (void)testEmpty_negative
{
	NSRect rect = NSRect_init(0.0, 0.0, -10.0, -10.0);

	XCTAssertTrue(NSRect_isEmpty(rect), @"The rects should not be empty.");
}

- (void)testEmpty_positive
{
	NSRect rect = NSRect_init(0.0, 0.0, 10.0, 10.0);

	XCTAssertFalse(NSRect_isEmpty(rect), @"The rects should not be empty.");
}


- (void)testCovers_true
{
	NSRect a = NSRect_init(1.0, 1.0, 4.0, 4.0);
	NSRect b = NSRect_init(2.0, 2.0, 3.0, 3.0);

	XCTAssertTrue(NSRect_isCovering(a, b), @"The rect should be covered.");
}

- (void)testCovers_equal
{
	NSRect a = NSRect_init(1.0, 2.0, 3.0, 4.0);
	NSRect b = NSRect_init(1.0, 2.0, 3.0, 4.0);

	XCTAssertTrue(NSRect_isCovering(a, b), @"The rect should be covered.");
}

- (void)testCovers_false
{
	NSRect a = NSRect_init(2.0, 2.0, 3.0, 3.0);
	NSRect b = NSRect_init(1.0, 1.0, 4.0, 4.0);

	XCTAssertFalse(NSRect_isCovering(a, b), @"The rects should not be covered.");
}


- (void)testIntersects_true
{
	NSRect a = NSRect_init(1.0, 1.0, 3.0, 3.0);
	NSRect b = NSRect_init(2.0, 2.0, 3.0, 3.0);

	XCTAssertTrue(NSRect_isIntersecting(a, b), @"The rect should be covered.");
}

- (void)testIntersects_equal
{
	NSRect a = NSRect_init(1.0, 2.0, 3.0, 4.0);
	NSRect b = NSRect_init(1.0, 2.0, 3.0, 4.0);

	XCTAssertTrue(NSRect_isIntersecting(a, b), @"The rect should be covered.");
}

- (void)testIntersects_false
{
	NSRect a = NSRect_init(0.0, 0.0, 2.0, 2.0);
	NSRect b = NSRect_init(2.0, 2.0, 2.0, 2.0);

	XCTAssertFalse(NSRect_isIntersecting(a, b), @"The rects should not be covered.");
}


- (void)testPointIn_true
{
	NSRect rect = NSRect_init(1.0, 1.0, 3.0, 3.0);
	NSPoint point = NSPoint_init(1.0, 2.0);

	XCTAssertTrue(NSRect_isPointInRect(rect, point), @"The point should be in the rect.");
}

- (void)testPointIn_false
{
	NSRect rect = NSRect_init(1.0, 1.0, 3.0, 3.0);
	NSPoint point = NSPoint_init(0.0, 2.0);

	XCTAssertFalse(NSRect_isPointInRect(rect, point), @"The point should not be in the rect.");
}


- (void)testMouseIn_true
{
	NSRect rect = NSRect_init(1.0, 1.0, 3.0, 3.0);
	NSPoint point = NSPoint_init(1.0, 2.0);

	XCTAssertTrue(NSRect_isMouseInRect(rect, point, NO), @"The point should be in the rect.");
	XCTAssertTrue(NSRect_isMouseInRect(rect, point, YES), @"The point should be in the rect.");
}

- (void)testMouseIn_false
{
	NSRect rect = NSRect_init(1.0, 1.0, 3.0, 3.0);
	NSPoint point = NSPoint_init(0.0, 2.0);

	XCTAssertFalse(NSRect_isMouseInRect(rect, point, NO), @"The point should not be in the rect.");
	XCTAssertFalse(NSRect_isMouseInRect(rect, point, YES), @"The point should not be in the rect.");
}


#pragma mark - Derived Rects

- (void)testInset_positive
{
	NSRect initial = NSRect_init(0.0, 0.0, 4.0, 4.0);

	NSRect expected = NSRect_init(1.0, 1.0, 2.0, 2.0);
	NSRect result = NSRect_inset(initial, 1.0, 1.0);

	CBHAssertEqualRects(result, expected);
}

- (void)testInset_negative
{
	NSRect initial = NSRect_init(1.0, 1.0, 3.0, 3.0);

	NSRect expected = NSRect_init(0.0, 0.0, 5.0, 5.0);
	NSRect result = NSRect_inset(initial, -1.0, -1.0);

	CBHAssertEqualRects(result, expected);
}


- (void)testOffset_positive
{
	NSRect initial = NSRect_init(0.0, 0.0, 4.0, 4.0);

	NSRect expected = NSRect_init(1.0, 1.0, 4.0, 4.0);
	NSRect result = NSRect_offset(initial, 1.0, 1.0);

	CBHAssertEqualRects(result, expected);
}

- (void)testOffset_negative
{
	NSRect initial = NSRect_init(1.0, 1.0, 4.0, 4.0);

	NSRect expected = NSRect_init(0.0, 0.0, 4.0, 4.0);
	NSRect result = NSRect_offset(initial, -1.0, -1.0);

	CBHAssertEqualRects(result, expected);
}


- (void)testIntegral
{
	NSRect initial = NSRect_init(1.6, 1.8, 4.6, 4.8);

	NSRect expected = NSRect_init(1.0, 1.0, 6.0, 6.0);
	NSRect result = NSRect_integral(initial);

	CBHAssertEqualRects(result, expected);
}

- (void)testTruncate
{
	NSRect initial = NSRect_init(1.6, 1.8, 4.6, 4.8);

	NSRect expected = NSRect_init(1.0, 1.0, 4.0, 4.0);
	NSRect result = NSRect_truncate(initial);

	CBHAssertEqualRects(result, expected);
}

- (void)testRound
{
	NSRect initial = NSRect_init(1.3, 1.8, 4.4, 4.8);

	NSRect expected = NSRect_init(1.0, 2.0, 4.0, 5.0);
	NSRect result = NSRect_round(initial);

	CBHAssertEqualRects(result, expected);
}

- (void)testDerivationAbsolute_both
{
	NSRect initial = NSRect_init(1.0, 1.0, -2.0, -2.0);
	NSRect expected = NSRect_init(-1.0, -1.0, 2.0, 2.0);

	NSRect result = NSRect_absolute(initial);

	CBHAssertEqualRects(result, expected);
}

- (void)testDerivationAbsolute_not
{
	NSRect initial = NSRect_init(1.0, 1.0, 2.0, 2.0);
	NSRect expected = NSRect_init(1.0, 1.0, 2.0, 2.0);

	NSRect result = NSRect_absolute(initial);

	CBHAssertEqualRects(result, expected);
}

- (void)testDerivationAbsolute_width
{
	NSRect initial = NSRect_init(1.0, 1.0, -2.0, 2.0);
	NSRect expected = NSRect_init(-1.0, 1.0, 2.0, 2.0);

	NSRect result = NSRect_absolute(initial);

	CBHAssertEqualRects(result, expected);
}

- (void)testDerivationAbsolute_height
{
	NSRect initial = NSRect_init(1.0, 1.0, 2.0, -2.0);
	NSRect expected = NSRect_init(1.0, -1.0, 2.0, 2.0);

	NSRect result = NSRect_absolute(initial);

	CBHAssertEqualRects(result, expected);
}

- (void)testAlignWithPixels
{
	NSRect initial = NSRect_init(1.3, 1.8, 4.4, 4.8);

	NSRect expected = NSRect_init(1.5, 1.5, 4.0, 4.0);
	NSRect result = NSRect_alignWithPixels(initial);

	CBHAssertEqualRects(result, expected);
}

- (void)testIntersection
{
	NSRect initial = NSRect_init(0.0, 0.0, 2.0, 2.0);
	NSRect other = NSRect_init(1.0, 1.0, 2.0, 2.0);

	NSRect expected = NSRect_init(1.0, 1.0, 1.0, 1.0);
	NSRect result = NSRect_intersection(initial, other);

	CBHAssertEqualRects(result, expected);
}

- (void)testUnion
{
	NSRect initial = NSRect_init(0.0, 0.0, 2.0, 2.0);
	NSRect other = NSRect_init(1.0, 1.0, 2.0, 2.0);

	NSRect expected = NSRect_init(0.0, 0.0, 3.0, 3.0);
	NSRect result = NSRect_union(initial, other);

	CBHAssertEqualRects(result, expected);
}


- (void)testCenteredInRect
{
	NSRect initial = NSRect_init(0.0, 0.0, 2.0, 2.0);
	NSRect other = NSRect_init(0.0, 0.0, 4.0, 4.0);

	NSRect expected = NSRect_init(1.0, 1.0, 2.0, 2.0);
	NSRect result = NSRect_centeredInRect(initial, other);

	CBHAssertEqualRects(result, expected);
}


#pragma mark - Derived Points

- (void)testMaxPoint
{
	NSRect initial = NSRect_init(0.0, 0.0, 2.0, 2.0);

	NSPoint expected = NSPoint_init(2.0, 2.0);
	NSPoint result = NSRect_maxPoint(initial);

	XCTAssertTrue(NSPoint_isEqual(result, expected), @"The points should be equal.");
}

- (void)testMidPoint
{
	NSRect initial = NSRect_init(0.0, 0.0, 2.0, 2.0);

	NSPoint expected = NSPoint_init(1.0, 1.0);
	NSPoint result = NSRect_midPoint(initial);

	XCTAssertTrue(NSPoint_isEqual(result, expected), @"The points should be equal.");
}

- (void)testMinPoint
{
	NSRect initial = NSRect_init(0.0, 0.0, 2.0, 2.0);

	NSPoint expected = NSPoint_init(0.0, 0.0);
	NSPoint result = NSRect_minPoint(initial);

	XCTAssertTrue(NSPoint_isEqual(result, expected), @"The points should be equal.");
}


#pragma mark - Calculated Properties

- (void)testMaxX_positive
{
	NSRect sample = NSRect_init(1.0, 2.0, 3.0, 4.0);

	CGFloat expected = 4.0;
	CGFloat result = NSRect_maxX(sample);

	XCTAssertEqual(result, expected, @"The values should be equal.");
}

- (void)testMaxX_negative
{
	NSRect sample = NSRect_init(1.0, 2.0, -3.0, -4.0);

	CGFloat expected = 1.0;
	CGFloat result = NSRect_maxX(sample);

	XCTAssertEqual(result, expected, @"The values should be equal.");
}

- (void)testMaxY_positive
{
	NSRect sample = NSRect_init(1.0, 2.0, 3.0, 4.0);

	CGFloat expected = 6.0;
	CGFloat result = NSRect_maxY(sample);

	XCTAssertEqual(result, expected, @"The values should be equal.");
}

- (void)testMaxY_negative
{
	NSRect sample = NSRect_init(1.0, 2.0, -3.0, -4.0);

	CGFloat expected = 2.0;
	CGFloat result = NSRect_maxY(sample);

	XCTAssertEqual(result, expected, @"The values should be equal.");
}

- (void)testMidX
{
	NSRect sample = NSRect_init(1.0, 2.0, 3.0, 4.0);

	CGFloat expected = 2.5;
	CGFloat result = NSRect_midX(sample);

	XCTAssertEqual(result, expected, @"The values should be equal.");
}

- (void)testMidY
{
	NSRect sample = NSRect_init(1.0, 2.0, 3.0, 4.0);

	CGFloat expected = 4.0;
	CGFloat result = NSRect_midY(sample);

	XCTAssertEqual(result, expected, @"The values should be equal.");
}

- (void)testMinX_positive
{
	NSRect sample = NSRect_init(1.0, 2.0, -3.0, -4.0);

	CGFloat expected = -2.0;
	CGFloat result = NSRect_minX(sample);

	XCTAssertEqual(result, expected, @"The values should be equal.");
}

- (void)testMinX_negative
{
	NSRect sample = NSRect_init(1.0, 2.0, 3.0, 4.0);

	CGFloat expected = 1.0;
	CGFloat result = NSRect_minX(sample);

	XCTAssertEqual(result, expected, @"The values should be equal.");
}

- (void)testMinY_positive
{
	NSRect sample = NSRect_init(1.0, 2.0, 3.0, 4.0);

	CGFloat expected = 2.0;
	CGFloat result = NSRect_minY(sample);

	XCTAssertEqual(result, expected, @"The values should be equal.");
}

- (void)testMinY_negative
{
	NSRect sample = NSRect_init(1.0, 2.0, -3.0, -4.0);

	CGFloat expected = -2.0;
	CGFloat result = NSRect_minY(sample);

	XCTAssertEqual(result, expected, @"The values should be equal.");
}



#pragma mark - Description

- (void)testDescription_wholeNumbers
{
	NSRect initial = NSRect_init(1.0, 2.0, 3.0, 4.0);
	NSString *expected = @"{{1, 2}, {3, 4}}";

	NSString *result = NSRect_description(initial);

	XCTAssertEqualObjects(result, expected, @"Wrong description");
}

- (void)testDescription_realNumbers
{
	NSRect initial = NSRect_init(1.5, 2.5, 3.5, 4.5);
	NSString *expected = @"{{1.5, 2.5}, {3.5, 4.5}}";

	NSString *result = NSRect_description(initial);

	XCTAssertEqualObjects(result, expected, @"Wrong description");
}

@end
