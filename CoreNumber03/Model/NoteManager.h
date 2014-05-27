//
// Created by keta on 2014/05/08.
// Copyright (c) 2014 Keisuke Ueda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"


@interface NoteManager : NSObject
{
    NSMutableArray *_notes;
}

@property (nonatomic, readonly) NSArray* notes;

+ (NoteManager *)sharedManager;
- (NSString *)_noteDir;

- (NSString *)noteName:(NSString *)filename;
- (Note *)load:(NSString *)filename;
- (NSArray *)list;
- (void)removeNoteAtIndex:(unsigned int)index;
- (void)save:(Note *)note;

- (void)remove:(int)index;
@end