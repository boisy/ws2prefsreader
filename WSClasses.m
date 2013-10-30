/*
 *  WSClasses.h
 *  WS2PrefsReader
 *
 *  Created by boisy on 10/28/13.
 *  Copyright 2013 __MyCompanyName__. All rights reserved.
 *
 */

#import "WSClasses.h"

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

@implementation WSWindowController
@end

@implementation AboutWindowController
@end

@implementation HintWindowController
@end

@implementation DataCustodianWindowController
@end

@implementation WeatherNotesWindowController
@end

@implementation IndoorInstrumentsWindowController
@end

@implementation OutdoorInstrumentsWindowController
@end

@implementation ReportWindowController
@end

@implementation DashboardWindowController
@end

@implementation RadarWindowController
@end

@implementation PlotWindowController
@end

@implementation WeatherPropertiesWindowController
@end

@implementation HiDefWindowController
- (id)initWithCoder:(NSCoder *)aDecoder;
{
	if (self = [super initWithCoder:aDecoder])
	{
	}
	return self;
}
@end

@implementation WeatherAgent // WS3 class

@synthesize stationName;
@synthesize siteName;
@synthesize siteLocation;
@synthesize siteLongitude;
@synthesize siteLatitude;
@synthesize siteElevation;

+ (NSString *)agentName;
{
	return @"???";
}

- (id)initWithCoder:(NSCoder *)aDecoder;
{
	if (self = [super init])
	{
		self.stationName = [[self class] agentName];
		self.siteName = [aDecoder decodeObjectForKey:@"siteName"];
		self.siteLocation = [aDecoder decodeObjectForKey:@"siteLocation"];
		self.siteLongitude = [aDecoder decodeObjectForKey:@"siteLongitude"];
		self.siteLatitude = [aDecoder decodeObjectForKey:@"siteLatitude"];
		self.siteElevation = [aDecoder decodeObjectForKey:@"siteElevation"];
	}
	
	return self;
}
@end

@implementation AgentWindowController

@synthesize stationName;
@synthesize agent;

- (id)initWithCoder:(NSCoder *)aDecoder;
{
	if (self = [super initWithCoder:aDecoder])
	{
		self.stationName = [aDecoder decodeObjectForKey:@"stationName"];
		self.agent = [aDecoder decodeObjectForKey:@"agent"];
	}
	
	return self;
}
@end

@implementation SerialNetworkAgent
- (id)initWithCoder:(NSCoder *)aDecoder;
{
	if (self = [super initWithCoder:aDecoder])
	{
	}
	return self;
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

@implementation WeatherWiseAgent
+ (NSString *)agentName;
{
    return @"Weatherwise Solar Pro";
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

+ (NSString *)agentName;
{
    return @"WeatherHawk 600 Series";
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

+ (NSString *)agentName;
{
    return @"Peet Bros ULTIMETER";
}
@end

@implementation DavisInstrumentWindowController
@end

@implementation CWSMicroServerInstrumentWindowController
@end

@implementation TWIInstrumentWindowController
@end

@implementation FineOffsetInstrumentWindowController
@end

@implementation WUInstrumentWindowController
@end

@implementation RainWiseCC3000InstrumentWindowController
@end

@implementation RainWiseWS2000InstrumentWindowController
@end

@implementation PeetBrosInstrumentWindowController
@end

@implementation WeatherHawk600InstrumentWindowController
@end

@implementation WSSupportWindowController
@end

@implementation ExtremaReportWindowController
@end

@implementation DatabaseReportWindowController
@end

@implementation DavisAgent
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

+ (NSString *)agentName;
{
    return @"Davis Weather Station";
}
@end

@implementation FineOffsetAgent
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

@implementation WeatherHawk600Agent
- (id)initWithCoder:(NSCoder *)aDecoder;
{
	if (self = [super initWithCoder:aDecoder])
	{
		serverAddress = [[aDecoder decodeObjectForKey:@"serverAddress"] retain];
	}
	return self;
}
@end

@implementation WeatherHawkSignatureAgent
+ (NSString *)agentName;
{
    return @"WeatherHawk Signature Series";
}
@end

@interface RainWiseWS2000Agent : SerialNetworkAgent
{
	BOOL obtainArchive;
	BOOL clearArchive;
	BOOL syncTimeToMac;
}
@end

@implementation RainWiseWS2000Agent
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

+ (NSString *)agentName;
{
    return @"RainWise WS-2000";
}
@end

@interface RainWiseWCC300Agent : SerialNetworkAgent
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

+ (NSString *)agentName;
{
    return @"RainWise CC-3000";
}
@end

@implementation WSDocument

@synthesize agent;
@synthesize versionInfo;

- (BOOL)readFromFileWrapper:(NSFileWrapper *)fileWrapper ofType:(NSString *)typeName error:(NSError **)outError
{
	BOOL result = YES;
	
    @try
    {
        NSDictionary *files = [fileWrapper fileWrappers];
        
        // Determine this file's version
        {
            NSData *data = [[files objectForKey:@"VersionInfo"] regularFileContents];
            if (nil != data)
            {
                self.versionInfo = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            }
        }
        
        NSData *windowData = [[files objectForKey:@"Windows"] regularFileContents];
        NSArray *windowControllers = [NSKeyedUnarchiver unarchiveObjectWithData:windowData];
		if (0 == [windowControllers count])
		{
			result = NO;
		}
		else
		{
			//		SAFE_ARC_AUTORELEASE(windowControllers);
			
			for (NSWindowController *x in windowControllers)
			{
				[self addWindowController:x];
			}
			
			// Go through windowControllers for AgentWindowController... instantiate him
			for (int i = 0; i < [self.windowControllers count]; i++)
			{
				WSWindowController *wc = [self.windowControllers objectAtIndex:i];
				
				// if this is our agent controller window, set this document's agent to that of the agent window controller's
				if ([wc isKindOfClass:[AgentWindowController class]])
				{
					AgentWindowController *ac = (AgentWindowController *)wc;
					self.agent = ac.agent;
					break;
				}
			}
		}
    }
    @catch (NSException *exception)
    {
        result = NO;
    }

    return result;
}

@end
