# iOS9_3DTouchDemo
3D Touch 学习
===================

看了苹果的官方demo，自己也跟着敲了一遍

----------


ShortcutItem
-------------

![enter image description here](https://github.com/CorzFree/iOS9_3DTouchDemo/blob/master/Touch3DDemo/IMG_0037.PNG?raw=true)

此处我使用的是静态方式添加item
在info.list加入UIApplicationShortcutItems
![enter image description here](https://github.com/CorzFree/iOS9_3DTouchDemo/blob/master/Touch3DDemo/info.png?raw=true)

配置完后可在AppAppDelegate.m中

    - (void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler{
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Hi" message:@"My Dear" preferredStyle:UIAlertControllerStyleAlert];
    UIViewController *vc = [[UIApplication sharedApplication].delegate window].rootViewController;

    [vc presentViewController:ac animated:YES completion:nil];
}

处理点击item的事件


Peek and Pop
-------------
![enter image description here](https://github.com/CorzFree/iOS9_3DTouchDemo/blob/master/Touch3DDemo/IMG_0040.PNG?raw=true)

在控制器注册代理UIViewControllerPreviewingDelegate

    [self registerForPreviewingWithDelegate:self sourceView:self.tableView];

然后实现delegate的两个方法

    - (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    WebViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"webView"];
    return vc;
}

    - (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    [self showViewController:viewControllerToCommit sender:self];
}

来打开一个新的显示页面，不过若想要上来显示下面的菜单，还需要在WebViewController中实现

    - (NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    UIPreviewAction *item1 = [UIPreviewAction actionWithTitle:@"在safari打开" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"item1 has click");
    }];
    
    UIPreviewAction *item2 = [UIPreviewAction actionWithTitle:@"查看商城" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    UIPreviewAction *sub1 = [UIPreviewAction actionWithTitle:@"不知道叫啥名字了1" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    UIPreviewAction *sub2 = [UIPreviewAction actionWithTitle:@"不知道叫啥名字了2" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    UIPreviewActionGroup *item4 = [UIPreviewActionGroup actionGroupWithTitle:@"分组的" style:UIPreviewActionStyleDestructive actions:@[sub1,sub2]];
    
    return @[item1,item2,item4];
}
   



