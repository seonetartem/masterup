//
//  RoutesViewController.m
//  Marshrutky
//
//  Created by Artem Paliy on 10/30/13.
//  Copyright (c) 2013 Artem Paliy. All rights reserved.
//

#import "RoutesViewController.h"
#import "AFHTTPClient.h"


@interface RoutesViewController ()
//    @property (nonatomic, strong) NSArray *routes;
    @property (strong, nonatomic) NSMutableArray *modelRoutes;
    @property (strong, nonatomic) NSMutableArray *modelFavoriteRoutes;
@end

@implementation RoutesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
//    NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString:@"http://itomy.ch/routes.php"]];
//
//    AFJSONRequestOperation *jsonOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
//       
//        self.routes = JSON;
//        [self.tableView reloadData];
//
//    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
//        NSLog(@"%@", error);
//    }];
//    
//    [jsonOperation start];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ApiRouteClient *sharedRouteClient = [ApiRouteClient sharedInstance];
    
    sharedRouteClient.delegate = self;
    [sharedRouteClient updateRoutesList:^(NSArray *routes) {
        NSEnumerator *enumerator = [routes objectEnumerator];
        id obj;
        
        while ((obj = [enumerator nextObject]))
        {
            Route *route = [[Route alloc] initWithDictionary:(NSDictionary *)obj];
            [self.modelRoutes addObject:route];
        }
        
        [self.tableView reloadData];
        
    }
    failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    [self.navigationItem setTitle:NSLocalizedString(@"ALL ROUTES", nil)];
    
    self.modelRoutes = [[NSMutableArray alloc] init];
    self.modelFavoriteRoutes = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows;

    rows = self.modelRoutes.count;

    return rows;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    static NSString *CellIdentifier = @"Cell";
    RoutCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Route *obj = [self.modelRoutes objectAtIndex:indexPath.row];
//
    cell.routName.text = obj.title;
    cell.routPrice.text = obj.price;
    cell.image1.image = [UIImage imageNamed:@"star_gray"];

//	switch (indexPath.section) {
//        case 0:
//            cell.image1.image = [UIImage imageNamed:@"star_gold"];
//            break;
//        case 1:
//            cell.image1.image = [UIImage imageNamed:@"star_gray"];
//            break;
//        default:
//            break;
//    }
    

    return cell;
}

- (void)ApiRouteClient:(ApiRouteClient *)client didUpdateRoutes:(NSArray *)routes
{
    NSEnumerator *enumerator = [routes objectEnumerator];
    id obj;
    while ((obj = [enumerator nextObject]))
    {
        Route *route = [[Route alloc] initWithDictionary:(NSDictionary *)obj];
        [self.modelRoutes addObject:route];
    }
    
    [self.tableView reloadData];
}

- (void)ApiRouteClient:(ApiRouteClient *)client didFailWithError:(NSError *)error
{
    NSLog(@"Error API %@", error.description);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
