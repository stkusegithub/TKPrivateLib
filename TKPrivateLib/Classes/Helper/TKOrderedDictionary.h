//
//  TKOrderedDictionary.h
//  TKOrderedDictionary
//
//  Created by Stk on 2017/11/8.
//  Copyright © 2017年 Stk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TKOrderedDictionary : NSMutableDictionary

@property (nonatomic, strong) NSMutableDictionary *dictionary;
@property (nonatomic, strong) NSMutableArray *array;
- (id)initWithCapacity:(NSUInteger)capacity NS_DESIGNATED_INITIALIZER;
- (void)insertObject:(id)anObject forKey:(id)aKey atIndex:(NSUInteger)anIndex;
- (id)keyAtIndex:(NSUInteger)anIndex;
- (id)objectAtIndex:(NSUInteger)anIndex;
- (void)removeObjectAtIndex:(NSUInteger)anIndex;
- (void)sortUsingComparator:(NSComparator)cmptr;
- (NSEnumerator *)reverseKeyEnumerator;
@end
