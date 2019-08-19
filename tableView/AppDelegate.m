//
//  AppDelegate.m
//  tableView
//
//  Created by vsquared on 8/19/19.
//  Copyright © 2019 vsquared. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    NSArray *array;
}
@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTableView *tableView;

@end

@implementation AppDelegate

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [[array objectAtIndex:0]count] ;
}

- (id)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *columnIdentifier = [tableColumn identifier];
    NSTableCellView *view = [_tableView makeViewWithIdentifier:columnIdentifier owner: self];
    
    if ([columnIdentifier isEqualToString:@"col0"]) {
        [[view textField] setStringValue:[[array objectAtIndex:0] objectAtIndex:row]];
        return view;
    }
    if ([columnIdentifier isEqualToString:@"col1"]) {
        [[view textField] setStringValue:[[array objectAtIndex:1] objectAtIndex:row]];
        return view;
    }
    return nil;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    array = @[[NSMutableArray array],[NSMutableArray array]];
    for ( int col = 0; col < 2; col++ ) {
        for ( int row = 0; row < 50; row++ )
        {
            [[ array objectAtIndex: col ] setObject:[NSString stringWithFormat:@"col %d : row %d",col,row] atIndex: row ];
        }
    }
    [_tableView setDataSource:self];
    [_tableView setDelegate:self];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
