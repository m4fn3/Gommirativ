#import <Foundation/Foundation.h>

NSArray *url_schemes = @[@"cydia",@"sileo",@"zbra"];

%hook UIApplication
- (BOOL)canOpenURL: (NSURL *)url {
	for(NSString *str in url_schemes) {
		if ([[url scheme] isEqualToString:str]) {
			%orig;
			return NO;
		}
	}
	return %orig;
}
%end


%hook NSURL
+ (instancetype)URLWithString: (NSString *)URLString {
	for(NSString *str in url_schemes) {
		if ([URLString hasPrefix:str]) {
			%orig;
			return nil;
		}
	}
	return %orig;
}
%end
