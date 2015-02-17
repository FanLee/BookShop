//
//  BSGenreAndAuthorExpandebleTableViewController.m
//  BookShop
//
//  Created by FanLee on 13.01.15.
//  Copyright (c) 2015 Fan. All rights reserved.
//

#import "BSGenreAndAuthorExpandebleTableViewController.h"
#import "AppDelegate.h"
#import "User.h"
#import "Book.h"
#import "Author.h"
#import "BSAuthorTableViewCell.h"
#import "BSDBManager.h"
#import "BSAuthorViewController.h"
#import "Genre.h"

@implementation BSGenreAndAuthorExpandebleTableViewController
enum {
    header1,
    header2,
    header3,
};
Author * currentAuthor;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!expandedSections)
    {
        expandedSections = [[NSMutableIndexSet alloc] init];
    }
    
}

- (BOOL)tableView:(UITableView *)tableView canCollapseSection:(NSInteger)section
{
    if (section>=0) return YES;
    
    return NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self tableView:tableView canCollapseSection:section])
    {
        if ([expandedSections containsIndex:section])
        {
            return 2; // return rows when expanded
        }
    }
    
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    //indexPath.section
    //indexPath.row
    
    //indexPath.section
    //genres
    //rows
    //autors
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    if ([self tableView:tableView canCollapseSection:indexPath.section] && indexPath.row == 0) {
        switch (indexPath.section) {
            case header1: cell.textLabel.text=@"Horrors";return cell;
            case header2: cell.textLabel.text=@"Detectives";return cell;
            case header3: cell.textLabel.text=@"Adventures"; return cell;
        }
        // first row
    } else {
        if(indexPath.section==header1){
            NSUInteger i=0;
            BSDBManager *dbManager = [BSDBManager sharedInstance];
            NSArray *authorsHororsArray=dbManager.authors;
            for (i=0;i<[authorsHororsArray count]; i++){
                Author *author=[authorsHororsArray objectAtIndex:i];
                if ([author.genre.genreName isEqualToString:@"Horrors"]){
                    currentAuthor=author;
                    NSString *authorText=[NSString stringWithFormat:@"%@",author.name];
                    cell.textLabel.text = authorText;
                    cell.accessoryView = nil;
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
            }
        } else if (indexPath.section==header2){
            NSUInteger i=0;
            BSDBManager *dbManager = [BSDBManager sharedInstance];
            NSArray *authorsHororsArray=dbManager.authors;
            for (i=0;i<[authorsHororsArray count]; i++){
                Author *author=[authorsHororsArray objectAtIndex:i];
                if ([author.genre.genreName isEqualToString:@"Detectives"]){
                    currentAuthor=author;
                    NSString *authorText=[NSString stringWithFormat:@"%@",author.name];
                    cell.textLabel.text = authorText;
                    cell.accessoryView = nil;
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
            }
        } else if (indexPath.section==header3){
            NSUInteger i=0;
            BSDBManager *dbManager = [BSDBManager sharedInstance];
            NSArray *authorsHororsArray=dbManager.authors;
            for (i=0;i<[authorsHororsArray count]; i++){
                Author *author=[authorsHororsArray objectAtIndex:i];
                if ([author.genre.genreName isEqualToString:@"Adventures"]){
                    currentAuthor=author;
                    NSString *authorText=[NSString stringWithFormat:@"%@",author.name];
                    cell.textLabel.text = authorText;
                    cell.accessoryView = nil;
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
            }
        }
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self tableView:tableView canCollapseSection:indexPath.section])
    {
        if (!indexPath.row)
        {
            // only first row toggles exapand/collapse
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
            NSInteger section = indexPath.section;
            BOOL currentlyExpanded = [expandedSections containsIndex:section];
            NSInteger rows;
            
            NSMutableArray *tmpArray = [NSMutableArray array];
            
            if (currentlyExpanded)
            {
                rows = [self tableView:tableView numberOfRowsInSection:section];
                [expandedSections removeIndex:section];
            }
            else
            {
                [expandedSections addIndex:section];
                rows = [self tableView:tableView numberOfRowsInSection:section];
            }
            
            for (int i=1; i<rows; i++)
            {
                NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:i
                                                               inSection:section];
                [tmpArray addObject:tmpIndexPath];
            }
            
            //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            
            if (currentlyExpanded)
            {
                [tableView deleteRowsAtIndexPaths:tmpArray
                                 withRowAnimation:UITableViewRowAnimationTop];
                
            }
            else
            {
                [tableView insertRowsAtIndexPaths:tmpArray
                                 withRowAnimation:UITableViewRowAnimationTop];
                
                
            }
        }else{
            [self performSegueWithIdentifier:@"authorDetail" sender:self];
        }
        
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue  sender:(id)sender{
    BSAuthorViewController * vc= segue.destinationViewController;
    vc.author = currentAuthor;
}

@end

