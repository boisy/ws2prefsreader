//
//  WS2PrefsController.m
//  WeatherSnoop3_Xcode326
//
//  Created by boisy on 9/28/13.
//  Copyright 2013 Boisy Pitre. All rights reserved.
//

#import "WS2PrefsController.h"


/********************************************************************************************
// WS2 DUMMY CLASSES -- These are reconstructions of actual classes in WeatherSnoop 2 and are
// here for the purpose of reconstructing the class hierarchy as it exists in the prefs file.
 ********************************************************************************************/
/********************************************************************************************
 // END OF WS2 DUMMY CLASSES!!!!
 ********************************************************************************************/






@implementation WS2PrefsController

@synthesize sendDataToWeatherUnderground;
@synthesize wuStationID;
@synthesize wuStationPassword;
@synthesize wuInterval;

@synthesize sendDataToWeatherBug;
@synthesize wbStationID;
@synthesize wbStationPassword;
@synthesize wbStationNumber;
@synthesize weatherBugInterval;

@synthesize sendDataToCWOP;
@synthesize cwopInterval;
@synthesize cwopCallSign;

@synthesize shareDataOnHTTPPort;
@synthesize httpPort;

@synthesize pushDataViaFTP;
@synthesize ftpUsername;
@synthesize ftpPassword;
@synthesize ftpServer;
@synthesize ftpServerPath;
@synthesize ftpUpdateInterval;

@synthesize stationName;
@synthesize siteName;
@synthesize siteLocation;

@synthesize longitudeDegrees;
@synthesize longitudeMinutes;
@synthesize longitudeSeconds;
@synthesize longitudeHemisphere;
@synthesize latitudeDegrees;
@synthesize latitudeMinutes;
@synthesize latitudeSeconds;
@synthesize latitudeHemisphere;
@synthesize elevation;
@synthesize elevationUnits;

- (id)initWithPreferences:(NSString *)file;
{
	if (self = [super init])
	{
		// Step 1: Read the com.tee-boy.weathersnoop.plist file from ~/Library/Preferences.
		NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:file];
		
		if (nil != plist)
		{
			// Weather Underground
			self.sendDataToWeatherUnderground = [[plist objectForKey:@"sendDataToWeatherUnderground"] boolValue];
			self.wuStationID = [plist objectForKey:@"stationID"];
			self.wuStationPassword = [plist objectForKey:@"stationPassword"];
			self.wuInterval = [[plist objectForKey:@"wuInterval"] intValue];
			
			// WeatherBug
			self.sendDataToWeatherBug = [[plist objectForKey:@"sendDataToWeatherBug"] boolValue];
			self.wbStationNumber = [plist objectForKey:@"weatherBugStationNumber"];
			self.wbStationID = [plist objectForKey:@"weatherBugStationID"];
			self.wbStationPassword = [plist objectForKey:@"weatherBugPassword"];
			self.weatherBugInterval = [[plist objectForKey:@"weatherBugInterval"] intValue];
			
			// CWOP
			self.sendDataToCWOP = [[plist objectForKey:@"sendDataToCWOP"] boolValue];
			self.cwopInterval = [[plist objectForKey:@"cwopInterval"] intValue];
			self.cwopCallSign = [plist objectForKey:@"cwopCallSign"];
			
			// HTTP Sharing
			self.shareDataOnHTTPPort = [[plist objectForKey:@"shareDataOnHTTPPort"] boolValue];
			self.httpPort = [[plist objectForKey:@"httpPort"] intValue];
			
			// FTP Sharing
			self.pushDataViaFTP = [[plist objectForKey:@"pushDataViaFTP"] boolValue];
			self.ftpUsername = [plist objectForKey:@"ftpUsername"];
			self.ftpPassword = [plist objectForKey:@"ftpPassword"];
			self.ftpServer = [plist objectForKey:@"ftpServer"];
			self.ftpServerPath = [plist objectForKey:@"ftpServerPath"];
			self.ftpUpdateInterval = [[plist objectForKey:@"ftpUpdateInterval"] intValue];
			
			// Windows
			NSData *windows = [plist objectForKey:@"Windows"];
			NSData *weatherSiteData = [plist objectForKey:@"WeatherSite"];

			// Process Windows Blob
			NSArray *windowList = [NSKeyedUnarchiver unarchiveObjectWithData:windows];
			for (NSWindowController *wc in windowList)
			{
				if ([wc isKindOfClass:[AgentWindowController class]])
				{
					self.stationName = [wc valueForKey:@"stationName"];
					break;
				}
			}

			// Process WeatherSite blob to obtain long/lat/elev and station name/location
			WeatherSite *weatherSite = [NSKeyedUnarchiver unarchiveObjectWithData:weatherSiteData];
			
			if (nil != weatherSite)
			{
				self.siteName = [weatherSite valueForKey:@"_name"];
				self.siteLocation = [weatherSite valueForKey:@"_location"];
				self.longitudeDegrees = [[weatherSite valueForKey:@"_longitudeDegrees"] floatValue];
				self.longitudeMinutes = [[weatherSite valueForKey:@"_longitudeMinutes"] floatValue];
				self.longitudeSeconds = [[weatherSite valueForKey:@"_longitudeSeconds"] floatValue];
				self.longitudeHemisphere = [[weatherSite valueForKey:@"_longitudeHemisphere"] intValue];
				self.latitudeDegrees = [[weatherSite valueForKey:@"_latitudeDegrees"] floatValue];
				self.latitudeMinutes = [[weatherSite valueForKey:@"_latitudeMinutes"] floatValue];
				self.latitudeSeconds = [[weatherSite valueForKey:@"_latitudeSeconds"] floatValue];
				self.latitudeHemisphere = [[weatherSite valueForKey:@"_latitudeHemisphere"] intValue];
				self.elevation = [[weatherSite valueForKey:@"_elevation"] floatValue];
				self.elevationUnits = [[weatherSite valueForKey:@"_elevationUnits"] intValue];
			}
		}
	}

	return self;
}

@end
