//
//  CKTableView.m
//  CKSlideView
//
//  Created by Aileen Nielsen on 11/11/15.
//  Copyright © 2015 SunnysideProductions. All rights reserved.
//

#import "CKTableView.h"
#import "Example1.h"
#import "Example2.h"
@interface CKTableView () <UITableViewDataSource, UITableViewDelegate>
@property NSArray *labels;
@end

@implementation CKTableView

- (void) viewDidLoad{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    self.tableView.separatorColor = [UIColor grayColor];
    self.labels = @[@"Example1", @"Example2", @"Example3", @"Example4"];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
    cell.textLabel.text = [self.labels objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:40.0];
    cell.textLabel.textColor = [UIColor grayColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (int)self.labels.count;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Class viewerClass = NSClassFromString (self.labels[indexPath.row]);
    CKSlideView *sv = [[viewerClass alloc] init];
    sv.numPages = 6;
    [self.navigationController pushViewController:sv animated:NO];
}

@end
