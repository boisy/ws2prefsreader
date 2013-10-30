/*
 *  WSClasses.h
 *  WS2PrefsReader
 *
 *  Created by boisy on 10/28/13.
 *  Copyright 2013 __MyCompanyName__. All rights reserved.
 *
 */

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

@interface WSWindowController : NSWindowController
@end

@interface AboutWindowController : NSWindowController
@end

@interface HintWindowController : WSWindowController
@end

@interface DataCustodianWindowController : WSWindowController
@end

@interface WeatherNotesWindowController : WSWindowController
@end

@interface IndoorInstrumentsWindowController : WSWindowController
@end

@interface OutdoorInstrumentsWindowController : WSWindowController
@end

@interface ReportWindowController : WSWindowController
@end

@interface DashboardWindowController : WSWindowController
@end

@interface RadarWindowController : WSWindowController
@end

@interface PlotWindowController : WSWindowController
@end

@interface WeatherPropertiesWindowController : WSWindowController
@end

@interface HiDefWindowController : WSWindowController
@end

@interface WeatherAgent : NSObject // WS3 class
{
	NSString *stationName;
	NSString *siteName;
	NSString *siteLocation;
	NSString *siteLongitude;
	NSString *siteLatitude;
	NSString *siteElevation;
}

@property(retain) NSString *stationName;
@property(retain) NSString *siteName;
@property(retain) NSString *siteLocation;
@property(retain) NSString *siteLongitude;
@property(retain) NSString *siteLatitude;
@property(retain) NSString *siteElevation;

@end

@interface AgentWindowController : WSWindowController
{
	NSString *stationName;		// WS2 property
	WeatherAgent *agent;		// WS3 property
}

@property(retain) NSString *stationName;
@property(retain) WeatherAgent *agent;

@end

@interface SerialNetworkAgent : WeatherAgent
@end

@interface VProAgent : SerialNetworkAgent
{
	BOOL obtainArchive;
	BOOL clearArchive;
	BOOL rainTipInMM;
	BOOL syncTimeToMac;
}
@end

@interface WS1080Agent : WeatherAgent
{
	int recordingIntervalInMinutes;
}
@end

@interface WeatherWiseAgent : WS1080Agent
@end

@interface WeatherHawkAgent : WeatherAgent
{
	NSString *serverAddress;
}
@end

@interface RainWiseCC3000Agent : SerialNetworkAgent
{
	BOOL obtainArchive;
	BOOL clearArchive;
	BOOL syncTimeToMac;
}
@end

@interface PeetBrosAgent : SerialNetworkAgent
{
	BOOL obtainArchive;
	BOOL clearArchive;
	BOOL syncTimeToMac;
}
@end


// WS3 Classes

@interface DavisInstrumentWindowController : WSWindowController
@end

@interface CWSMicroServerInstrumentWindowController : WSWindowController
@end

@interface TWIInstrumentWindowController : WSWindowController
@end

@interface FineOffsetInstrumentWindowController : WSWindowController
@end

@interface WUInstrumentWindowController : WSWindowController
@end

@interface RainWiseCC3000InstrumentWindowController : WSWindowController
@end

@interface RainWiseWS2000InstrumentWindowController : WSWindowController
@end

@interface PeetBrosInstrumentWindowController : WSWindowController
@end

@interface WeatherHawk600InstrumentWindowController : WSWindowController
@end

@interface WSSupportWindowController : WSWindowController
@end

@interface ExtremaReportWindowController : WSWindowController
@end

@interface DatabaseReportWindowController : WSWindowController
@end

@interface DavisAgent : SerialNetworkAgent
{
	BOOL obtainArchive;
	BOOL clearArchive;
	BOOL rainTipInMM;
	BOOL syncTimeToMac;
}
@end

@interface FineOffsetAgent : WeatherAgent
{
	int recordingIntervalInMinutes;
}
@end

@interface WeatherHawk600Agent : WeatherAgent
{
	NSString *serverAddress;
}
@end

@interface WeatherHawkSignatureAgent : WeatherHawk600Agent
@end

@interface WSDocument : NSDocument
{
    NSMutableDictionary *versionInfo;
	WeatherAgent *agent;
}

@property (retain) NSMutableDictionary *versionInfo;
@property (retain) WeatherAgent *agent;

@end
