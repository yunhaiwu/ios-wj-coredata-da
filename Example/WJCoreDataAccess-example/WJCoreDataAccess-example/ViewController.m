//
//  ViewController.m
//  WJCoreDataAccess-example
//
//  Created by 吴云海 on 16/9/9.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "Masonry.h"
#import "UserCell.h"
#import "WJCoreDataManager.h"
#import "UserMO.h"
#import "NSManagedObjectContext+WJDA.h"
#import "WJCoreDataDA.h"
#import "WJUUIDUtils.h"

@interface ViewController ()<NSFetchedResultsControllerDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, weak) UITableView *tableView;
@property(nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@end

@implementation ViewController

-(void)leftExec:(id)sender {
//    NSManagedObjectContext *context = [NSManagedObjectContext defaultContext];
//    for (int i=0; i<100000; i++) {
//        NSInteger count = [UserMO countInContext:context];
//        UserMO *user = [UserMO create:@{
//                                        @"userId":WJ_UUID,
//                                        @"age":@(20),
//                                        @"name":[NSString stringWithFormat:@"name-%li",(long)count],
//                                        @"createTime":[NSDate date]
//                                        } inContext:context];
//        if ([user save]) {
//            WJLogDebug(@"%i add success",i);
//        } else {
//            WJLogDebug(@"%i add fail",i);
//        }
//    }
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"%@",error);
    }
    [self.tableView reloadData];
}

-(void)rightExec:(id)sender {
//    NSManagedObjectContext *context = [NSManagedObjectContext defaultContext];
    [UserMO batchUpdate:nil attributes:@{@"userId":@"wwwwww"}];
//    [self performSelectorOnMainThread:@selector(leftExec:) withObject:nil waitUntilDone:NO];
//    [self performSelector:@selector(leftExec:) withObject:nil afterDelay:3];
    [self leftExec:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CoreDataDemo";
    if (!_tableView) {
        UITableView *t = [[UITableView alloc] init];
        [t setBackgroundColor:[UIColor redColor]];
        [self.view addSubview:t];
        [t setDelegate:self];
        [t setDataSource:self];
        [t mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        _tableView = t;
    }
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(leftExec:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"update" style:UIBarButtonItemStylePlain target:self action:@selector(rightExec:)];
    
    [self.tableView registerClass:[UserCell class] forCellReuseIdentifier:[UserCell wj_tableCellIdentifier]];
    
    if (!_fetchedResultsController) {
        NSManagedObjectContext *context = [NSManagedObjectContext defaultContext];
        NSFetchRequest * request = [[NSFetchRequest alloc] init];
        [request setFetchBatchSize:5];
        NSEntityDescription * desption = [NSEntityDescription entityForName:@"UserMO" inManagedObjectContext:context];
        [request setEntity:desption];
        NSSortDescriptor * desciptor = [NSSortDescriptor sortDescriptorWithKey:@"createTime" ascending:YES];
        [request setSortDescriptors:[NSArray arrayWithObjects:desciptor, nil]];
        
        NSFetchedResultsController * resultController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
        resultController.delegate = self;
        self.fetchedResultsController = resultController;
        NSError * error = nil;
        if ([self.fetchedResultsController performFetch:&error]) {
            WJLogDebug(@"SUCCESS ...");
        } else {
            WJLogDebug(@"ERROR = %@",error);
        }
    }
    
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMerge:) name:NSManagedObjectContextDidSaveNotification object:nil];
}

-(void)handleMerge:(NSNotification*)notification {
    NSLog(@"dddddd");
}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_fetchedResultsController fetchedObjects] count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:[UserCell wj_tableCellIdentifier]];
    UserMO *userMO = [self.fetchedResultsController fetchedObjects][indexPath.row];
    [[cell cellContentView] setUser:userMO];
    return cell;
}

#pragma mark NSFetchedResultsControllerDelegate
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    NSLog(@"reload");
    [self.tableView reloadData];
}

@end
