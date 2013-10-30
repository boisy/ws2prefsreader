//
//  WS2PrefsReaderAppDelegate.m
//  WS2PrefsReader
//
//  Created by boisy on 10/3/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "WS2PrefsReaderAppDelegate.h"
#import "WS2PrefsController.h"

@implementation WS2PrefsReaderAppDelegate

@synthesize window;

- (void)openWS3SiteDocument;
{
	NSURL *url = [NSURL fileURLWithPath:@"/Users/boisy/Desktop/Untitled.wssite"];
	
	NSError *error = nil;
	WSDocument *document = [[WSDocument alloc] initWithContentsOfURL:url ofType:@"wssite" error:&error];
	[stationNameLabel setStringValue:document.agent.stationName];	
}

- (void)openWS2Prefs;
{
	// There are two places the preferences file can reside in:
	// 1. non-sandboxed
	// 2. sandboxed
	// We will determine if the file exists in either place and if so, use that file for analysis
	NSString *prefsFile = nil;
	NSString *candidatePrefsFileNonSandboxed = [NSString stringWithFormat:@"%@/Library/Preferences/com.tee-boy.weathersnoop.plist", NSHomeDirectory()];
	NSString *candidatePrefsFileSandboxed = [NSString stringWithFormat:@"%@/Library/Containers/com.tee-boy.weathersnoop/Data/Library/Preferences/com.tee-boy.weathersnoop.plist", NSHomeDirectory()];

	// If the non-sandboxed preferences file exists, use it.
	if ([[NSFileManager defaultManager] fileExistsAtPath:candidatePrefsFileNonSandboxed])
	{
		prefsFile = candidatePrefsFileNonSandboxed;
	}

	// If the sandboxed preferences file exists, use it.
	if ([[NSFileManager defaultManager] fileExistsAtPath:candidatePrefsFileSandboxed])
	{
		prefsFile = candidatePrefsFileSandboxed;
	}
	
	if (nil != prefsFile)
	{
		// our preferences file exists, so get the prefs controller
		WS2PrefsController *c = [[WS2PrefsController alloc] initWithPreferences:prefsFile];
		
		// pull the stationName property from the controller and put it in the stationName label
		[stationNameLabel setStringValue:c.stationName];	
	}
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	[self openWS3SiteDocument];
}

@end
