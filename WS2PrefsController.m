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
@interface WeatherSite : NSObject
{
	NSString *_name;
	NSString *_location;
	NSNumber *_longitudeDegrees;
	NSNumber *_longitudeMinutes;
	NSNumber *_longitudeSeconds;
	NSNumber *_longitudeHemisphere;
	NSNumber *_latitudeDegrees;
	NSNumber *_latitudeMinutes;
	NSNumber *_latitudeSeconds;
	NSNumber *_latitudeHemisphere;
	NSNumber *_elevation;
	NSNumber *_elevationUnits;
}

@property (retain) NSString *name;
@property (retain) NSString *location;
@property (retain) NSNumber *longitudeDegrees;
@property (retain) NSNumber *longitudeMinutes;
@property (retain) NSNumber *longitudeSeconds;
@property (retain) NSNumber *longitudeHemisphere;
@property (retain) NSNumber *latitudeDegrees;
@property (retain) NSNumber *latitudeMinutes;
@property (retain) NSNumber *latitudeSeconds;
@property (retain) NSNumber *latitudeHemisphere;
@property (retain) NSNumber *elevation;
@property (retain) NSNumber *elevationUnits;

@end

@implementation WeatherSite
@synthesize name = _name;
@synthesize location = _location;
@synthesize longitudeDegrees = _longitudeDegrees;
@synthesize longitudeMinutes = _longitudeMinutes;
@synthesize longitudeSeconds = _longitudeSeconds;
@synthesize longitudeHemisphere = _longitudeHemisphere;
@synthesize latitudeDegrees = _latitudeDegrees;
@synthesize latitudeMinutes = _latitudeMinutes;
@synthesize latitudeSeconds = _latitudeSeconds;
@synthesize latitudeHemisphere = _latitudeHemisphere;
@synthesize elevation = _elevation;
@synthesize elevationUnits = _elevationUnits;

- (id)initWithCoder:(NSCoder *)aDecoder;
{
	if (self = [super init])
	{
		NSDecodeObject(_name, @"name", aDecoder, NSString);
		NSDecodeObject(_location, @"location", aDecoder, NSString);
		NSDecodeObject(_longitudeDegrees, @"longitudeDegrees", aDecoder, NSNumber);
		NSDecodeObject(_longitudeMinutes, @"longitudeMinutes", aDecoder, NSNumber);
		NSDecodeObject(_longitudeSeconds, @"longitudeSeconds", aDecoder, NSNumber);
		NSDecodeObject(_longitudeHemisphere, @"longitudeHemisphere", aDecoder, NSNumber);
		
        NSDecodeObject(_latitudeDegrees, @"latitudeDegrees", aDecoder, NSNumber);
		NSDecodeObject(_latitudeMinutes, @"latitudeMinutes", aDecoder, NSNumber);
		NSDecodeObject(_latitudeSeconds, @"latitudeSeconds", aDecoder, NSNumber);
		NSDecodeObject(_latitudeHemisphere, @"latitudeHemisphere", aDecoder, NSNumber);
		NSDecodeObject(_elevation, @"elevation", aDecoder, NSNumber);
		NSDecodeObject(_elevationUnits, @"elevationUnits", aDecoder, NSNumber);
	}
	
	return self;
}
@end

@interface WSWindowController : NSWindowController
@end
@implementation WSWindowController
@end

@interface HintWindowController : WSWindowController
@end
@implementation HintWindowController
@end

@interface DataCustodianWindowController : WSWindowController
@end
@implementation DataCustodianWindowController
@end

@interface WeatherNotesWindowController : WSWindowController
@end
@implementation WeatherNotesWindowController
@end

@interface IndoorInstrumentsWindowController : WSWindowController
@end
@implementation IndoorInstrumentsWindowController
@end

@interface OutdoorInstrumentsWindowController : WSWindowController
@end
@implementation OutdoorInstrumentsWindowController
@end

@interface ReportWindowController : WSWindowController
@end
@implementation ReportWindowController
@end

@interface DashboardWindowController : WSWindowController
@end
@implementation DashboardWindowController
@end

@interface RadarWindowController : WSWindowController
@end
@implementation RadarWindowController
@end

@interface PlotWindowController : WSWindowController
@end
@implementation PlotWindowController
@end

@interface WeatherPropertiesWindowController : WSWindowController
@end
@implementation WeatherPropertiesWindowController
@end

@interface AgentWindowController : WSWindowController
{
	NSString *stationName;
}
@end
@implementation AgentWindowController
- (id)initWithCoder:(NSCoder *)aDecoder;
{
	if (self = [super initWithCoder:aDecoder])
	{
		stationName = [aDecoder decodeObjectForKey:@"stationName"];
		[stationName retain];
	}
	return self;
}
@end

@interface WeatherAgent : NSObject
@end
@implementation WeatherAgent
- (id)initWithCoder:(NSCoder *)aDecoder;
{
	if (self = [super init])
	{
	}
	return self;
}
@end

@interface SerialNetworkAgent : NSObject
@end
@implementation SerialNetworkAgent
- (id)initWithCoder:(NSCoder *)aDecoder;
{
	if (self = [super init])
	{
	}
	return self;
}
@end

@interface VProAgent : SerialNetworkAgent
{
	BOOL obtainArchive;
	BOOL clearArchive;
	BOOL rainTipInMM;
	BOOL syncTimeToMac;
}
@end
@implementation VProAgent
- (id)initWithCoder:(NSCoder *)aDecoder;
{
	if (self = [super initWithCoder:aDecoder])
	{
		obtainArchive = [aDecoder decodeBoolForKey:@"obtainArchive"];
		clearArchive = [aDecoder decodeBoolForKey:@"clearArchive"];
		rainTipInMM = [aDecoder decodeBoolForKey:@"rainTipInMM"];
		syncTimeToMac = [aDecoder decodeBoolForKey:@"syncTimeToMac"];
	}
	return self;
}
@end

@interface WS1080Agent : WeatherAgent
{
	int recordingIntervalInMinutes;
}
@end
@implementation WS1080Agent
- (id)initWithCoder:(NSCoder *)aDecoder;
{
	if (self = [super initWithCoder:aDecoder])
	{
		recordingIntervalInMinutes = [aDecoder decodeIntForKey:@"recordingIntervalInMinutes"];
		if (0 == recordingIntervalInMinutes)
		{
			recordingIntervalInMinutes = 1;
		}
	}
	return self;
}
@end

@interface WeatherWiseAgent : WS1080Agent
@end
@implementation WeatherWiseAgent
@end

@interface WeatherHawkAgent : WeatherAgent
{
	NSString *serverAddress;
}
@end
@implementation WeatherHawkAgent
- (id)initWithCoder:(NSCoder *)aDecoder;
{
	if (self = [super initWithCoder:aDecoder])
	{
		serverAddress = [[aDecoder decodeObjectForKey:@"serverAddress"] retain];
	}
	return self;
}
@end

@interface RainWiseCC3000Agent : SerialNetworkAgent
{
	BOOL obtainArchive;
	BOOL clearArchive;
	BOOL syncTimeToMac;
}
@end
@implementation RainWiseCC3000Agent
- (id)initWithCoder:(NSCoder *)aDecoder;
{
	if (self = [super initWithCoder:aDecoder])
	{
		obtainArchive = [aDecoder decodeBoolForKey:@"obtainArchive"];
		clearArchive = [aDecoder decodeBoolForKey:@"clearArchive"];
		syncTimeToMac = [aDecoder decodeBoolForKey:@"syncTimeToMac"];
	}
	return self;
}
@end

@interface PeetBrosAgent : SerialNetworkAgent
{
	BOOL obtainArchive;
	BOOL clearArchive;
	BOOL syncTimeToMac;
}
@end
@implementation PeetBrosAgent
- (id)initWithCoder:(NSCoder *)aDecoder;
{
	if (self = [super initWithCoder:aDecoder])
	{
		obtainArchive = [aDecoder decodeBoolForKey:@"obtainArchive"];
		clearArchive = [aDecoder decodeBoolForKey:@"clearArchive"];
		syncTimeToMac = [aDecoder decodeBoolForKey:@"syncTimeToMac"];
	}
	return self;
}
@end

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
