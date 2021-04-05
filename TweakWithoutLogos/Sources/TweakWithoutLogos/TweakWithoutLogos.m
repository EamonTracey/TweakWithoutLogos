#import "TweakWithoutLogos.h"
#import <substrate.h>

// Implementation of hooked method setText:
static void hook_SBMutableIconLabelImageParameters_setText(SBMutableIconLabelImageParameters *self, SEL cmd, NSString *text) {
    [self logSetTextCallWithText:text];
    NSString *daText = [@"Da" stringByAppendingString:text];
    orig_SBMutableIconLabelImageParameters_setText(self, cmd, daText);
}

// Implementation of new method logSetTextCallWithText:
static void new_SBMutableIconLabelImageParameters_logSetTextCallWithText(SBMutableIconLabelImageParameters *self, SEL cmd, NSString *text) {
    NSLog(@"[TweakWithoutLogos] setText: called with text %@", text);
}

// The constructor attribute declares this function as the dylib entry point.
// Once our tweak dylib loads, the function is called.
__attribute__((constructor)) static void init() {
    MSHookMessageEx(
        objc_getClass("SBMutableIconLabelImageParameters"), // Hook SBMutableIconLabelImageParameters with substrate
        @selector(setText:), // Hook its setText: method
        (IMP)&hook_SBMutableIconLabelImageParameters_setText, // Pass our new implementation of setText: to replace the original
        (IMP *)&orig_SBMutableIconLabelImageParameters_setText // Pass a function pointer so substrate loads the original implementation for our use
    );
    class_addMethod(
        objc_getClass("SBMutableIconLabelImageParameters"), // Add a method to SBMutableIconLabelImageParameters
        @selector(logSetTextCallWithText:), // Give the selector of the new method
        (IMP)&new_SBMutableIconLabelImageParameters_logSetTextCallWithText, // Pass our implementation of logSetTextCallWithText:
        "v@:@" // Pass an array of characters that describe the types of the arguments to the new method (logSetTextCallWithText: returns void and accepts an object, selector, and object as arguments)
    );
}
