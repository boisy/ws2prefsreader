//
//  WS2PrefsReaderAppDelegate.h
//  WS2PrefsReader
//
//  Created by boisy on 10/3/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface WS2PrefsReaderAppDelegate : NSObject <NSApplicationDelegate>
{
    NSWindow *window;
	IBOutlet NSTextField *stationNameLabel;
}

@property (assign) IBOutlet NSWindow *window;

@end
