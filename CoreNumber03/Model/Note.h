//
//  Note.h
//  CoreNumber02
//
//  Created by keta on 2014/05/07.
//  Copyright (c) 2014年 Keisuke Ueda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject
{
	NSString *_identifier;
	NSString *_title;
	NSString *_contents;
}

@property (nonatomic, readonly) NSString *identifier;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *contents;


@end
