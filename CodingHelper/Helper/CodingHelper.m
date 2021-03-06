//
//  CodingHelper.m
//  徐伟博

#import "CodingHelper.h"
#import "sys/utsname.h"



NSString * const dateFormat      = @"yyyy-MM-dd";
NSString * const timeFormat      = @"yyyy-MM-dd  hh:mm:ss";

NSString * const iPhone          = @"iPhone";
NSString * const iPhone3G        = @"iPhone 3G";
NSString * const iPhone3GS       = @"iPhone 3GS";
NSString * const iPhone4         = @"iPhone 4";
NSString * const iPhone4s        = @"iPhone 4s";
NSString * const iPhone5         = @"iPhone 5";
NSString * const iPhone5c        = @"iPhone 5c";
NSString * const iPhone5s        = @"iPhone 5s";
NSString * const iPhone6         = @"iPhone 6";
NSString * const iPhone6Plus     = @"iPhone 6 Plus";
NSString * const iPhone6s        = @"iPhone 6s";
NSString * const iPhone6sPlus    = @"iPhone 6s Plus";
NSString * const iPhoneSE        = @"iPhone SE";
NSString * const iPhone7         = @"iPhone 7";
NSString * const iPhone7Plus     = @"iPhone 7 Plus";
NSString * const iPhone8         = @"iPhone 8";
NSString * const iPhone8Plus     = @"iPhone 8 Plus";
NSString * const iPhoneX         = @"iPhone X";
NSString * const iPhoneXR        = @"iPhone XR";
NSString * const iPhoneXS        = @"iPhone XS";
NSString * const iPhoneXSMax     = @"iPhone XS Max";
NSString * const iPhone11        = @"iPhone 11";
NSString * const iPhone11Pro     = @"iPhone 11 Pro";
NSString * const iPhone11ProMax  = @"iPhone 11 Pro Max";

NSString * const iPodTouch       = @"iPod touch";
NSString * const iPodTouch2      = @"iPod touch (2nd generation)";
NSString * const iPodTouch3      = @"iPod touch (3rd generation)";
NSString * const iPodTouch4      = @"iPod touch (4th generation)";
NSString * const iPodTouch5      = @"iPod touch (5th generation)";
NSString * const iPodTouch6      = @"iPod touch (6th generation)";
NSString * const iPodTouch7      = @"iPod touch (7th generation)";

NSString * const iPad            = @"iPad";
NSString * const iPad2           = @"iPad 2";
NSString * const iPad3           = @"iPad (3rd generation)";
NSString * const iPad4           = @"iPad (4th generation)";
NSString * const iPad5           = @"iPad (5th generation)";
NSString * const iPad6           = @"iPad (6th generation)";
NSString * const iPad7           = @"iPad (7th generation)";

NSString * const iPadAir         = @"iPad Air";
NSString * const iPadAir2        = @"iPad Air 2";
NSString * const iPadAir3        = @"iPad Air (3rd generation)";

NSString * const iPadPro12_9     = @"iPad Pro (12.9-inch)";
NSString * const iPadPro9_7      = @"iPad Pro (9.7-inch)";
NSString * const iPadPro12_9_2   = @"iPad Pro (12.9-inch) (2nd generation)";
NSString * const iPadPro10_5     = @"iPad Pro (10.5-inch)";
NSString * const iPadPro11_0     = @"iPad Pro (11-inch)";
NSString * const iPadPro12_9_3   = @"iPad Pro (12.9-inch) (3rd generation)";

NSString * const iPadMini        = @"iPad mini";
NSString * const iPadMini2       = @"iPad mini 2";
NSString * const iPadMini3       = @"iPad mini 3";
NSString * const iPadMini4       = @"iPad mini 4";
NSString * const iPadMini5       = @"iPad mini (5th generation)";

NSString * const iOSSimulator    = @"iOS Simulator";



extern void _objc_autoreleasePoolPrint(void);
uintptr_t _objc_rootRetainCount(id obj);



@implementation CodingHelper
@end



@implementation CodingHelper (UICreater)

#pragma mark - UIView -

+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = backgroundColor;
    return view;
}

+ (void)setView:(UIView *)view withCornerRadius:(CGFloat)cornerRadius {
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = cornerRadius;
}

+ (void)setView:(UIView *)view withBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    view.layer.masksToBounds = YES;
    view.layer.borderWidth = borderWidth;
    view.layer.borderColor = borderColor.CGColor;
}

+ (void)setView:(UIView *)view withTarget:(id)target action:(SEL)action {
    view.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [view addGestureRecognizer:tap];
}

#pragma mark - UIImageView -

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor image:(UIImage *)image {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.backgroundColor = backgroundColor;
    imageView.image = image;
    return imageView;
}

#pragma mark - UILabel -

+ (UILabel *)createLabelWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor text:(NSString *)text lines:(NSInteger)lines font:(UIFont *)font textColor:(UIColor *)textColor align:(NSTextAlignment)align breakMode:(NSLineBreakMode)breakMode {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = backgroundColor;
    label.text = text;
    label.numberOfLines = lines;
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = align;
    label.lineBreakMode = breakMode;
    return label;
}

+ (void)setLabel:(UILabel *)label withLineSpace:(CGFloat)space {
    const CGFloat originWidth = label.frame.size.width;
    const NSTextAlignment originalAlignment = label.textAlignment;
    const NSLineBreakMode originalBreakMode = label.lineBreakMode;
    
    NSString *text = [self stringOfValue:label.text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = space;
    NSAttributedString *attriStr = [[NSAttributedString alloc] initWithString:text attributes:@{NSParagraphStyleAttributeName: style}];
    label.attributedText = attriStr;
    [label sizeToFit];
    
    CGFloat height = label.frame.size.height;
    BOOL onlyHasOneLine = 0 < height && height < label.font.pointSize * 2 + space;
    if (onlyHasOneLine) {
        height = label.font.pointSize;
        label.attributedText = nil;
        label.text = text;
    }
    label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, originWidth, height);
    label.textAlignment = originalAlignment;
    label.lineBreakMode = originalBreakMode;
}

+ (NSAttributedString *)attributedString:(NSString *)string font:(UIFont *)font textColor:(UIColor *)textColor range:(NSRange)range {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[self stringOfValue:string]];
    NSDictionary *dict = @{NSFontAttributeName: font, NSForegroundColorAttributeName: textColor};
    [str addAttributes:dict range:range];
    return str.copy;
}

+ (CGFloat)textHeightWithText:(NSString *)text font:(UIFont *)font lineSpace:(CGFloat)space width:(CGFloat)width {
    if ([self isBlankString:text]) {
        return 0;
    }
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = space;
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName: font, NSParagraphStyleAttributeName: style}
                                     context:nil];
    CGFloat height = rect.size.height;
    if (height < font.pointSize * 2 + space) {
        height = font.pointSize;
    }
    return height;
}

#pragma mark - UIButton -

+ (UIButton *)createButtonWithType:(UIButtonType)type frame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = frame;
    button.backgroundColor = backgroundColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma mark - UITextField -

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderStyle:(UITextBorderStyle)borderStyle placeHolder:(NSString *)placeHolder text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor align:(NSTextAlignment)align keyboardType:(UIKeyboardType)keyboardType delegate:(id<UITextFieldDelegate>)delegate {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.backgroundColor = backgroundColor;
    textField.borderStyle = borderStyle;
    textField.placeholder = placeHolder;
    textField.text = text;
    textField.font = font;
    textField.textColor = textColor;
    textField.textAlignment = align;
    textField.keyboardType = keyboardType;
    textField.delegate = delegate;
    return textField;
}

#pragma mark - UITextView -

+ (UITextView *)createTextViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor align:(NSTextAlignment)align delegate:(id<UITextViewDelegate>)delegate {
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.backgroundColor = backgroundColor;
    textView.text = text;
    textView.font = font;
    textView.textColor = textColor;
    textView.textAlignment = align;
    textView.delegate = delegate;
    return textView;
}

#pragma mark - UIScrollView -

+ (UIScrollView *)createScrollViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor delegate:(id<UIScrollViewDelegate>)delegate {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.backgroundColor = backgroundColor;
    scrollView.delegate = delegate;
    return scrollView;
}

+ (void)disableAutomaticScrollViewInsetsForController:(UIViewController *)controller scrollView:(UIScrollView *)scrollView {
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        controller.automaticallyAdjustsScrollViewInsets = NO;
    }
}

#pragma mark - UITableView -
// 有了这个, 项目里就不需要BaseTableView了
+ (UITableView *)createTableViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor style:(UITableViewStyle)style dataSource:(id<UITableViewDataSource>)dataSource delegate:(id<UITableViewDelegate>)delegate {
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    tableView.backgroundColor = backgroundColor;
    tableView.dataSource = dataSource;
    tableView.delegate = delegate;
    // 比较普遍的外观配置
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    // 避免iOS11的各种问题
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    return tableView;
}

#pragma mark - UITableViewCell -
// 仅仅负责创建和复用cell, 进一步的设置在BaseTableViewCell中进行(不同项目可能有不同设置, 而且可以添加属性和方法)
+ (id)createCellWithTable:(UITableView *)table reuseID:(NSString *)reuseID class:(Class)cellClass {
    if (!cellClass) {
        cellClass = UITableViewCell.class;
    }
    id acell = [table dequeueReusableCellWithIdentifier:reuseID];
    if (!acell) {
        acell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    return acell;
}

#pragma mark - UIAlertController -

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message sureTitle:(NSString *)sureTitle {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    
    [[self rootViewController] presentViewController:alert animated:YES completion:nil];
}

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle sureTitle:(NSString *)sureTitle destructive:(BOOL)destructive sureBlock:(Block)block {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action1];
    
    UIAlertActionStyle style = destructive ? UIAlertActionStyleDestructive : UIAlertActionStyleDefault;
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:sureTitle style:style handler:^(UIAlertAction * _Nonnull action) {
        if (block) {
            block();
        }
    }];
    [alert addAction:action2];
    
    [[self rootViewController] presentViewController:alert animated:YES completion:nil];
}

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message title1:(NSString *)title1 title2:(NSString *)title2 cancelTitle:(NSString *)cancelTitle block1:(Block)block1 block2:(Block)block2 {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:title1 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block1) {
            block1();
        }
    }];
    [alert addAction:action1];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:title2 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block2) {
            block2();
        }
    }];
    [alert addAction:action2];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action3];
    
    [[self rootViewController] presentViewController:alert animated:YES completion:nil];
}

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle sureTitle:(NSString *)sureTitle tfConf:(TextFieldBlock)conf sureBlock:(TextFieldBlock)block {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        if (conf) {
            conf(textField);
        }
    }];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action1];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block) {
            UITextField *tf = alert.textFields[0];
            block(tf);
        }
    }];
    [alert addAction:action2];
    
    [[self rootViewController] presentViewController:alert animated:YES completion:nil];
}

#pragma mark - WebView -

+ (WKWebView *)addWebViewToView:(UIView *)superView withFrame:(CGRect)frame delegate:(id<WKNavigationDelegate>)delegate url:(NSString *)url {
    WKWebView *webView = [[WKWebView alloc] initWithFrame:frame];
    webView.navigationDelegate = delegate;
    [superView addSubview:webView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [webView loadRequest:request];
    
    return webView;
}

#pragma mark - 获取各种Controller -

+ (UIViewController *)rootViewController {
    return UIApplication.sharedApplication.keyWindow.rootViewController;
}

+ (UINavigationController *)currentNavigationController {
    UIViewController *rootViewController = [self rootViewController];
    if ([rootViewController isKindOfClass:UINavigationController.class]) {
        return (UINavigationController *)rootViewController;
    } else if ([rootViewController isKindOfClass:UITabBarController.class]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        UIViewController *selectedController = tabBarController.selectedViewController;
        return [selectedController isKindOfClass:UINavigationController.class] ? (UINavigationController *)selectedController : nil;
    } else {
        return nil;
    }
}

+ (UIViewController *)currentViewController {
    return [self topControllerForController:[self rootViewController]];
}

+ (UIViewController *)topControllerForController:(UIViewController *)controller {
    if (!controller) {
        return nil;
    }
    if (controller.presentedViewController) {
        return [self topControllerForController:controller.presentedViewController];
    } else if ([controller isKindOfClass:UINavigationController.class]) {
        UINavigationController *navigationController = (UINavigationController *)controller;
        return [self topControllerForController:navigationController.topViewController];
    } else if ([controller isKindOfClass:UITabBarController.class]) {
        UITabBarController *tabBarController = (UITabBarController *)controller;
        return [self topControllerForController:tabBarController.selectedViewController];
    } else {
        return controller;
    }
}

@end



@implementation CodingHelper (Utils)

+ (void)writeImage:(UIImage *)image toFilePath:(NSString *)path {
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:path atomically:YES];
}

+ (BOOL)isBlankString:(NSString *)stringOrNSNull {
    if (!stringOrNSNull) {
        return YES;
    }
    if ([stringOrNSNull isKindOfClass:NSNull.class]) {
        return YES;
    }
    if (!stringOrNSNull.length) {
        return YES;
    }
    NSCharacterSet *whitespaceAndNewline = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedString = [stringOrNSNull stringByTrimmingCharactersInSet:whitespaceAndNewline];
    if (!trimmedString.length) {
        return YES;
    }
    return NO;
}

+ (BOOL)isValidCellphoneNumber:(NSString *)aNumber {
    // 宁滥勿缺, 只判断前2位, 第一位是1, 第二位: 移动345789, 联通35678, 电信35789, 2019-01-25更新
    NSString *mobileRegex = @"1[3456789]\\d{9}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileRegex];
    return [predicate evaluateWithObject:aNumber];
}

+ (NSString *)latinStringOfMandarin:(NSString *)string {
    NSMutableString *preString = [string mutableCopy];
    CFStringTransform((CFMutableStringRef)preString, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)preString, NULL, kCFStringTransformStripDiacritics, NO);
    return [[preString stringByReplacingOccurrencesOfString:@" " withString:@""] uppercaseString];
}

+ (NSString *)stringWithFormat:(NSString *)format ofDate:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

+ (NSDate *)dateWithFormat:(NSString *)format ofString:(NSString *)string {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    NSDate *date = [formatter dateFromString:string];
    return date;
}

+ (void)executeDelay:(CGFloat)delay block:(Block)block {
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), block);
}

+ (void)callNumber:(NSString *)number {
    UIWebView *dialView = [[UIWebView alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]];
    [dialView loadRequest:[NSURLRequest requestWithURL:url]];
    [UIApplication.sharedApplication.keyWindow addSubview:dialView];
}

@end



@implementation CodingHelper (DeviceAdapt)

// https://www.theiphonewiki.com/wiki/Models
+ (NSString *)deviceType {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    NSDictionary *dict = @{
        @"iPhone1,1": iPhone,
        @"iPhone1,2": iPhone3G,
        @"iPhone2,1": iPhone3GS,
        @"iPhone3,1": iPhone4,
        @"iPhone3,2": iPhone4,
        @"iPhone3,3": iPhone4,
        @"iPhone4,1": iPhone4s,
        @"iPhone5,1": iPhone5,
        @"iPhone5,2": iPhone5,
        @"iPhone5,3": iPhone5c,
        @"iPhone5,4": iPhone5c,
        @"iPhone6,1": iPhone5s,
        @"iPhone6,2": iPhone5s,
        @"iPhone7,2": iPhone6,
        @"iPhone7,1": iPhone6Plus,
        @"iPhone8,1": iPhone6s,
        @"iPhone8,2": iPhone6sPlus,
        @"iPhone8,4": iPhoneSE,
        @"iPhone9,1": iPhone7,
        @"iPhone9,3": iPhone7,
        @"iPhone9,2": iPhone7Plus,
        @"iPhone9,4": iPhone7Plus,
        @"iPhone10,1": iPhone8,
        @"iPhone10,4": iPhone8,
        @"iPhone10,2": iPhone8Plus,
        @"iPhone10,5": iPhone8Plus,
        @"iPhone10,3": iPhoneX,
        @"iPhone10,6": iPhoneX,
        @"iPhone11,8": iPhoneXR,
        @"iPhone11,2": iPhoneXS,
        @"iPhone11,4": iPhoneXSMax,
        @"iPhone11,6": iPhoneXSMax,
        @"iPhone12,1": iPhone11,
        @"iPhone12,3": iPhone11Pro,
        @"iPhone12,5": iPhone11ProMax,
        
        @"iPod1,1": iPodTouch,
        @"iPod2,1": iPodTouch2,
        @"iPod3,1": iPodTouch3,
        @"iPod4,1": iPodTouch4,
        @"iPod5,1": iPodTouch5,
        @"iPod7,1": iPodTouch6,
        @"iPod9,1": iPodTouch7,
        
        @"iPad1,1": iPad,
        @"iPad2,1": iPad2,
        @"iPad2,2": iPad2,
        @"iPad2,3": iPad2,
        @"iPad2,4": iPad2,
        @"iPad3,1": iPad3,
        @"iPad3,2": iPad3,
        @"iPad3,3": iPad3,
        @"iPad3,4": iPad4,
        @"iPad3,5": iPad4,
        @"iPad3,6": iPad4,
        @"iPad6,11": iPad5,
        @"iPad6,12": iPad5,
        @"iPad7,5": iPad6,
        @"iPad7,6": iPad6,
        @"iPad7,11": iPad7,
        @"iPad7,12": iPad7,
        
        @"iPad4,1": iPadAir,
        @"iPad4,2": iPadAir,
        @"iPad4,3": iPadAir,
        @"iPad5,3": iPadAir2,
        @"iPad5,4": iPadAir2,
        @"iPad11,3": iPadAir3,
        @"iPad11,4": iPadAir3,
        
        @"iPad6,7": iPadPro12_9,
        @"iPad6,8": iPadPro12_9,
        @"iPad6,3": iPadPro9_7,
        @"iPad6,4": iPadPro9_7,
        @"iPad7,1": iPadPro12_9_2,
        @"iPad7,2": iPadPro12_9_2,
        @"iPad7,3": iPadPro10_5,
        @"iPad7,4": iPadPro10_5,
        @"iPad8,1": iPadPro11_0,
        @"iPad8,2": iPadPro11_0,
        @"iPad8,3": iPadPro11_0,
        @"iPad8,4": iPadPro11_0,
        @"iPad8,5": iPadPro12_9_3,
        @"iPad8,6": iPadPro12_9_3,
        @"iPad8,7": iPadPro12_9_3,
        @"iPad8,8": iPadPro12_9_3,
        
        @"iPad2,5": iPadMini,
        @"iPad2,6": iPadMini,
        @"iPad2,7": iPadMini,
        @"iPad4,4": iPadMini2,
        @"iPad4,5": iPadMini2,
        @"iPad4,6": iPadMini2,
        @"iPad4,7": iPadMini3,
        @"iPad4,8": iPadMini3,
        @"iPad4,9": iPadMini3,
        @"iPad5,1": iPadMini4,
        @"iPad5,2": iPadMini4,
        @"iPad11,1": iPadMini5,
        @"iPad11,2": iPadMini5,
        
        @"i386": iOSSimulator,
        @"x86_64": iOSSimulator
    };
    
    return dict[deviceString];
}

@end



@implementation CodingHelper (SafeValue)

+ (id)object:(id)anObj defaultObject:(id)defaultObj {
    BOOL isNilOrNull = (!anObj) || [anObj isKindOfClass:NSNull.class];
    return isNilOrNull ? defaultObj : anObj;
}

+ (NSString *)stringOfValue:(id)value defaultValue:(NSString *)dft {
    if (!value) {
        return dft;
    }
    if ([value isKindOfClass:NSNull.class]) {
        return dft;
    }
    NSString *valueStr = [NSString stringWithFormat:@"%@", value];
    if (!valueStr.length) {
        return dft;
    }
    NSCharacterSet *whitespaceAndNewline = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedString = [valueStr stringByTrimmingCharactersInSet:whitespaceAndNewline];
    if (!trimmedString.length) {
        return dft;
    }
    return valueStr;
}

+ (NSString *)stringOfValue:(id)value {
    return [self stringOfValue:value defaultValue:@""];
}

+ (NSArray *)arrayOfValue:(nullable id)value {
    return [value isKindOfClass:NSArray.class] ? value : @[];
}

+ (NSDictionary *)dictionaryOfValue:(nullable id)value {
    return [value isKindOfClass:NSDictionary.class] ? value : @{};
}

@end



@implementation CodingHelper (DataSaver)

/*
 Writes a property list representation of the contents of the dictionary to a given path.
 This method recursively validates that all the contained objects are property list objects (instances of NSData, NSDate, NSNumber, NSString, NSArray, or NSDictionary) before writing out the file, and returns NO if all the objects are not property list objects, since the resultant file would not be a valid property list.
 If the dictionary’s contents are all property list objects, the file written by this method can be used to initialize a new dictionary with the class method dictionaryWithContentsOfFile: or the instance method initWithContentsOfFile:.
 */

+ (NSString *)dictPath {
    NSString *libPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    NSString *dictPath = [libPath stringByAppendingPathComponent:@"sundry.plist"];
    if (![NSFileManager.defaultManager fileExistsAtPath:dictPath]) {
        [[NSMutableDictionary dictionary] writeToFile:dictPath atomically:YES];
    }
    return dictPath;
}

+ (NSMutableDictionary *)readDict {
    NSLog(@"%@", [self dictPath]);
    return [NSMutableDictionary dictionaryWithContentsOfFile:[self dictPath]];
}

+ (void)writeDict:(NSMutableDictionary *)aDict {
    [aDict writeToFile:[self dictPath] atomically:YES];
}

+ (void)setObject:(id)anObj forKey:(NSString *)string {
    NSMutableDictionary *dict = [self readDict];
    [dict setObject:anObj forKey:string];
    [self writeDict:dict];
}

+ (id)objectForKey:(NSString *)string {
    return [[self readDict] objectForKey:string];
}

+ (void)removeObjectForKey:(NSString *)string {
    NSMutableDictionary *dict = [self readDict];
    [dict removeObjectForKey:string];
    [self writeDict:dict];
}

+ (void)clear {
    NSMutableDictionary *dict = [self readDict];
    [dict removeAllObjects];
    [self writeDict:dict];
}

@end



@implementation CodingHelper (SafeTimer)

+ (NSTimer *)safeTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(Block)block {
    return [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(blockInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)blockInvoke:(NSTimer *)timer {
    Block block = timer.userInfo;
    if (block) {
        block();
    }
}

@end



@implementation CodingHelper (Debug)

+ (void)printAutoreleasePool {
    _objc_autoreleasePoolPrint();
}

+ (NSUInteger)retainCountOfObj:(id)obj {
    return _objc_rootRetainCount(obj);
}

@end



#pragma mark - UIView -

UIView *viewWithFrameAndBackgroundColor(CGRect frame, UIColor *color) {
    return [CodingHelper createViewWithFrame:frame backgroundColor:color];
}

void setViewWithCornerRadius(UIView *view, CGFloat radius) {
    [CodingHelper setView:view withCornerRadius:radius];
}

void setViewWithBorderWidthAndColor(UIView *view, CGFloat width, UIColor *color) {
    [CodingHelper setView:view withBorderWidth:width borderColor:color];
}

void setViewWithTargetAndAction(UIView *view, id target, SEL action) {
    [CodingHelper setView:view withTarget:target action:action];
}

#pragma mark - UILabel -

void setLabelWithLineSpace(UILabel *label, CGFloat space) {
    [CodingHelper setLabel:label withLineSpace:space];
}

#pragma mark - UIScrollView -

void disableAutomaticScrollViewInsetsForControllerAndScrollView(UIViewController * _Nullable controller, UIScrollView * _Nullable scroll) {
    [CodingHelper disableAutomaticScrollViewInsetsForController:controller scrollView:scroll];
}

#pragma mark - 获取各种Controller -

UIViewController * _Nullable rootViewController(void) {
    return CodingHelper.rootViewController;
}

UINavigationController * _Nullable currentNavigationController(void) {
    return CodingHelper.currentNavigationController;
}

UIViewController * _Nullable currentViewController(void) {
    return CodingHelper.currentViewController;
}

#pragma mark - Utils -

void writeImageToFilePath(UIImage *image, NSString *path) {
    [CodingHelper writeImage:image toFilePath:path];
}

BOOL isBlankString(NSString * _Nullable string) {
    return [CodingHelper isBlankString:string];
}

BOOL isValidCellphoneNumber(NSString * _Nullable aNumber) {
    return [CodingHelper isValidCellphoneNumber:aNumber];
}

NSString *latinStringOfMandarin(NSString *string) {
    return [CodingHelper latinStringOfMandarin:string];
}

NSString *stringWithFormatOfDate(NSString *format, NSDate *date) {
    return [CodingHelper stringWithFormat:format ofDate:date];
}

NSDate *dateWithFormatOfString(NSString *format, NSString *string) {
    return [CodingHelper dateWithFormat:format ofString:string];
}

void executeDelayWithBlock(CGFloat delay, Block block) {
    [CodingHelper executeDelay:delay block:block];
}

void callNumber(NSString *number) {
    [CodingHelper callNumber:number];
}

#pragma mark - DeviceAdapt -

NSString *deviceType(void) {
    return CodingHelper.deviceType;
}

#pragma mark - SafeValue -

id objectOrDefaultObject(id _Nullable anObj, id defaultObj) {
    return [CodingHelper object:anObj defaultObject:defaultObj];
}

NSString *stringOfValueOrDefaultValue(id _Nullable value, NSString *dft) {
    return [CodingHelper stringOfValue:value defaultValue:dft];
}

NSString *stringOfValue(id _Nullable value) {
    return [CodingHelper stringOfValue:value];
}

NSArray *arrayOfValue(id _Nullable value) {
    return [CodingHelper arrayOfValue:value];
}

NSDictionary *dictionaryOfValue(id _Nullable value) {
    return [CodingHelper dictionaryOfValue:value];
}

#pragma mark - DataSaver -

void setObjectForKey(id anObj, NSString *key) {
    [CodingHelper setObject:anObj forKey:key];
}

id _Nullable objectForKey(NSString *key) {
    return [CodingHelper objectForKey:key];
}

void removeObjectForKey(NSString *key) {
    [CodingHelper removeObjectForKey:key];
}

void clear(void) {
    [CodingHelper clear];
}

#pragma mark - Debug -

void printAutoreleasePool(void) {
    [CodingHelper printAutoreleasePool];
}

NSInteger retainCountOfObj(id obj) {
    return [CodingHelper retainCountOfObj:obj];
}
