//
//  NoteViewController.h
//  CoreNumber03
//
//  Created by keta on 2014/05/26.
//  Copyright (c) 2014年 Keisuke Ueda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoteViewController : UIViewController<UITextViewDelegate>
@property int row;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end
