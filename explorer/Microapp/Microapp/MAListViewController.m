//
//  MAListViewController.m
//  Microapp
//
//  Created by 聂高涛 on 2021/11/26.
//

#import "MAListViewController.h"
#import "MARequest.h"
#import "MADAV.h"
#import "MAVideoViewController.h"
#import "MAAudioViewController.h"
#import "MAImageViewController.h"
#import "MATableViewCell.h"


@interface MAListViewCell : MATableViewCell
@property (nonatomic, strong) UILabel *titleView;
@property (nonatomic, strong) UILabel *subtitleView;
@end

@implementation MAListViewCell
- (void)setupSubviews{
    self.titleView = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, UIScreen.mainScreen.bounds.size.width-30, 20)];
    self.titleView.font = [UIFont systemFontOfSize:15];
    self.titleView.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.titleView];
    
    self.subtitleView = [[UILabel alloc] initWithFrame:CGRectMake(15, 32, UIScreen.mainScreen.bounds.size.width-30, 18)];
    self.subtitleView.font = [UIFont systemFontOfSize:14];
    self.subtitleView.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.subtitleView];
}

- (void)updateSubviews:(NSString *)operation value:(id)value{
    if (value && [value isKindOfClass:[MADAV class]]){
        MADAV *dav = (MADAV *)value;
        self.titleView.text = dav.name;
        self.subtitleView.text = dav.path;
    }
}
@end


@interface MAListViewController ()
@end

@implementation MAListViewController

- (instancetype)init {
    if(self = [super init]){
        self.dav = [[MADAV alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.dav.name;
    
    [self setupSubviews];
    
    [self.tableView registerClass:[MAListViewCell class] forCellReuseIdentifier:@"MAListViewCell"];
    
    [self request];
}

- (void)request{
    NSString *url = [[MARequest center] getURL:self.dav.path];
    __weak MAListViewController *weakself = self;
    [[MARequest center] fetch:url depth:1 propfind:@"" completion:^(NSArray * _Nonnull paths) {
        [weakself.collection.elements removeAllObjects];
        
        if(paths && paths.count > 0){
            MACollection *collection = [[MACollection alloc] init];
            
            for (NSString *path in paths){
                if([path isEqualToString:@"/"] || [path isEqualToString:weakself.dav.path]){
                    continue;
                }
                MADAV *dav = [[MADAV alloc] init];
                dav.ctxs.height = 58;
                dav.path = path;
                if ([path hasPrefix:weakself.dav.path]){
                    dav.name = [path substringFromIndex:weakself.dav.path.length];
                }
                else {
                    dav.name = path;
                }
                [collection.elements addObject:dav];
            }
            
            [collection.elements sortWithOptions:NSSortStable usingComparator:^NSComparisonResult(MADAV *obj1, MADAV *obj2) {
                BOOL Obj1isPath = [[obj1.name substringFromIndex:obj1.name.length-1] isEqualToString:@"/"];
                BOOL Obj2isPath = [[obj2.name substringFromIndex:obj2.name.length-1] isEqualToString:@"/"];
                if (Obj1isPath == true && Obj2isPath == true || Obj1isPath == false && Obj2isPath == false){
                    return [obj1.name compare:obj2.name];
                }
                else{
                    if (Obj1isPath == true){
                        return NSOrderedAscending;
                    }
                    else{
                        return NSOrderedDescending;
                    }
                }
            
            }];
            
            if(collection.elements.count > 0){
                [weakself.collection.elements addObject:collection];
            }
        }
        
        [weakself.tableView reloadData];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MADAV *dav = [self.collection elementAtIndexPath:indexPath];
    MAListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[MAListViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MAListViewCell"];
    }
    [cell updateSubviews:@"" value:dav];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MADAV *dav = [self.collection elementAtIndexPath:indexPath];
    if([[dav.path substringFromIndex:dav.path.length-1] isEqualToString:@"/"]) {
        MAListViewController *vc = [[MAListViewController alloc] init];
        vc.dav.name = dav.name;
        vc.dav.path = dav.path;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        
        NSString *type = [dav.path.pathExtension lowercaseString];
        if ([@[@"mov", @"mp4"] containsObject:type]){
            MAVideoViewController *vc = [[MAVideoViewController alloc] init];
            vc.dav = dav;
            [self.navigationController pushViewController:vc animated:true];
        }
        else if ([@[@"mp3", @"wav", @"aif/aiff", @"mid", @"wma", @"ra", @"vqf", @"ape", @"m4a"] containsObject:type]){
            MAAudioViewController *vc = [[MAAudioViewController alloc] init];
            vc.dav = dav;
            NSMutableArray *elements = [NSMutableArray arrayWithCapacity:5];
            for (MACollection *__collection in self.collection.elements){
                for (MADAV *__dav in __collection.elements){
                    NSString *__type = [__dav.path.pathExtension lowercaseString];
                    if ([@[@"mp3", @"wav", @"aif/aiff", @"mid", @"wma", @"ra", @"vqf", @"ape", @"m4a"] containsObject:__type]) {
                        [elements addObject:__dav];
                    }
                }
            }
            vc.elements = elements;
            [self.navigationController pushViewController:vc animated:true];
        }
        else if([@[@"png", @"jpg"] containsObject:type]){
            MAImageViewController *vc = [[MAImageViewController alloc] init];
            vc.dav = dav;
            [self.navigationController pushViewController:vc animated:true];
        }
    }
}
@end
