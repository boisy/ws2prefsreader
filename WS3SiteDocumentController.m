//
//  WS3SiteDocumentController.m
//  WeatherSnoop3_Xcode326
//
//  Created by boisy on 9/28/13.
//  Copyright 2013 Boisy Pitre. All rights reserved.
//

#import "WS3SiteDocumentController.h"


@implementation WS3SiteDocumentController


- (id)initWithSiteDocument:(NSString *)file;
{
	if (self = [super init])
	{
		// Step 1: Read the com.tee-boy.weathersnoop.plist file from ~/Library/Preferences.
		NSData *data = [NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@/Windows", file]]; 
		NSArray *windowControllers = [NSKeyedUnarchiver unarchiveObjectWithData:data];
		
		if (nil != windowControllers)
		{
			AgentWindowController *awc = nil;
			
			for (WSWindowController *wc in windowControllers)
			{
				if ([wc isKindOfClass:[AgentWindowController class]])
				{
					awc = (AgentWindowController *)wc;
					break;
				}
			}
			
			if (nil != awc)
			{
				WeatherAgent *agent = awc.agent;
				NSLog(@"%@", agent.stationName);
			}
		}
	}

	return self;
}

@end
