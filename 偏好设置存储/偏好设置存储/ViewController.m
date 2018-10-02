//
//  ViewController.m
//  偏好设置存储
//
//  Created by apple on 16/6/28.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 偏好设置存储一般存储简单的软件参数配置，比如是否自动登录等等，而不能存储大批量的数据；
 这种存储方式可以存储一些Foundation框架中的对象类型（数组、字典等）的数据，同时也可以存储非对象类型（基本数据类型）的数据，只不过在存储非对象类型的数据的时候在系统编译的时候系统会自动把非对象类型的数据转换为对象类型的数据存储在plist文件中，例如：在编译过程中系统会把float类型的数据转换为NSNumber类型的数据。但是这种存储方式不能存储自定义对象类型的数据，所以它具有一定的局限性；
 这种存储方式是把要存储的数据以plist文件的方式存储在手机沙盒中的Library文件夹中的Preferences文件夹里面。
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *home = NSHomeDirectory();
    NSLog(@"home = %@", home);
}

- (IBAction)save
{
    //利用NSUserDefaults这个类就能直接访问偏好设置存储
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    /**
     偏好设置存储一般以键值对的形式存储数据，最后在沙盒中的plist文件中以字典的方式呈现；
     除了存储Foundation框架中的对象类型外，也可以存储非对象类型（基本数据类型），只不过在编译的时候系统会把非对象类型转换成它所对应的对象类型。在下面编译的时候会把NSInteger类型的数据转换成NSNumber类型的数据。
     */
    [defaults setObject:@"www" forKey:@"test"];
    [defaults setObject:@"ok" forKey:@"qqq"];
    [defaults setInteger:10 forKey:@"age"];
    [defaults setBool:YES forKey:@"auto_login"];
    
    /**
     在iOS7之前，内存里面的数据是随机同步写入到沙盒里面的，所以在iOS7之前应该撰写下面的一句代码手动把内存中的数据写入到沙盒中。在iOS7之后系统会立即把内存中的数据同步到沙盒中，所以在iOS7之后就不用再撰写下面的一句代码了。
     */
    [defaults synchronize];
}

- (IBAction)read
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *string = [defaults objectForKey:@"test"];
    BOOL autoLogin = [defaults boolForKey:@"auto_login"];
    
    NSLog(@"string = %@, autoLogin = %d", string, autoLogin);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
