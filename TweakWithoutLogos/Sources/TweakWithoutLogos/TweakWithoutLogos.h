#import <Foundation/Foundation.h>

@interface SBMutableIconLabelImageParameters
- (void)logSetTextCallWithText:(NSString *)text;
@end
static void hook_SBMutableIconLabelImageParameters_setText(SBMutableIconLabelImageParameters *self, SEL cmd, NSString *text);
static void (*orig_SBMutableIconLabelImageParameters_setText)(SBMutableIconLabelImageParameters *self, SEL cmd, NSString *text);
static void new_SBMutableIconLabelImageParameters_logSetTextCallWithText(SBMutableIconLabelImageParameters *self, SEL cmd, NSString *text);
