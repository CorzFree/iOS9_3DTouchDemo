//
//  WebViewController.m
//  Touch3DDemo
//
//  Created by crw on 10/31/15.
//  Copyright © 2015 crw. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController (){
    UIWebView *view;
}

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    view = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    
    NSString* webStringURL = [@"http://m.csskw.com/shop/" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [view loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:webStringURL
                                                         ]]];
}

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
