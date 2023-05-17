#include <dlfcn.h>
#import <substrate.h>
#import <Foundation/Foundation.h>

//inline bool getPrefBool(NSString *key){
//    return [[[[NSUserDefaults alloc] initWithSuiteName:@"com.m4fn3.gommirativ.preferences.plist"] objectForKey:key] boolValue];
//}

int checkPKGManager(void* this_) {
    NSLog(@"Gommirativ --- checkPKGManager()");
    return 0;
}
int checkPath(void* this_){
    NSLog(@"Gommirativ --- checkPath()");
    return 0;
}
int hasPackageManagerScheme(void* this_){
    NSLog(@"Gommirativ --- hasPackageManagerScheme()");
    return 0;
}
int checkWritable(void* this_){
    NSLog(@"Gommirativ --- checkWritable()");
    return 0;
}

%ctor {
    NSLog(@"Gommirativ | Started!!");

    NSString *appPath = [NSString stringWithFormat: @"%@%@", [[NSBundle mainBundle] bundlePath], @"/mirrativ"];
    NSLog(@"Gommirativ | Found: %@", appPath);
    void* exec = dlopen([appPath UTF8String], RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);

    void* sym_checkPKGManager = dlsym(exec, "$s8mirrativ18JailbreakDetectionC15checkPKGManagerSbvg");
    NSLog(@"Gommirativ | sym_checkPKGManager addr = %p !!", sym_checkPKGManager);
    MSHookFunction((void *)sym_checkPKGManager ,(void*)checkPKGManager, NULL);

    void* sym_checkPath = dlsym(exec, "$s8mirrativ18JailbreakDetectionC9checkPathSbvg");
    NSLog(@"Gommirativ | sym_checkPath addr = %p !!", sym_checkPath);
    MSHookFunction((void *)sym_checkPath ,(void*)checkPath, NULL);

    void* sym_hasPackageManagerScheme = dlsym(exec, "$s8mirrativ18JailbreakDetectionC23hasPackageManagerSchemeSbvg");
    NSLog(@"Gommirativ | sym_hasPackageManagerScheme addr = %p !!", sym_hasPackageManagerScheme);
    MSHookFunction((void *)sym_hasPackageManagerScheme ,(void*)hasPackageManagerScheme, NULL);

    void* sym_checkWritable = dlsym(exec, "$s8mirrativ18JailbreakDetectionC13checkWritableSbvg");
    NSLog(@"Gommirativ | sym_checkWritable addr = %p !!", sym_checkWritable);
    MSHookFunction((void *)sym_checkWritable ,(void*)checkWritable, NULL);
}

// %ctor {
//     NSLog(@"Gommirativ | Loaded!");
//
//     // // -- dlsym --
//     // NSLog(@"Gommirativ | DlSym Test");
//     // NSString *appPath = [NSString stringWithFormat: @"%@%@", [[NSBundle mainBundle] bundlePath], @"/mirrativ"];
//     // NSLog(@"Gommirativ | %@", appPath);
//     // void* handle = dlopen([appPath UTF8String], RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);
//     // if (handle){
//     //  NSLog(@"Gommirativ | Handle ok !!");
//     //  void* symbol = dlsym(handle,"$s8mirrativ18JailbreakDetectionC15checkPKGManagerSbvg");
//     //  if (symbol){
//     //      NSLog(@"Gommirativ | addr = %p !!", symbol);
//     //      MSHookFunction((void *)symbol,(void*)checkPKGManager, NULL);
//     //  } else {
//     //      NSLog(@"Gommirativ | addr not found ;;");
//     //  }
//     // } else {
//     //  NSLog(@"Gommirativ | Handle failed ;;");
//     // }
//     //
//     // // -- image path check --
//     // // if (MSGetImageByName("/private/var/containers/Bundle/Application/62AD9C49-6D54-46A9-AB82-5DE046B19E9E/LINE.app/LINE")){
//     // if (MSGetImageByName("@executable_path")){
//     //     NSLog(@"Gommirativ | Image path ok");
//     // }
//     // -- findsymbol --
//     NSLog(@"Gommirativ | FindSymbol Test");
//     void* func_addr = (void*)MSFindSymbol(NULL, "$s8mirrativ18JailbreakDetectionC15checkPKGManagerSbvg");
//     if (func_addr){
//         NSLog(@"Gommirativ | addr = %p", func_addr);
//     } else {
//         NSLog(@"Gommirativ | addr not found");
//     }
//
//     NSLog(@"Gommirativ | End log");
// }
