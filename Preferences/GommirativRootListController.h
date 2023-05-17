#import <Preferences/PSListController.h>

@interface GommirativRootListController : PSListController

@end

@interface NSTask : NSObject
@property(copy)NSArray* arguments;
@property(copy)NSString* launchPath;
- (void)launch;
@end