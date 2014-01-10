//
//  ViewController.m
//  2.6.6
//
//  Created by SDT-1 on 2014. 1. 10..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "DetailVC.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(weak,nonatomic)IBOutlet UITableView*table;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ViewController{
    NSArray *data;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [data count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL_ID"];
    cell.textLabel.text=[data objectAtIndex:indexPath.row];
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailVC *detail =segue.destinationViewController;
    UITableViewCell *selectedCell = (UITableViewCell *)sender;
    NSIndexPath *selectedIndex = [self.table indexPathForCell:selectedCell];
    detail.urlStr = [data objectAtIndex:selectedIndex.row];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    data=@[@"apple.com",@"google.com",@"daum.net",@"naver.com"];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
