#include <dlfcn.h>
#import <substrate.h>
#import <Foundation/Foundation.h>

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.m4fn3.gommirativ-pref.plist"

inline bool getPrefBool(NSString *key){
    return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] objectForKey:key] boolValue];
}

int checkPKGManager(void* this_) {
    return 0;
}
int checkPath(void* this_){
    return 0;
}
int hasPackageManagerScheme(void* this_){
    return 0;
}
int checkWritable(void* this_){
    return 0;
}

%ctor {
    NSString *appPath = [NSString stringWithFormat: @"%@%@", [[NSBundle mainBundle] bundlePath], @"/mirrativ"];
    void* exec = dlopen([appPath UTF8String], RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);

    void* sym_checkPKGManager = dlsym(exec, "$s8mirrativ18JailbreakDetectionC15checkPKGManagerSbvg");
    MSHookFunction((void *)sym_checkPKGManager ,(void*)checkPKGManager, NULL);
    void* sym_checkPath = dlsym(exec, "$s8mirrativ18JailbreakDetectionC9checkPathSbvg");
    MSHookFunction((void *)sym_checkPath ,(void*)checkPath, NULL);
    void* sym_hasPackageManagerScheme = dlsym(exec, "$s8mirrativ18JailbreakDetectionC23hasPackageManagerSchemeSbvg");
    MSHookFunction((void *)sym_hasPackageManagerScheme ,(void*)hasPackageManagerScheme, NULL);
    void* sym_checkWritable = dlsym(exec, "$s8mirrativ18JailbreakDetectionC13checkWritableSbvg");
    MSHookFunction((void *)sym_checkWritable ,(void*)checkWritable, NULL);
}
