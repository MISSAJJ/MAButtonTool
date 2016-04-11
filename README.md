

### MAButtonTool 

`MISSAJJ`自己写的“一行搞定”快速创建导航栏按钮的工具类 

封装按钮不仅仅是为了未来偷懒， 更是在训练自己的归纳和思路拓展能力， 把一个个控件都研究透了，也就等于是摸清了底层原理，所以关键还是思考和实践过程中所积累到的内容。。。


 
###前言

![Pic](https://github.com/MISSAJJ/MAButtonTool/blob/master/MISSAJJ_1.JPG)



【纯子开发札记～静修积微……】

所谓资深， 

就是把PP牢牢钉在座位上， 

经得起时间，

耐得住寂寞，

做得了妖怪，

积累下那些只有自己才懂的深层资本！

 

_____________MISSAJJ  


###更新日期


更新日期: 16-04-11 18:18:43  （ 版本号 1.1 Build2 ）

1、增加Demo演示动图

2、标准化枚举代码

---
 
更新日期: 16-04-09 00:49:43  （ 版本号 1.1 Build2 ）

1、进一步完善demo演示

2、增加创建多个按钮的演示

---
更新日期: 16-04-05 02:33:43   （ 版本号 1.0 Build1 ）

1、应（ForrestAlfred）的建议把@selector 做成block 形式， 所以增加了Block创建按钮方法 

2、其实刚开始的时候是有想过用block来封装@selector回传的想法，后又觉得如果封装block，创建时还得多重写一个button类，还要多写几行block回调的代码，怕反而弄复杂了。

3、清明休息，正好空下来思考了block的方法，喜欢用block的盆友们可以试试

4、将原来的工具类代码融合进了demo项目内，便于大家下载代码直观测试


---
更新日期: 16-03-19 03:37:43

上传MAButtonTool   

---

###Why?为什么要写这个工具类？


为了节约时间,提高创建按钮控件的效率,特抽出一个创建各种按钮的类方法

支持：

1,图片按钮 (默认居中按钮，左返回按钮，右分享按钮)

2,自定义文字图片靠左靠右按钮

3,设定了按钮样式和位置样式，支持直接创建分享和返回按钮

4,只要修改一下分享和返回按钮图片就可以直接应用到项目中了

5,由于美工给的图片素材尺寸会不同,所以按钮的frame和setImageEdgeInsets可根据项目素材情况在VC层创建后重写调整

6，支持导航栏多个按钮创建



###Demo演示（请耐心等待demo图片加载）



![Pic](https://github.com/MISSAJJ/MAButtonTool/blob/master/MAButtonTool.gif)



###Void＃请求方法

```objective-c

/** 按钮样式 */
typedef NS_ENUM(NSInteger,MAButtonToolType) {
MAButtonToolTypeCustom,   //自定义
MAButtonToolTypeShare,    //分享按钮
MAButtonToolTypeBack,  //返回按钮
};

/** 位置样式 */
typedef NS_ENUM(NSInteger,MAButtonToolPostion) {
MAButtonToolPostionMiddle,  //中间
MAButtonToolPostionLeft,    //左边
MAButtonToolPostionRight,   //右边
};


 

/**
*  自定义图片按钮
*/
+ (UIButton *)createButton:(NSString * )imageStr;

/**
*  创建自定义 Block 图片按钮
*/
+ (UIButton *)createBlockButton:(NSString * )imageStr :(ButtonBlock)block;
/**
*  左按钮
*/
+(UIButton *)createLeftButton:(NSString *)imageStr;
/**
*  右按钮
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
*  自定义 block 导航栏 按钮
*/
+(UIBarButtonItem *)createButtonWithImage:(NSString *)imageStr position:(MAButtonToolPostion)position type:(MAButtonToolType)type actionBlock:(ButtonItemBlock)block;
/**
*  自定义 文字按钮
*/
+ (UIBarButtonItem *)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;


```

###Void＃使用方法################################################


```objective-c

//使用方法案例:

#pragma mark ==顶部左边的按钮==
- (void)leftTopBtn
{

self.navigationItem.leftBarButtonItem = [MAButtonTool createButtonWithImage:@"set_black" position:MAButtonToolPostionLeft target:self action:@selector(shareMethod) type:MAButtonToolTypeCustom];
}

```

```objective-c
#pragma mark ==单独创建自定义按钮==
- (void)customleftTopBtn
{
UIButton * backBtn = [MAButtonTool createLeftBackButton];
[backBtn addTarget:self action:@selector(shareMethod) forControlEvents:UIControlEventTouchUpInside];
self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];}

```

```objective-c
#pragma mark ==顶部右边的按钮==
- (void)rightTopBtn
{
self.navigationItem.rightBarButtonItem = [MAButtonTool createButtonWithImage:nil position:MAButtonToolPostionRight target:self action:@selector(shareMethod) type:MAButtonToolTypeShare];
}

```

```objective-c
#pragma mark == block 顶部右边的按钮==
- (void)rightTopBlockBtn
{
self.navigationItem.rightBarButtonItem = [MAButtonTool createButtonWithImage:nil position:MAButtonToolPostionRight type:MAButtonToolTypeShare :^(UIButton *btn) {

[self shareMethod];
NSLog(@"rightTopBlockBtn");

}];
}

```

```objective-c

//创建自定义图片按钮
UIButton * customBtn = [MAButtonTool createButton:@"114"];
customBtn.center = self.view.center;
[customBtn addTarget:self action:@selector(shareMethod) forControlEvents:UIControlEventTouchUpInside];

[self.view addSubview:customBtn];

```

```objective-c

//block方式创建图片按钮
UIButton * blockBtn1 = [MAButtonTool createBlockButton:@"MADesignNote_Work_2" :^(UIButton *btn) {

[self shareMethod];
}];

blockBtn1.frame = CGRectMake(customBtn.frame.origin.x -50 , customBtn.frame.origin.y + 100, customBtn.frame.size.width + 100, customBtn.frame.size.height + 150);

[self.view addSubview:blockBtn1];

```

```objective-c

#pragma mark ==顶部左边的按钮==
- (void)leftMoreBtn
{
self.navigationItem.leftBarButtonItems = @[
[MAButtonTool createButtonWithImage:@"back" position:MAButtonToolPostionLeft target:self action:@selector(shareMethod) type:MAButtonToolTypeCustom],
[MAButtonTool createButtonWithImage:@"list" position:MAButtonToolPostionLeft target:self action:@selector(shareMethod) type:MAButtonToolTypeCustom],
[MAButtonTool createButtonWithImage:@"data" position:MAButtonToolPostionLeft target:self action:@selector(shareMethod) type:MAButtonToolTypeCustom]
];
}

```

```objective-c
#pragma mark == block 顶部右边的按钮==
- (void)rightMoreBtn
{
self.navigationItem.rightBarButtonItems =@[
[MAButtonTool createButtonWithImage:nil position:MAButtonToolPostionRight type:MAButtonToolTypeShare actionBlock:^(UIButton *btn) {

[self shareMethod];
NSLog(@"rightTopBlockBtn");

}],

[MAButtonTool createButtonWithImage:@"set" position:MAButtonToolPostionRight type:MAButtonToolTypeCustom actionBlock:^(UIButton *btn) {

[self shareMethod];
NSLog(@"rightTopBlockBtn");

}]
];
}



```





###Other其他


很希望能和大咖们一起快乐地奔跑,不再是一个孤独的攻城狮，
希望能有更多的狮子一起共勉探讨学习，共同进步！

我的联系方式 ： QQ   996174446  ［验证：IOS攻城狮］
