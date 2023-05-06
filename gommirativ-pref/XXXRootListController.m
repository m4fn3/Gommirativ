#import <Foundation/Foundation.h>
#import "XXXRootListController.h"
#import <sys/sysctl.h>

@implementation XXXRootListController

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
	NSTask* task = [[NSTask alloc] init];
    [task setLaunchPath:@"/usr/bin/killall"];
    [task setArguments:[NSArray arrayWithObjects:@"Mirrativ", nil]];
    [task launch];
}

@end
