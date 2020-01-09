//
//  CodingHelper.h
//  徐伟博

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>



NS_ASSUME_NONNULL_BEGIN



@interface CodingHelper : NSObject
@end



@interface CodingHelper (UICreater)
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UIView -
// 创建UIView
+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor;
// 设置圆角
+ (void)setView:(UIView *)view withCornerRadius:(CGFloat)cornerRadius;
// 设置边框宽度和颜色
+ (void)setView:(UIView *)view withBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
// 设置目标和动作
+ (void)setView:(UIView *)view withTarget:(id)target action:(SEL)action;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UIImageView -
// 创建UIImageView
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor image:(nullable UIImage *)image;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UILabel -
// 创建UILabel
+ (UILabel *)createLabelWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor text:(nullable NSString *)text lines:(NSInteger)lines font:(UIFont *)font textColor:(UIColor *)textColor align:(NSTextAlignment)align breakMode:(NSLineBreakMode)breakMode;
// 设置label行间距, 宽度保持不变, 高度会自适应到刚好容下文本
+ (void)setLabel:(UILabel *)label withLineSpace:(CGFloat)space;
// 创建属性字符串, 用于在label上显示两种字体和颜色
+ (NSAttributedString *)attributedString:(NSString *)string font:(UIFont *)font textColor:(UIColor *)textColor range:(NSRange)range;
// 根据文本, 字体大小, 行间距和文本显示宽度计算文本高度
+ (CGFloat)textHeightWithText:(nullable NSString *)text font:(UIFont *)font lineSpace:(CGFloat)space width:(CGFloat)width;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UIButton -
// 创建UIButton
+ (UIButton *)createButtonWithType:(UIButtonType)type frame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(nullable NSString *)title font:(nullable UIFont *)font titleColor:(nullable UIColor *)titleColor target:(id)target action:(SEL)action;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UITextField -
// 创建UITextField
+ (UITextField *)createTextFieldWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderStyle:(UITextBorderStyle)borderStyle placeHolder:(nullable NSString *)placeHolder text:(nullable NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor align:(NSTextAlignment)align keyboardType:(UIKeyboardType)keyboardType delegate:(nullable id<UITextFieldDelegate>)delegate;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UITextView -
// 创建UITextView
+ (UITextView *)createTextViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor text:(nullable NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor align:(NSTextAlignment)align delegate:(nullable id<UITextViewDelegate>)delegate;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UIScrollView -
// 创建UIScrollView
+ (UIScrollView *)createScrollViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor delegate:(nullable id<UIScrollViewDelegate>)delegate;
// 禁用UIScrollView的自动内边距
+ (void)disableAutomaticScrollViewInsetsForController:(nullable UIViewController *)controller scrollView:(nullable UIScrollView *)scrollView;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UITableView -
// 创建UITableView
+ (UITableView *)createTableViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor style:(UITableViewStyle)style dataSource:(nullable id<UITableViewDataSource>)dataSource delegate:(nullable id<UITableViewDelegate>)delegate;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UITableViewCell -
// 创建UITableViewCell
+ (id)createCellWithTable:(UITableView *)table reuseID:(nullable NSString *)reuseID class:(nullable Class)cellClass;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UIAlertController -
typedef void (^Block)(void);
typedef void (^TextFieldBlock)(UITextField *tf);
/**
 弹框有标题, 提示语和一个按钮, 按钮标题可自定义

 @param title 标题
 @param message 提示语
 @param sureTitle 按钮标题
 */
+ (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message sureTitle:(NSString *)sureTitle;
/**
 弹框有标题, 提示语和两个按钮, 按钮通常是"取消"(在左边)和"确定"(在右边), 按钮标题可自定义

 @param title 标题
 @param message 提示语
 @param cancelTitle "取消"按钮标题, 表示否定动作
 @param sureTitle "确定"按钮标题, 表示肯定动作
 @param destructive 是否要做警示, 如果为YES, 则"确定"按钮标题显示为红色
 @param block 点击"确定"按钮的block
 */
+ (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelTitle:(NSString *)cancelTitle sureTitle:(NSString *)sureTitle destructive:(BOOL)destructive sureBlock:(Block)block;
/**
 弹框有标题, 提示语和三个按钮(纵向排列, 两个选项, 一个"取消"), 通常用来作二选一, 按钮标题可自定义

 @param title 标题
 @param message 提示语
 @param title1 第一个选项标题
 @param title2 第二个选项标题
 @param cancelTitle "取消"按钮标题
 @param block1 第一个选项的block
 @param block2 第二个选项的block
 */
+ (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message title1:(NSString *)title1 title2:(NSString *)title2 cancelTitle:(NSString *)cancelTitle block1:(Block)block1 block2:(Block)block2;
/**
 弹框有标题, 提示语, 一个文本框, 两个按钮, 按钮通常是"取消"(在左边)和"确定"(在右边), 文本框和按钮标题都可自定义

 @param title 标题
 @param message 提示语
 @param cancelTitle "取消"按钮标题, 表示否定动作
 @param sureTitle "确定"按钮标题, 表示肯定动作
 @param conf 自定义文本框的block
 @param block 点击"确定"按钮的block
 */
+ (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelTitle:(NSString *)cancelTitle sureTitle:(NSString *)sureTitle tfConf:(nullable TextFieldBlock)conf sureBlock:(TextFieldBlock)block;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - WebView -
// 创建WebView
+ (WKWebView *)addWebViewToView:(UIView *)superView withFrame:(CGRect)frame delegate:(nullable id<WKNavigationDelegate>)delegate url:(NSString *)url;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 获取各种Controller -
// 获取rootViewController
+ (nullable UIViewController *)rootViewController;
// 获取当前正在显示的NavigationController
+ (nullable UINavigationController *)currentNavigationController;
// 获取当前正在显示的ViewController
+ (nullable UIViewController *)currentViewController;
// ----------------------------------------------------------------------------------------------------------------
@end



@interface CodingHelper (Utils)
// ----------------------------------------------------------------------------------------------------------------
// 把一个图片对象写到指定的沙盒路径
+ (void)writeImage:(UIImage *)image toFilePath:(NSString *)path;
// 字符串判空
+ (BOOL)isBlankString:(nullable NSString *)string;
// 判断手机号合法性
+ (BOOL)isValidCellphoneNumber:(nullable NSString *)aNumber;
// 汉字转大写拼音
+ (NSString *)latinStringOfMandarin:(NSString *)string;
// 日期TO字符串
+ (NSString *)stringWithFormat:(NSString *)format ofDate:(NSDate *)date;
// 字符串TO日期
+ (NSDate *)dateWithFormat:(NSString *)format ofString:(NSString *)string;
// 延时执行
+ (void)executeDelay:(CGFloat)delay block:(Block)block;
// 拨打电话
+ (void)callNumber:(NSString *)number;
// ----------------------------------------------------------------------------------------------------------------
@end



@interface CodingHelper (DeviceAdapt)
// ----------------------------------------------------------------------------------------------------------------
// 获取设备具体机型
+ (NSString *)deviceType;
// ----------------------------------------------------------------------------------------------------------------
@end



@interface CodingHelper (SafeValue)
// ----------------------------------------------------------------------------------------------------------------
// 选择非空对象
+ (id)object:(nullable id)anObj defaultObject:(id)defaultObj;
// 把某值(仅限数字和字符串)转换为字符串, 如果值不存在(nil, NSNull, 空字符串)则返回默认文字, 减少崩溃
+ (NSString *)stringOfValue:(nullable id)value defaultValue:(NSString *)dft;
// 把某值(仅限数字和字符串)转换为字符串, 如果值不存在(nil, NSNull, 空字符串)则返回空字符串, 减少崩溃
+ (NSString *)stringOfValue:(nullable id)value;
// 如果value是数组, 则原样返回, 否则返回@[]
+ (NSArray *)arrayOfValue:(nullable id)value;
// 如果value是字典, 则原样返回, 否则返回@{}
+ (NSDictionary *)dictionaryOfValue:(nullable id)value;
// ----------------------------------------------------------------------------------------------------------------
@end



@interface CodingHelper (DataSaver)
// ----------------------------------------------------------------------------------------------------------------
// 保存一个对象
+ (void)setObject:(id)anObj forKey:(NSString *)string;
// 读取一个对象
+ (nullable id)objectForKey:(NSString *)string;
// 删除一个键值对
+ (void)removeObjectForKey:(NSString *)string;
// 清空plist文件
+ (void)clear;
// ----------------------------------------------------------------------------------------------------------------
@end



@interface CodingHelper (SafeTimer)
// ----------------------------------------------------------------------------------------------------------------
// 创建并启动一个timer
+ (NSTimer *)safeTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(Block)block;
// ----------------------------------------------------------------------------------------------------------------
@end



@interface CodingHelper (Debug)
// ----------------------------------------------------------------------------------------------------------------
// 打印autoreleasepool信息
+ (void)printAutoreleasePool;
// 获取对象引用计数
+ (NSUInteger)retainCountOfObj:(id)obj;
// ----------------------------------------------------------------------------------------------------------------
@end



// ----------------------------------------------------------------------------------------------------------------
// 一些方法的C函数简化版
#pragma mark - UIView -
UIView *viewWithFrameAndBackgroundColor(CGRect frame, UIColor *color);
void setViewWithCornerRadius(UIView *view, CGFloat radius);
void setViewWithBorderWidthAndColor(UIView *view, CGFloat width, UIColor *color);
void setViewWithTargetAndAction(UIView *view, id target, SEL action);

#pragma mark - UILabel -
void setLabelWithLineSpace(UILabel *label, CGFloat space);

#pragma mark - UIScrollView -
void disableAutomaticScrollViewInsetsForControllerAndScrollView(UIViewController * _Nullable controller, UIScrollView * _Nullable scroll);

#pragma mark - 获取各种Controller -
UIViewController * _Nullable rootViewController(void);
UINavigationController * _Nullable currentNavigationController(void);
UIViewController * _Nullable currentViewController(void);

#pragma mark - Utils -
void writeImageToFilePath(UIImage *image, NSString *path);
BOOL isBlankString(NSString * _Nullable string);
BOOL isValidCellphoneNumber(NSString * _Nullable aNumber);
NSString *latinStringOfMandarin(NSString *string);
NSString *stringWithFormatOfDate(NSString *format, NSDate *date);
NSDate *dateWithFormatOfString(NSString *format, NSString *string);
void executeDelayWithBlock(CGFloat delay, Block block);
void callNumber(NSString *number);

#pragma mark - DeviceAdapt -
NSString *deviceType(void);

#pragma mark - SafeValue -
id objectOrDefaultObject(id _Nullable anObj, id defaultObj);
NSString *stringOfValueOrDefaultValue(id _Nullable value, NSString *dft);
NSString *stringOfValue(id _Nullable value);
NSArray *arrayOfValue(id _Nullable value);
NSDictionary *dictionaryOfValue(id _Nullable value);

#pragma mark - DataSaver -
void setObjectForKey(id anObj, NSString *key);
id _Nullable objectForKey(NSString *key);
void removeObjectForKey(NSString *key);
void clear(void);

#pragma mark - Debug -
void printAutoreleasePool(void);
NSInteger retainCountOfObj(id obj);
// ----------------------------------------------------------------------------------------------------------------



FOUNDATION_EXPORT NSString * const dateFormat;
FOUNDATION_EXPORT NSString * const timeFormat;

FOUNDATION_EXPORT NSString * const iPhone;
FOUNDATION_EXPORT NSString * const iPhone3G;
FOUNDATION_EXPORT NSString * const iPhone3GS;
FOUNDATION_EXPORT NSString * const iPhone4;
FOUNDATION_EXPORT NSString * const iPhone4s;
FOUNDATION_EXPORT NSString * const iPhone5;
FOUNDATION_EXPORT NSString * const iPhone5c;
FOUNDATION_EXPORT NSString * const iPhone5s;
FOUNDATION_EXPORT NSString * const iPhone6;
FOUNDATION_EXPORT NSString * const iPhone6Plus;
FOUNDATION_EXPORT NSString * const iPhone6s;
FOUNDATION_EXPORT NSString * const iPhone6sPlus;
FOUNDATION_EXPORT NSString * const iPhoneSE;
FOUNDATION_EXPORT NSString * const iPhone7;
FOUNDATION_EXPORT NSString * const iPhone7Plus;
FOUNDATION_EXPORT NSString * const iPhone8;
FOUNDATION_EXPORT NSString * const iPhone8Plus;
FOUNDATION_EXPORT NSString * const iPhoneX;
FOUNDATION_EXPORT NSString * const iPhoneXR;
FOUNDATION_EXPORT NSString * const iPhoneXS;
FOUNDATION_EXPORT NSString * const iPhoneXSMax;
FOUNDATION_EXPORT NSString * const iPhone11;
FOUNDATION_EXPORT NSString * const iPhone11Pro;
FOUNDATION_EXPORT NSString * const iPhone11ProMax;

FOUNDATION_EXPORT NSString * const iPodTouch;
FOUNDATION_EXPORT NSString * const iPodTouch2;
FOUNDATION_EXPORT NSString * const iPodTouch3;
FOUNDATION_EXPORT NSString * const iPodTouch4;
FOUNDATION_EXPORT NSString * const iPodTouch5;
FOUNDATION_EXPORT NSString * const iPodTouch6;
FOUNDATION_EXPORT NSString * const iPodTouch7;

FOUNDATION_EXPORT NSString * const iPad;
FOUNDATION_EXPORT NSString * const iPad2;
FOUNDATION_EXPORT NSString * const iPad3;
FOUNDATION_EXPORT NSString * const iPad4;
FOUNDATION_EXPORT NSString * const iPad5;
FOUNDATION_EXPORT NSString * const iPad6;
FOUNDATION_EXPORT NSString * const iPad7;

FOUNDATION_EXPORT NSString * const iPadAir;
FOUNDATION_EXPORT NSString * const iPadAir2;
FOUNDATION_EXPORT NSString * const iPadAir3;

FOUNDATION_EXPORT NSString * const iPadPro12_9;
FOUNDATION_EXPORT NSString * const iPadPro9_7;
FOUNDATION_EXPORT NSString * const iPadPro12_9_2;
FOUNDATION_EXPORT NSString * const iPadPro10_5;
FOUNDATION_EXPORT NSString * const iPadPro11_0;
FOUNDATION_EXPORT NSString * const iPadPro12_9_3;

FOUNDATION_EXPORT NSString * const iPadMini;
FOUNDATION_EXPORT NSString * const iPadMini2;
FOUNDATION_EXPORT NSString * const iPadMini3;
FOUNDATION_EXPORT NSString * const iPadMini4;
FOUNDATION_EXPORT NSString * const iPadMini5;

FOUNDATION_EXPORT NSString * const iOSSimulator;



NS_ASSUME_NONNULL_END


