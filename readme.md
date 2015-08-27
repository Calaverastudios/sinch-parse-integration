# Using Sinch With Parse, the -ObjC Flag, and Other Issues You Might Run Into

![build errors](images/builderrors.png)

In this post, we will deal with the **-ObjC** flag that the Sinch SDK requires. We will also discuss what to do when you want to integrate with [Parse](https://parse.com/).

Let me start by saying the easiest way to use Sinch and Parse is to use them with CocoaPods. You should get no errors using these two services together while using pods.

## What if I don't want to or can't use pods?
Well, it’s certainly possible to use both of our frameworks together. Sinch, along with many other frameworks, require the -ObjC flag to be set. Parse has some dependencies on bold and implicit on Facebook, which causes some problems with -ObjC flag, dependencies on Facebook, and What is -ObjC flag?

> This flag causes the linker to load every object file in the library that defines an Objective-C class or category. While this option will typically result in a larger executable (due to additional object code loaded into the application), it will allow the successful creation of effective Objective-C static libraries that contain categories on existing classes.
 
source: [https://developer.apple.com/library/mac/qa/qa1490/_index.html](https://developer.apple.com/library/mac/qa/qa1490/_index.html) 

That means it will try to load all linked framework at build time independent of if they are used or not in your code. 

### Solution
First, make sure you have the required Cocoa frameworks for Sinch. 

```
AudioToolbox.framework
AVFoundation.framework
Security.framework
```

Set the **other linker flags** of your target to ```-ObjC -Xlinker -lc++``` 

Second, add the Parse framework to your project and add the base needed by Parse. This is all required for Parse Core and Parse Social, and be aware that there might be other ones if you use other parts of the Parse SDK. 

###Core

```
AudioToolbox.framework
CFNetwork.framework
CoreGraphics.framework
CoreLocation.framework
MobileCoreServices.framework
QuartzCore.framework
Security.framework
StoreKit.framework
SystemConfiguration.framework
libz.dylib
libsqlite3.dylib
```
###Social 

```
Accounts.framework
AudioToolbox.framework
CFNetwork.framework
CoreGraphics.framework
CoreLocation.framework
MobileCoreServices.framework
QuartzCore.framework
Security.framework
Social.framework
StoreKit.framework
SystemConfiguration.framework
libz.dylib
libsqlite3.dylib
```

## The missing part
The last two parts are the below. I think the Bolts framework is part of Parse Social and I am not sure why it is not listed:

```
Bolts.frameworks 
libstdc++.6.0.9
``` 

That's all. If you are still running into problems and want our help with it, just make a private repo in GitHub and invite me at [spacedsweden](https://github.com/spacedsweden).

One last note: If you are **also** using the FacebookSDK, you need to remove Bolts because that I believe is built in to the FacebookSDK.

Happy building!
