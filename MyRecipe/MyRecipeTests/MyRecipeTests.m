//
//  MyRecipeTests.m
//  MyRecipeTests
//
//  Created by Sacha Moo on 11/27/17.
//  Copyright © 2017 Sacha Moo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import <OCMockito/OCMockito.h>

@interface MyRecipeTests : XCTestCase

@end

@implementation MyRecipeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSMutableArray* mockArray = mock([NSMutableArray class]);
    
    [mockArray addObject:@"firstElement"];
    [mockArray removeAllObjects];
    
    [verify(mockArray) addObject:@"firstElement"];
    [verify(mockArray) removeAllObjects];
}

- (void)testMockStubbing {
    // mock creation
    NSArray *mockArray = mock([NSArray class]);

    // stubbing
    [given([mockArray objectAtIndex:0]) willReturn:@"first"];
    [given([mockArray objectAtIndex:1]) willThrow:[NSException exceptionWithName:@"name"
                                                                          reason:@"reason"
                                                                        userInfo:nil]];
    
    // following prints "first"
    NSLog(@"%@", [mockArray objectAtIndex:0]);
    
    // follows throws exception
    NSLog(@"%@", [mockArray objectAtIndex:1]);
    
    // following prints "(null)" because objectAtIndex:999 was not stubbed
    NSLog(@"%@", [mockArray objectAtIndex:999]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
