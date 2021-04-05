#import "TweakWithLogos.h"

%hook SBMutableIconLabelImageParameters

- (void)setText:(NSString *)text {
	[self logSetTextCallWithText:text];
	NSString *daText = [@"Da" stringByAppendingString:text];
	%orig(daText);
}

%new
- (void)logSetTextCallWithText:(NSString *)text {
	NSLog(@"[TweakWithLogos] setText: called with text %@", text);
}

%end