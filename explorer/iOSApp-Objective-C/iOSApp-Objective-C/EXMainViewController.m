//
//  EXMainViewController.m
//  iOSApp-Objective-C
//
//  Created by 聂高涛 on 2021/12/28.
//

#import "EXMainViewController.h"
#import "NXAsyncableLabel.h"
#import "clang-trace-pc.h"
#import "EXDetailViewController.h"


@interface EXMainViewController ()
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *nickname;
@end


@implementation EXMainViewController
+(void)initialize{
    
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%s-%@", __func__, NSStringFromSelector(sel));
    return [super resolveInstanceMethod:sel];
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    NSLog(@"%s-%@", __func__, NSStringFromSelector(sel));
    return [super resolveClassMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"%s-%@", __func__, NSStringFromSelector(aSelector));
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSLog(@"%s-%@", __func__, NSStringFromSelector(aSelector));
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%s-%@", __func__, NSStringFromSelector(anInvocation.selector));
    //[super forwardInvocation:anInvocation];
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"EXMainViewController";
    
    
    self.name = @"NX";
    self.contentView.backgroundColor = UIColor.grayColor;
//    [self test1];
//    [MyClass swiftTest1];
    
    [self performSelector:@selector(aaa)];
    return;
    
    NXAsyncableLabel *label = [[NXAsyncableLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.text = @"NXAsyncableLabel";
    [self.view addSubview:label];
    
    {
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        //backgroundView.backgroundColor = UIColor.whiteColor;//加背景色离屏渲染，不加不回导致离屏渲染
        //backgroundView.layer.backgroundColor = UIColor.whiteColor.CGColor;
        backgroundView.layer.shouldRasterize = true;
        [self.contentView addSubview:backgroundView];
    }
    
    {
        UIView *backgroundView =  [[UIView alloc] initWithFrame:CGRectMake(0, 40, 200, 40)];
        //backgroundView.backgroundColor = UIColor.redColor;
        backgroundView.layer.cornerRadius = 20;
        backgroundView.layer.masksToBounds = true;
        
        backgroundView.layer.mask = [CALayer layer];
        backgroundView.layer.mask.backgroundColor = UIColor.whiteColor.CGColor;
        backgroundView.layer.mask.frame = CGRectMake(0, 0, 200, 40);
        [self.contentView addSubview:backgroundView];
    }
    
    {
//        UIView *backgroundView =  [[UIView alloc] initWithFrame:CGRectMake(0, 80, 200, 40)];
//        backgroundView.backgroundColor = UIColor.whiteColor;
    //    backgroundView.layer.cornerRadius = 20;
    //    backgroundView.layer.masksToBounds = true;
        //backgroundView.layer.mask = [CALayer layer];
        //backgroundView.layer.mask.backgroundColor = UIColor.redColor.CGColor;
        //backgroundView.layer.mask.frame = CGRectMake(0, 0, 200, 20);
//        backgroundView.layer.shouldRasterize = true;
//        [self.contentView addSubview:backgroundView];
        
    }
}


- (void)test1{
    test2();
}

void test2(void){
    void(^myblock)(void) = ^(){
    };
    myblock();
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSMutableArray <NSString *>*array = [NSMutableArray array];
    
    EXDetailViewController *vc = [[EXDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    return;;
    while (YES) {
        SYNode *node = OSAtomicDequeue(&symbolList, offsetof(SYNode, next));
        if(node == NULL){
            break;
        }
        
        Dl_info info;
        dladdr(node->pc, &info);
        NSString *name = @(info.dli_sname);
        if([name hasPrefix:@"+["] || [name hasPrefix:@"-["]){
            //OC方法
            [array addObject:name];
        }
        else {
            //函数
            [array addObject:[@"_" stringByAppendingString:name]];
        }
    }
    NSMutableArray *funcs = [NSMutableArray array];
    for(NSString *name in [array reverseObjectEnumerator].allObjects ) {
        if(![funcs containsObject:name]){
            [funcs addObject:name];
        }
    }
    [funcs removeObject:@"-[ViewController touchesBegan:withEvent:]"];
    NSLog(@"%@", funcs);
    
    NSData *data = [[funcs componentsJoinedByString:@"\n"]  dataUsingEncoding:NSUTF8StringEncoding];
    NSString *file = [NSTemporaryDirectory() stringByAppendingPathComponent:@"nx.order"];
    NSLog(@"file=%@", file);
    [[NSFileManager defaultManager] createFileAtPath:file contents:data attributes:nil];
}
@end
