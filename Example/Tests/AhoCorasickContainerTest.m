//
//  AhoCorasicContainerTest.m
//  AhoCorasicContainerTest
//
//  Created by Alex Rudyak on 3/10/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

@import Foundation;
#import <XCTest/XCTest.h>
#import "ITAhoCorasickContainer.h"


@interface AhoCorasickContainerTest : XCTestCase

@property (strong, nonatomic) ITAhoCorasickContainer *container;

@end

@implementation AhoCorasickContainerTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.container = [ITAhoCorasickContainer new];
}


- (void)tearDown
{
    self.container = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testContainerWithOnePatternAndExistedResults
{
    // This is an example of a functional test case.
    NSString *pattern = @"one";
    [self.container addStringPattern:pattern];
    
    NSDictionary *result = [self.container findAllMatches:@"twonemone"];
    
    XCTAssertNotNil(result);
    XCTAssertEqual([[result allKeys] count], 1);
    XCTAssertEqual([[[result allValues] firstObject] count], 2);
    XCTAssertEqual([result[pattern] count], 2);
}

- (void)testContainerWithNoMatchedPattern
{
    [self.container addStringPattern:@"nachos"];
    
    NSDictionary *result = [self.container findAllMatches:@"Aloha tekila"];
    
    XCTAssertNotNil(result);
    XCTAssertEqual([result count], 0);
}

- (void)testContainerReturnsResultInRanges
{
    [self.container addStringPattern:@"tackos"];
    
    NSDictionary *result = [self.container findAllMatches:@"tackos' getting back to machost with tackoseros"];
    
    XCTAssertNotNil(result);
    for (id key in result.keyEnumerator) {
        NSArray *values = result[key];
        for (id value in values) {
            XCTAssertNotEqual([value rangeValue].location, NSNotFound);
            XCTAssertNotEqual([value rangeValue].length, 0);
        }
    }
}

- (void)testContainerHandleMultipleEqualPatterns
{
    NSString *pattern = @"pat";
    for(int i = 0; i < 10; ++i) {
        [self.container addStringPattern:pattern];
    }
    
    NSDictionary *result = [self.container findAllMatches:@"patent with patronage"];
    
    XCTAssertNotNil(result);
    XCTAssertEqual([result count], 1);
    XCTAssertEqual([result[pattern] count], 2);
}

- (void)testAddingPatternsInArray
{
    [self.container addStringPatterns:@[
                                        @"nacho"
                                        ]];
    
    NSDictionary *result = [self.container findAllMatches:@"nachomancho nacholoo"];
    
    XCTAssertNotNil(result);
    XCTAssertNotEqual([result count], 0);
}

- (void)xtestMultipleSearchingWithAddingPatterns
{
    NSString *pattern1 = @"mil";
    [self.container addStringPattern:pattern1];
    
    NSString *searchSource = @"milk is turkish military of turkey";
    NSDictionary *result1 = [self.container findAllMatches:searchSource];
    
    XCTAssertNotNil(result1);
    XCTAssertEqual([[result1 allKeys] count], 1);
    XCTAssertGreaterThan([result1[pattern1] count], 0);
    
    NSString *pattern2 = @"tur";
    [self.container addStringPattern:pattern2];
    NSDictionary *result2 = [self.container findAllMatches:searchSource];
    
    XCTAssertNotNil(result2);
    XCTAssertNotEqualObjects(result1, result2);
    XCTAssertEqual([[result2 allKeys] count], 2);
    XCTAssertGreaterThan([result2[pattern2] count], 0);
}

- (void)testSearchNumbers
{
    NSString *pattern = @"1";
    [self.container addStringPattern:pattern];
    
    NSDictionary *result = [self.container findAllMatches:@"12345"];
    
    XCTAssertNotNil(result);
    XCTAssertEqual([result count], 1);
}

- (void)testSearchStringWithWhitespaces
{
    NSString *pattern = @"tutto zar";
    [self.container addStringPattern:pattern];
    
    NSDictionary *result = [self.container findAllMatches:@"rastutto zarya notutto"];
    
    XCTAssertNotNil(result);
    XCTAssertEqual([result count], 1);
}

- (void)testCheckLocationOfMatchedEntries
{
    NSString *pattern = @"ela";
    [self.container addStringPattern:pattern];
    
    NSString *sourceString = @"masha ela kashy";
    NSDictionary *result = [self.container findAllMatches:sourceString];
    
    NSRange substringRange = [sourceString rangeOfString:pattern];
    
    XCTAssertNotNil(result);
    NSValue *rangeValue = [result[pattern] firstObject];
    XCTAssertNotNil(rangeValue);
    XCTAssertTrue(NSEqualRanges([rangeValue rangeValue], substringRange));
}

@end
