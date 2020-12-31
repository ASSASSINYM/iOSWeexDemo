//
//  ViewController.m
//  iOSWeexDemo
//
//  Created by ASSASSIN on 2020/12/31.
//

#import "ViewController.h"
#import <WXSDKInstance.h>

@interface ViewController ()

//WXSDKInstance 属性

@property(nonatomic, strong) WXSDKInstance *instance;

// weex 视图

@property(nonatomic, strong)UIView *weexView;

// URL属性(用于指定加载js的URL, 一般申明在接口中)

@property (nonatomic, strong) NSURL *url;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // self.view.backgroundColor = [UIColor redColor];
    
    self.title = @"Hello Weex";
    
    self.instance = [[WXSDKInstance alloc] init];
    
    // 设置weexInstance所在的控制器
    
    self.instance.viewController = self;
    
    // 设置weexInstance的frame
    
    self.instance.frame = self.view.frame;
    
    // 设置weexInstance用于渲染JS的url路径
    
   // [self.instance renderWithURL:self.url options:@{@"bundleUrl":[self.url absoluteString]} data:nil];
    
    // 为避免循环引用 声明一个弱指针 self
    
    __weak typeof(self) weakSelf = self;
    
    // 设置weexInstance创建完的回调
    
    self.instance.onCreate = ^(UIView *view) {
        
        [weakSelf.weexView removeFromSuperview];
        
        weakSelf.weexView = view;
        
        weakSelf.weexView.backgroundColor = [UIColor redColor];
        
        [weakSelf.view addSubview:weakSelf.weexView];
        
    };
    
    // 设置weexInstance出错时的回调
    
    self.instance.onFailed = ^( NSError *error) {
        
        NSLog(@"处理失败%@", error);
        
    };
    
    // 设置weexInstance渲染完成时的回调
    
    self.instance.renderFinish = ^(UIView *view) {
        
        NSLog(@"渲染完成");
        
    };

}


#pragma mark - 懒加载

- (NSURL *)url {

    if (!_url) {

        _url = [NSURL URLWithString:@"http://ygz001.oicp.net/app.weex.js"];

    }

    return _url;

}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.

}


@end
