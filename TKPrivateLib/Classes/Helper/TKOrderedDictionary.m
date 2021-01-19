//
//  TKOrderedDictionary.h
//  TKOrderedDictionary
//
//  Created by Stk on 2017/11/8.
//  Copyright © 2017年 Stk. All rights reserved.
//

#import "TKOrderedDictionary.h"

NSString *DescriptionForObject(NSObject *object, id locale, NSUInteger indent)
{
	NSString *objectString;
	if ([object isKindOfClass:[NSString class]])
	{
		objectString = (NSString *)object;
	}
	else if ([object respondsToSelector:@selector(descriptionWithLocale:indent:)])
	{
		objectString = [(NSDictionary *)object descriptionWithLocale:locale indent:indent];
	}
	else if ([object respondsToSelector:@selector(descriptionWithLocale:)])
	{
		objectString = [(NSSet *)object descriptionWithLocale:locale];
	}
	else
	{
		objectString = [object description];
	}
	return objectString;
}

#pragma clang diagnostic push

#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

@implementation TKOrderedDictionary

- (id)init
{
    return [self initWithCapacity:0];
}

- (id)initWithCapacity:(NSUInteger)capacity
{
    self = [super init];
	if (self)
	{
		_dictionary = [[NSMutableDictionary alloc] initWithCapacity:capacity];
		_array = [[NSMutableArray alloc] initWithCapacity:capacity];
	}
	return self;
}

- (void)dealloc
{
	//[dictionary release];
	///[array release];
	//[super dealloc];
    _dictionary = nil;
    _array = nil;
}
//return NSMutableDictionary
- (id)copy
{
	return [self mutableCopy];
}

//- (id)mutableCopyWithZone:(NSZone *)zone
//{
//    TKOrderedDictionary* odict = [[TKOrderedDictionary alloc]init];
//    odict->dictionary = [dictionary mutableCopy];
//    odict->array = [array mutableCopy];
//    return odict;
//}

- (void)setObject:(id)anObject forKey:(id)aKey
{
    if (!anObject) {
        return;
    }
    
	if (![_dictionary objectForKey:aKey])
	{
		[_array addObject:aKey];
	}
	[_dictionary setObject:anObject forKey:aKey];
}

- (void)removeObjectForKey:(id)aKey
{
	[_dictionary removeObjectForKey:aKey];
	[_array removeObject:aKey];
}

- (NSUInteger)count
{
	return [_dictionary count];
}

- (id)objectForKey:(id)aKey
{
	return [_dictionary objectForKey:aKey];
}

- (NSEnumerator *)keyEnumerator
{
	return [_array objectEnumerator];
}

- (NSEnumerator *)reverseKeyEnumerator
{
	return [_array reverseObjectEnumerator];
}

- (void)insertObject:(id)anObject forKey:(id)aKey atIndex:(NSUInteger)anIndex
{
	if ([_dictionary objectForKey:aKey])
	{
		[self removeObjectForKey:aKey];
	}
	[_array insertObject:aKey atIndex:anIndex];
	[_dictionary setObject:anObject forKey:aKey];
}

- (id)keyAtIndex:(NSUInteger)anIndex
{
    if (_array.count > anIndex) {
        return [_array objectAtIndex:anIndex];
    }
    return nil;
}

- (id)objectAtIndex:(NSUInteger)anIndex
{
    id key = [self keyAtIndex:anIndex];
    if (key) {
        return [self objectForKey:key];
    }
    return nil;
}

- (void)removeObjectAtIndex:(NSUInteger)anIndex
{
    id key = [self keyAtIndex:anIndex];
    if (key) {
        [self removeObjectForKey:key];
    }
}

- (void)sortUsingComparator:(NSComparator)cmptr
{
    [_array sortUsingComparator:cmptr];
}

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
	NSMutableString *indentString = [NSMutableString string];
	NSUInteger i, count = level;
	for (i = 0; i < count; i++)
	{
		[indentString appendFormat:@"    "];
	}
	
	NSMutableString *description = [NSMutableString string];
	[description appendFormat:@"%@{\n", indentString];
	for (NSObject *key in self)
	{
		[description appendFormat:@"%@    %@ = %@;\n",
			indentString,
			DescriptionForObject(key, locale, level),
			DescriptionForObject([self objectForKey:key], locale, level)];
	}
	[description appendFormat:@"%@}\n", indentString];
	return description;
}
#pragma clang diagnostic pop
@end
