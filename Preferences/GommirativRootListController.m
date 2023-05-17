#import <Foundation/Foundation.h>
#import "GommirativRootListController.h"
#import <sys/sysctl.h>

@implementation GommirativRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
	return _specifiers;
}

- (void)OpenTwitter {
	[[UIApplication sharedApplication]
	openURL:[NSURL URLWithString:@"https://twitter.com/m4fn3"]
	options:@{}
	completionHandler:nil];
}

- (void)OpenGitHub {
	[[UIApplication sharedApplication]
	openURL:[NSURL URLWithString:@"https://github.com/m4fn3"]
	options:@{}
	completionHandler:nil];
}

- (void)ApplyChanges {
    NSArray* launchPaths = @[@"/usr/bin/killall", @"/var/jb/usr/bin/killall"];
	for (NSString* launchPath in launchPaths) {
		if ([[NSFileManager defaultManager] fileExistsAtPath:launchPath]) {
			NSTask* task = [[NSTask alloc] init];
			[task setLaunchPath:launchPath];
			[task setArguments:@[@"Mirrativ"]];
			[task launch];
		}
	}
}

@end
