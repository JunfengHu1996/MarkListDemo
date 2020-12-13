1. AppDelegate.h文件添加UIWindow属性，AppDelegate.m文件添加对应的视图控制器代码。

   ```objective-c
   // AppDelegate.h
   @property (strong, nonatomic) UIWindow * window;
   // AppDelegate.m
   - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
       // Override point for customization after application launch.
       self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
       [self.window setBackgroundColor:[UIColor whiteColor]];
       ViewController *con = [[ViewController alloc] init];
       UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:con];
       [self.window setRootViewController:nav];
       [self.window makeKeyAndVisible];
       return YES;
   }
   ```

2. AppDelegate.m里 `#pragma mark - UISceneSession lifecycle`部分的函数代码删掉（**这个很重要，不然界面还是一片黑色**）
3. Info.plist里 **Application Scene Manifest** 删掉
4. SceneDelegate.h 与 SceneDelegate.m 文件删不删都可以