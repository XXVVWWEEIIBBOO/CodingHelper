
#ifndef XWB_Macro_h
#define XWB_Macro_h
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 屏幕界限 -
// 屏幕界限
#define kScreenB                    UIScreen.mainScreen.bounds
// 屏幕宽度
#define kScreenW                    kScreenB.size.width
// 屏幕高度
#define kScreenH                    kScreenB.size.height
// 屏幕窗口
#define kWindow                     UIApplication.sharedApplication.keyWindow
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 屏幕适配 -
// 4 (320 * 480)
#define kIsiPhone4                  (MAX(kScreenW, kScreenH) == 480)
// 5/SE (320 * 568)
#define kIsiPhone5SE                (MAX(kScreenW, kScreenH) == 568)
// 6/7/8 (375 * 667)
#define kIsiPhone678                (MAX(kScreenW, kScreenH) == 667)
// 6P/7P/8P (414 * 736)
#define kIsiPhone678P               (MAX(kScreenW, kScreenH) == 736)
// X/11 Pro (375 * 812)
#define kIsiPhoneX_11Pro            (MAX(kScreenW, kScreenH) == 812)
// XR/XS Max/11/11 Pro Max (414 * 896)
#define kIsiPhoneXR_XSMax_11_11ProMax (MAX(kScreenW, kScreenH) == 896)
// 比例缩放, 以iPhone6屏幕宽度为基准
#define kScaleiPhone6(size)         ((size) / 375.0 * kScreenW)
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 固定高度 -
// 状态栏高度
#define kStaH                       ((kIsiPhoneX_11Pro || kIsiPhoneXR_XSMax_11_11ProMax) ? 44 : 20)
// 导航栏高度
#define kNavH                       44
// 标签栏高度
#define kTabH                       49
// 安全区高度
#define kVirH                       ((kIsiPhoneX_11Pro || kIsiPhoneXR_XSMax_11_11ProMax) ? 34 : 0)
// 顶部高度
#define kTopH                       (kStaH + kNavH)
// 底部高度
#define kBottomH                    (kTabH + kVirH)
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 创建颜色 -
// 创建单色
#define kRed                        UIColor.redColor
#define kOrange                     UIColor.orangeColor
#define kYellow                     UIColor.yellowColor
#define kGreen                      UIColor.greenColor
#define kCyan                       UIColor.cyanColor
#define kBlue                       UIColor.blueColor
#define kPurple                     UIColor.purpleColor
#define kMagenta                    UIColor.magentaColor
#define kBrown                      UIColor.brownColor
#define kBlack                      UIColor.blackColor
#define kDarkGray                   UIColor.darkGrayColor
#define kGray                       UIColor.grayColor
#define kLightGray                  UIColor.lightGrayColor
#define kWhite                      UIColor.whiteColor
#define kClear                      UIColor.clearColor
// 十进制RGB颜色
#define kColorRGB10(R, G, B, A)     [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(A)]
// 十进制R, G, B相同的颜色
#define kSameRGB10(RGB, A)          kColorRGB10(RGB, RGB, RGB, A)
// 十六进制RGB颜色
#define kColorRGB16(RGB, A)         [UIColor colorWithRed:(((RGB)&0xFF0000)>>16)/255.0 green:(((RGB)&0xFF00)>>8)/255.0 blue:((RGB)&0xFF)/255.0 alpha:(A)]
// 随机颜色
#define kRandomColor(A)             [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:(A)]
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 视图定位 -
// 视图的X坐标
#define kViewX(view)                CGRectGetMinX(view.frame)
// 视图的Y坐标
#define kViewY(view)                CGRectGetMinY(view.frame)
// 视图的宽度
#define kViewW(view)                CGRectGetWidth(view.frame)
// 视图的高度
#define kViewH(view)                CGRectGetHeight(view.frame)
// 视图的右边X坐标
#define kViewR(view)                CGRectGetMaxX(view.frame)
// 视图的下边Y坐标
#define kViewB(view)                CGRectGetMaxY(view.frame)
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 重设Frame -
// 重设x
#define kSetViewX(view, x)          view.frame = CGRectMake(x, kViewY(view), kViewW(view), kViewH(view))
// 重设y
#define kSetViewY(view, y)          view.frame = CGRectMake(kViewX(view), y, kViewW(view), kViewH(view))
// 重设w
#define kSetViewW(view, w)          view.frame = CGRectMake(kViewX(view), kViewY(view), w, kViewH(view))
// 重设h
#define kSetViewH(view, h)          view.frame = CGRectMake(kViewX(view), kViewY(view), kViewW(view), h)
// 重设center x
#define kSetViewCX(view, x)         view.center = CGPointMake(x, view.center.y)
// 重设center y
#define kSetViewCY(view, y)         view.center = CGPointMake(view.center.x, y)
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 创建图片 -
// 以名字获得图片
#define kImageN(name)               [UIImage imageNamed:(name)]
// 以沙盒路径获得图片
#define kImageP(path)               [UIImage imageWithContentsOfFile:(path)]
// 以二进制数据获得图片
#define kImageD(data)               [UIImage imageWithData:(data)]
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 创建字体 -
// 系统默认字体仅设置字号
#define kSysFont(A)                 [UIFont systemFontOfSize:(A)]
// 系统默认粗体仅设置字号
#define kBoldFont(A)                [UIFont boldSystemFontOfSize:(A)]
// 同时设置字体和字号
#define kFontNA(N, A)               [UIFont fontWithName:(N) size:(A)]
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 对齐方式 -
// 左对齐
#define kLeft                       NSTextAlignmentLeft
// 居中对齐
#define kCenter                     NSTextAlignmentCenter
// 右对齐
#define kRight                      NSTextAlignmentRight
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 换行方式 -
// 按单词换行
#define kWord                       NSLineBreakByWordWrapping
// 按字符换行
#define kChar                       NSLineBreakByCharWrapping
// 结尾省略号
#define kTail                       NSLineBreakByTruncatingTail
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 按钮样式 -
// 自定义样式
#define kCustom                     UIButtonTypeCustom
// 系统样式
#define kSystem                     UIButtonTypeSystem
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UITextField边框 -
// 无边框样式
#define kBdNone                     UITextBorderStyleNone
// 圆角边框样式
#define kBdRound                    UITextBorderStyleRoundedRect
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 键盘样式 -
// 默认样式
#define kDefault                    UIKeyboardTypeDefault
// ASCII码样式
#define kASCII                      UIKeyboardTypeASCIICapable
// 数字样式
#define kNumber                     UIKeyboardTypeNumberPad
// 电话样式
#define kPhone                      UIKeyboardTypePhonePad
// 小数样式
#define kDecimal                    UIKeyboardTypeDecimalPad
// 邮件样式
#define kEmail                      UIKeyboardTypeEmailAddress
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UITableView样式 -
// 平铺样式
#define kPlain                      UITableViewStylePlain
// 分组样式
#define kGroup                      UITableViewStyleGrouped
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - Cell样式 -
// 默认样式
#define kCellDefault                UITableViewCellStyleDefault
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - Cell分隔样式 -
// 无分隔线
#define kCellSepNone                UITableViewCellSeparatorStyleNone
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - Cell选择样式 -
// 无样式
#define kCellSelNone                UITableViewCellSelectionStyleNone
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 系统版本 -
// 系统版本浮点数
#define kSystemVSN                  UIDevice.currentDevice.systemVersion.floatValue
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 用户偏好 -
// 用户偏好设置
#define kUserDefaults               NSUserDefaults.standardUserDefaults
// 保存一个对象
#define kSetObjFK(obj, key)         [kUserDefaults setObject:obj forKey:key]
// 根据KEY获取一个对象
#define kObjFK(key)                 [kUserDefaults objectForKey:(key)]
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 通知中心 -
// NSNotificationCenter
#define kNTFC                       NSNotificationCenter.defaultCenter
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 输出 -
// NSLog
#define kOutput(obj)                NSLog(@"%@", (obj))
// 打印函数名
#define kLogFuncName                NSLog(@"%s", __FUNCTION__)
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 目录 -
// 沙盒根目录
#define kHomePath                   NSHomeDirectory()
// document目录
#define kDocPath                    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]
// Library/Cache目录
#define kCachePath                  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]
// Library目录
#define kLibPath                    NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0]
// temp目录
#define kTempPath                   NSTemporaryDirectory()
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 文件 -
// Bundle
#define kMainBundle                 NSBundle.mainBundle
// NSFileManager
#define kFileManager                NSFileManager.defaultManager
// 文件是否存在
#define kFileExists(path)           [kFileManager fileExistsAtPath:(path)]
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 线程和队列 -
// GCD并发队列
#define kCONCURRENT_QUEUE           dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
// 主队列
#define kMAIN_QUEUE                 dispatch_get_main_queue()
// 当前线程
#define kThread                     NSThread.currentThread
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 强弱引用 -
// 弱引用
#define kWEAK_SELF                  __weak typeof(self) weakSelf = self
// 强引用
#define kSTRONG_SELF                __strong typeof(self) strongSelf = weakSelf
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 类型判断 -
// 是不是字典
#define kIsDictionary(obj)          [(obj) isKindOfClass:NSDictionary.class]
// 是不是数组
#define kIsArray(obj)               [(obj) isKindOfClass:NSArray.class]
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 数字转字符串 -
// 数字转字符串
#define kNumString(num)             @(num).stringValue
// 整数转字符串(照顾老代码)
#define kIntString(num)             @(num).stringValue
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 创建URL -
// 根据字符串创建URL
#define kURL(url)                   [NSURL URLWithString:(url)]
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 系统菊花 -
// 展示菊花
#define kShowNetworkIndicator       [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
// 隐藏菊花
#define kHideNetworkIndicator       [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 代码执行时间 -
// 开始计时
#define TICK                        NSDate *startTime = NSDate.date
// 结束计时
#define TOCK                        NSLog(@"***Time: %f", -[startTime timeIntervalSinceNow])
// ----------------------------------------------------------------------------------------------------------------
#endif
