//
//  Note.m
//  CoreNumber02
//
//  Copyright (c) 2014年 Keisuke Ueda. All rights reserved.
//

#import "Note.h"

@implementation Note

@synthesize identifier = _identifier;
@synthesize title = _title;
@synthesize contents = _contents;


#pragma mark Initialize
-(id)init
{
	self = [super init];
	if( self == nil )
		return nil;
	
	CFUUIDRef uuid;
	uuid = CFUUIDCreate(NULL);
	_identifier = (NSString *)CFBridgingRelease(CFUUIDCreateString(NULL, uuid));
	
	return self;
}


- (id)initWithCoder:(NSCoder*)decoder
{
    self = [super init];
    if( self == nil )
        return nil;

    _identifier = [decoder decodeObjectForKey:@"identifier"];
    _title = [decoder decodeObjectForKey:@"title"];
    _contents = [decoder decodeObjectForKey:@"contents"];

    return self;
}

- (void)encodeWithCoder:(NSCoder*)encoder
{
    [encoder encodeObject:_identifier forKey:@"identifier"];
    [encoder encodeObject:_title forKey:@"title"];
    [encoder encodeObject:_contents forKey:@"contents"];
}

- (void)dealloc
{
    // for debug
}






@end
