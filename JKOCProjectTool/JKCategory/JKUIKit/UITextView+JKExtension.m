//
//  UITextView+JKExtension.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/12.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "UITextView+JKExtension.h"
static const char *jk_phTextView = "jk_placeHolderTextView";
@implementation UITextView (JKExtension)

- (NSRange)jk_selectedRange
{
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextRange* selectedRange = self.selectedTextRange;
    UITextPosition* selectionStart = selectedRange.start;
    UITextPosition* selectionEnd = selectedRange.end;
    
    NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}

- (void)jk_selectAllText {
    UITextRange *range = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
    [self setSelectedTextRange:range];
}

- (void)jk_setSelectedRange:(NSRange)range{
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}

- (NSInteger)jk_getInputLengthWithText:(NSString *)text
{
    NSInteger textLength = 0;
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    if (selectedRange) {
        NSString *newText = [self textInRange:selectedRange];
        textLength = (newText.length + 1) / 2 + [self offsetFromPosition:self.beginningOfDocument toPosition:selectedRange.start] + text.length;
    } else {
        textLength = self.text.length + text.length;
    }
    return textLength;
}

// 提示语属性 与 使用
-(UITextView *)jk_placeHolderTextView{
    
    return objc_getAssociatedObject(self, jk_phTextView);
}

- (void)setJk_placeHolderTextView:(UITextView *)jk_placeHolderTextView{
    
    objc_setAssociatedObject(self, jk_phTextView, jk_placeHolderTextView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)jk_addPlaceHolder:(NSString *)placeHolder {
    if (![self jk_placeHolderTextView]) {
        self.delegate = self;
        UITextView *textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        textView.font = self.font;
        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor grayColor];
        textView.userInteractionEnabled = NO;
        textView.text = placeHolder;
        [self addSubview:textView];
        [self setJk_placeHolderTextView:textView];
    }
}

# pragma mark - UITextViewDelegate

-(void)textViewDidChange:(UITextView *)textView{
    
    if([textView.text length] > 0)
    {
        self.jk_placeHolderTextView.hidden = YES;
    }else{
        self.jk_placeHolderTextView.hidden = NO;
    }
    
    
}

@end
