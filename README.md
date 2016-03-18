

### MAButtonTool 

`MISSAJJ`自己写的“一行搞定”快速创建导航栏按钮的工具类 



###更新日期


更新日期: 16-03-19 03:37:43

上传MAButtonTool



###前言



【纯子开发札记～静修积微……】

所谓资深， 

就是把PP牢牢钉在座位上， 

经得起时间，

耐得住寂寞，

做得了妖怪，

积累下那些只有自己才懂的深层资本！

 

_____________MISSAJJ on 16/3/19.




###Why?为什么要写这个工具类？


为了节约时间,提高创建按钮控件的效率,特抽出一个创建各种按钮的类方法

支持：
1,图片按钮 (默认居中按钮，左返回按钮，右分享按钮)
2,自定义文字图片靠左靠右按钮
3,按项目需求，设定了按钮样式和位置样式 
4,只要修改一下分享和返回按钮图片就可以直接应用到项目中了
5,由于美工给的图片素材尺寸会不同,所以按钮的frame和setImageEdgeInsets可根据项目素材情况在VC层创建后重写调整

另： 导航栏左右多个按钮创建［后续抽空再实现吧］ 




###Void＃请求方法################################################

```objective-c

/** 按钮样式 */
typedef enum {
MAButtonToolTypeCustom,   //自定义
MAButtonToolTypeShare,    //分享按钮
MAButtonToolTypeBack      //返回按钮
}MAButtonToolType;

/** 位置样式 */
typedef enum {
MAButtonToolPostionMiddle,  //中间
MAButtonToolPostionLeft,    //左边
MAButtonToolPostionRight,   //右边
}MAButtonToolPostion;




/**
*  自定义图片按钮
*/
+ (UIButton *)createButton:(NSString *)imageStr;
/**
*  左自定义 图片按钮
*/
+(UIButton *)createLeftButton:(NSString *)imageStr;
/**
*  右自定义 图片按钮
*/
+(UIButton*)createRightButton:(NSString*)imageStr;
/**
*  左返回按钮
*/
+(UIButton*)createLeftBackButton;
/**
*  右分享按钮
*/
+(UIButton*)createRightShareButton;
/**
*  自定义 导航栏 按钮
*/
+(UIBarButtonItem *)createButtonWithImage:(NSString *)imageStr position:(MAButtonToolPostion)position target:(id)target action:(SEL)action type:(MAButtonToolType)type; 
/**
*  自定义 文字按钮
*/
+ (UIBarButtonItem *)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;

```

###Void＃使用方法################################################


```objective-c

//使用方法案例:

#pragma mark ==顶部右边的按钮==
- (void)rightTopBtn
{
self.navigationItem.rightBarButtonItem = [MAButtonTool createButtonWithImage:@"share" position:MAButtonToolPostionRight target:self action:@selector(shareMethod) type:MAButtonToolTypeShare];
}

#pragma mark ==顶部左边的按钮==
- (void)leftTopBtn
{
self.navigationItem.leftBarButtonItem = [MAButtonTool createButtonWithImage:@"set_black" position:MAButtonToolPostionLeft target:self action:@selector(goToSetup) type:MAButtonToolTypeCustom];
}


//单独创建右边分享按钮
UIButton * shareBtn = [MAButtonTool createRightShareButton];
[shareBtn addTarget:self action:@selector(shareMethod) forControlEvents:UIControlEventTouchUpInside];
self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:shareBtn];


```


###Other其他


很希望能和大咖们一起快乐地奔跑,不再是一个孤独的攻城狮，
希望能有更多的狮子一起共勉探讨学习，共同进步！

我的联系方式 ： QQ   996174446  ［验证：IOS攻城狮］
