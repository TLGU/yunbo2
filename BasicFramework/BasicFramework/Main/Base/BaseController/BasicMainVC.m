//
//

#import "BasicMainVC.h"
#import "NHCustomNoNetworkEmptyView.h"
#import "NHCustomLoadingAnimationView.h"
@interface BasicMainVC ()<UIGestureRecognizerDelegate>
{
    id<UIGestureRecognizerDelegate> _delegate;
}

@property (nonatomic, weak) NHCustomNoNetworkEmptyView *noNetworkEmptyView;

@property (nonatomic, weak) NHCustomLoadingAnimationView *animationView;



@end

@implementation BasicMainVC
-(instancetype)init{
    if (self=[super init ]) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor=kWhiteColor;
//    [self setHidesBottomBarWhenPushed:YES];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.navigationController.viewControllers.count > 1) {
        // 记录系统返回手势的代理
        _delegate = self.navigationController.interactivePopGestureRecognizer.delegate;
        // 设置系统返回手势的代理为当前控制器
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
   
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [self setHidesBottomBarWhenPushed:NO];
    
    // 设置系统返回手势的代理为我们刚进入控制器的时候记录的系统的返回手势代理
    self.navigationController.interactivePopGestureRecognizer.delegate = _delegate;
}


#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.navigationController.childViewControllers.count > 1;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return self.navigationController.viewControllers.count > 1;
}


#pragma mark - UIKeyboard - Notification
-(void)keyboardDidShow:(NSNotification *)aNotification
{
    
}
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    self.keyboarHeight = keyboardRect.size.height;
    
}
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    self.keyboarHeight = 0;
}



- (void)dealloc {
     [kNotificationCenter removeObserver:self];
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
    
- (void)pop {
    if (self.navigationController == nil) return ;
    [self.navigationController popViewControllerAnimated:YES];
}
    
- (void)popToRootVc {
    if (self.navigationController == nil) return ;
    [self.navigationController popToRootViewControllerAnimated:YES];
}
    
- (void)popToVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    [self.navigationController popToViewController:vc animated:YES];
}
    
- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}
    
- (void)dismissWithCompletion:(void(^)())completion {
    [self dismissViewControllerAnimated:YES completion:completion];
}
    
- (void)presentVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    [self presentVc:vc completion:nil];
}
    
- (void)presentVc:(UIViewController *)vc completion:(void (^)(void))completion {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    [self presentViewController:vc animated:YES completion:completion];
}
    
- (void)pushVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    if (vc.hidesBottomBarWhenPushed == NO) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    [self.navigationController pushViewController:vc animated:YES];
}
    
- (void)removeChildVc:(UIViewController *)childVc {
    if ([childVc isKindOfClass:[UIViewController class]] == NO) {
        return ;
    }
    [childVc.view removeFromSuperview];
    [childVc willMoveToParentViewController:nil];
    [childVc removeFromParentViewController];
}
    
- (void)addChildVc:(UIViewController *)childVc {
    if ([childVc isKindOfClass:[UIViewController class]] == NO) {
        return ;
    }
    [childVc willMoveToParentViewController:self];
    [self addChildViewController:childVc];
    [self.view addSubview:childVc.view];
    childVc.view.frame = self.view.bounds;
}
    
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    
}


///加载动画
- (NHCustomNoNetworkEmptyView *)noNetworkEmptyView {
    if (!_noNetworkEmptyView) {
        NHCustomNoNetworkEmptyView *empty = [[NHCustomNoNetworkEmptyView alloc] init];
        [self.view addSubview:empty];
        _noNetworkEmptyView = empty;
        
        WeakSelf(weakSelf);
        [empty mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.view);
        }];
        empty.customNoNetworkEmptyViewDidClickRetryHandle = ^(NHCustomNoNetworkEmptyView *emptyView) {
            [weakSelf loadData];
            
        };
    }
    return _noNetworkEmptyView;
}
    
- (void)showLoadingAnimation {
    NHCustomLoadingAnimationView *animation = [[NHCustomLoadingAnimationView alloc] init];
    [animation showInView:self.view];
    _animationView = animation;
    [self.view bringSubviewToFront:animation];
}
    
- (void)hideLoadingAnimation {
    [_animationView dismiss];
    _animationView = nil;
}
    
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.view bringSubviewToFront:self.animationView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
