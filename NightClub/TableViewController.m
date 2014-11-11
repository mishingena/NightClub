//
//  TableViewController.m
//  NightClub
//
//  Created by itisioslab on 05.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()


@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Singleton sharedInstance].people.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = [Model getNameOfPersonAtIndex:[indexPath row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[Singleton sharedInstance].people removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }   
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"viewIdentifier"]) {
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        DetailViewController *detailViewController = [[DetailViewController alloc] init];
        detailViewController = [segue destinationViewController];
        detailViewController.person = [[Singleton sharedInstance].people objectAtIndex:path.row];;
    }
}


@end
