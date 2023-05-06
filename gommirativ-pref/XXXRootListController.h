#import <Preferences/PSListController.h>

@interface XXXRootListController : PSListController

@end

@interface NSTask : NSObject
@property(copy)NSArray* arguments;
@property(copy)NSString* launchPath;
- (void)launch;
@end