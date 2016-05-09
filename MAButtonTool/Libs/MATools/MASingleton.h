
/**
 *  @author MISSAJJ, 更新日期: 16-03-02 15:03:55
 *
 *  专门用来保存单例代码,最后一行不要加 \
 *
     使用方法:
    在.h 文件头部@interface下面
    写 singleton_interface(类名)
 
    在.m 文件头部@implementation下面
    写 singleton_implementation(类名)
 *
 *
 *
 *
 */

// .h
#define singleton_interface(class)  + (class *)shared##class;

// .m
// \ 代表下一行也属于宏
// ## 是分隔符
#define singleton_implementation(class) \
static class *_instance; \
 \
+ (class *)shared##class \
{ \
    if (_instance == nil) { \
        _instance = [[self alloc] init]; \
    } \
    return _instance; \
} \
 \
+ (id)allocWithZone:(NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
    return _instance; \
}





