//
//  Created by Alex Rudyak on 3/10/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

@import Foundation;

@interface ITAhoCorasicContainer : NSObject

- (void)addStringPattern:(NSString *)pattern;
- (void)addStringPatterns:(NSArray *)patterns;

- (NSDictionary *)findAllMatches:(NSString *)source;

@end
