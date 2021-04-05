# TweakWithoutLogos

## Explanation

Most iOS tweak developers use Logos, an Objective-C preprocessor, to simplify the tweak writing process. Logos converts directives such as `%hook`, `%new`, `%ctor`, `%init`, etc. into pure Objective-C code that interfaces with substrate to hook code at runtime. This repository includes two functionally identical tweaks. They both add a "Da" prefix to all icon labels on the Home Screen. However, one uses Logos and one does not.

## The Argument Against Logos

Logos is great. It does the confusing dirty work of substrate for you, allowing you to write hooks in simple, easily understandable syntax. However, it has drawbacks.

| Drawback | Explanation | Solution |
| --- | --- | --- |
| No Xcode autocompletion | Because Logos is a preprocessor completely foreign to Xcode, Xcode will not understand `.x` files and their Logos directives. This causes many tweak developers to use alternative IDEs, such as VSCode, without any Objective-C autocompletion or the many other benefits Xcode provides for iOS development. | Since TweakWithoutLogos uses pure Objective-C code, Xcode can fully understand it. We can use SPM to create an Xcode package for our tweak, and pass compiler flags in the `Package.swift` file so Xcode knows to include theos headers. This way, tweak developers can reap all the benefits of Xcode while developing tweaks. |
| Loss of hook control | Logos places all hooks in the dylib's constructor. This means that all methods are hooked right when the dylib loads. This is fine for 99% of use cases. However, a developer may want to activate the hook at a later time. For example, if a tweak has 100 hooks, all hooks may not need to be activated directly after the dylib loads. | When not using Logos, a developer may activate other hooks from already hooked methods. This may reduce process startup time and enables better efficiency and control over hooks. (Note: make sure to only hook something once) |
| Confusion calling original implementations | Logos provides the `%orig` directive to call the original implementation of a hooked method. `%orig` resolves to the original implementation of whichever method it resides in. However, a developer may want to call the original, non-hooked implementation of a method from a different hooked method. While this is possible with Logos as done [here](https://github.com/DHowett/preferenceloader/blob/master/prefs.xm#L237-L263), the code is less straightforward. | When developing a tweak without Logos, the developer must declare the original implementation of any hooked method. This declared method is always accessible from anywhere in the code. |

## Final Verdict

If you develop tweaks on Linux or Windows, using Logos is likely the better, easier option. While directly calling substrate still has its benefits, these benefits will rarely be used.
If you develop on macOS, and thus have access to Xcode, I say ditch Logos. Writing hundreds or thousands of lines of Objective-C code in any other IDE is, in my personal experience, much worse. Xcode is awesome for iOS development, so use its awesomeness.
