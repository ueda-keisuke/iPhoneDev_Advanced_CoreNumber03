//
// Created by keta on 2014/05/08.
// Copyright (c) 2014 Keisuke Ueda. All rights reserved.
//

#import "NoteManager.h"
#import "Note.h"


@implementation NoteManager

@synthesize notes = _notes;

static NoteManager *_sharedInstance = nil;

+ (NoteManager *)sharedManager
{
    // create an instance
    if (!_sharedInstance) {
        _sharedInstance = [[NoteManager alloc] init];
    }

    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }

    _notes = [NSMutableArray array];

    return self;
}


- (void)dealloc
{

}


#pragma mark Manage Note
- (void)addNote:(Note *)note
{
    if (!note) {
        return;
    }

    [_notes addObject:note];
}



- (void)removeNoteAtIndex:(unsigned int)index
{
    if (index > [_notes count] - 1)
    {
        return;
    }

    [_notes removeObjectAtIndex:index];
}





#pragma mark save and load

- (NSString *)_noteDir
{
    NSArray *paths;
    NSString *path;
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] < 1) {
        return nil;
    }
    path = [paths objectAtIndex:0];

    path = [path stringByAppendingPathComponent:@"MyNotes"];
    return path;
}



- (NSString*)_notePath:(Note *)note
{
    NSString *path;
    NSString *filename = [[NSString alloc] initWithFormat:@"%@.data", note.identifier];
    path = [[self _noteDir] stringByAppendingPathComponent:filename];

    return path;
}



- (NSString *)noteName:(NSString *)filename
{
    NSString *path;
    path = [[self _noteDir] stringByAppendingPathComponent:filename];


    if ( ![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSLog(@"File not found in loading");
        return @"Invalid Note";
    }

    Note *note;
    note = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (!note)
    {
        NSLog(@"The note you are going to load is broken.");
        return @"Invalid Note";
    }

    return note.title;
}





- (Note *)load:(NSString *)filename
{
    NSString *path;
    path = [[self _noteDir] stringByAppendingPathComponent:filename];


    if ( ![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSLog(@"File not found in loading");
        return NULL;
    }

    Note *note;
    note = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (!note)
    {
        NSLog(@"The note you are going to load is broken.");
        return NULL;
    }

    return note;
}


- (NSArray *)list
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSString *noteDir = [self _noteDir];
    NSArray *list = [fileManager contentsOfDirectoryAtPath:noteDir error:&error];

    NSArray *sortedArray;
    sortedArray = [list sortedArrayUsingComparator:^NSComparisonResult(id a, id b){
        NSString *first = [self noteName:a];
        NSString *second = [self noteName:b];
        return [first compare:second];
    }];

	return sortedArray;

}




- (void)save:(Note *)note
{
    NSFileManager *fileMgr;
    fileMgr = [NSFileManager defaultManager];

    NSString *noteDir;
    noteDir = [self _noteDir];
    if (![fileMgr fileExistsAtPath:noteDir])
    {
        NSError *error;
        [fileMgr createDirectoryAtPath:noteDir
           withIntermediateDirectories:YES attributes:nil error:&error];
    }

    NSString *notePath;
    notePath = [self _notePath:note];
    [NSKeyedArchiver archiveRootObject:note toFile:notePath];
}



- (void)remove:(int)index
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSString *noteDir = [self _noteDir];
    NSArray *list = [fileManager contentsOfDirectoryAtPath:noteDir error:&error];
    NSString *filename = [list objectAtIndex:index];
    NSString *path;
    path = [noteDir stringByAppendingPathComponent:filename];
    [ fileManager removeItemAtPath:path error:&error ];
}



@end