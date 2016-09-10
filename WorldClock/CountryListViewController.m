//
//  CountryListViewController.m
//  WorldClock
//
//  Created by Hashem on 7/20/16.
//  Copyright © 2016 Abounajmi. All rights reserved.
//

#import "CountryListViewController.h"
#import "WorldClock-Swift.h"
#import "ICellConfigurator.h"

// a private extenstion to country list VC
@interface CountryListViewController () <UITableViewDelegate>
@property (strong, nonatomic) NSArray *capitals;
@property (strong, nonatomic) TableViewDataSource *dataSource;

@end
@implementation CountryListViewController

- (NSArray *)capitals{
    if (!_capitals) {
        _capitals = [TableViewDataSource createSampleData];
    }
    
    return _capitals;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.dataSource = [[TableViewDataSource alloc] initWithAItems:self.capitals aCellIdentifier:@"cell" aConfigureBlock:^(UITableViewCell * _Nonnull cell, City * _Nonnull city) {
        
        [(id<ICellConfigurator>)cell configureForItem:city];
        
    }];
    self.tableView.dataSource = self.dataSource;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // disable tableView user interaction so user cannot select another cell without recieving network request
    tableView.userInteractionEnabled = false;
    City *selectedCity = self.capitals[indexPath.row];
    
    CityCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell.activityIndicator startAnimating];
    
    [NetworkEngine getSunstSunRiseTimeForCity:selectedCity completion:^(DayLight * daylight, NSError *error) {
        // enable tableView user interaction
        tableView.userInteractionEnabled = true;
        [cell.activityIndicator stopAnimating];

        // if there is no error
        if (!error) {
            selectedCity.dayLight = daylight;
            
            // calling the delegate
            if ([self.countryDelegate respondsToSelector:@selector(didSelectCity:)]) {
                [self.countryDelegate didSelectCity:selectedCity];
            }
        }
        else{
            [self alertWithTitle:@"خطا" message:error.localizedDescription];
        }
            
        
    }];
}

- (void)alertWithTitle:(NSString *)title message:(NSString *)message
{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:title
                                          message:message
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:nil];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

@end
