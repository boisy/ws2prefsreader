//
//  WS2PrefsController.h
//  WeatherSnoop3_Xcode326
//
//  Created by boisy on 9/28/13.
//  Copyright 2013 Boisy Pitre. All rights reserved.
//

// These are the names of agents that WeatherSnoop 2 recognizes.
// Note the deprecated list below... older version of WeatherSnoop may
// still be out there and have these names in use.
#define	WUW				@"Weather Underground Website"
#define	SIM				@"Test Simulator"
#define	DVPRO2			@"Davis Vantage Pro 2"					/* Defunct as of 1.5.0 */
#define	DVPRO2UV		@"Davis Vantage Pro 2 w/UV & Solar"		/* Defunct as of 1.5.0 */
#define	DAVIS			@"Davis Vantage Pro/Vue"
#define	OSWMR100		@"Oregon Scientific WMR100N"
#define	OSWMR200		@"Oregon Scientific WMR200A"
#define	OSWMR968		@"Oregon Scientific WMR968"
#define	PEETBROS		@"Peet Bros. ULTIMETER"
#define	RAINWISE		@"RainWise CC-2000"
#define	RAINWISECC3K	@"RainWise CC-3000"
#define	WEATHERHAWK		@"WeatherHawk Signature Series"
#define	WS2315			@"LaCrosse WS-2315"
#define	AMBIENTWEATHER	@"Ambient Weather Station Family"
#define	WEATHERWISE     @"WeatherWise Solar Pro"
#define	IROX			@"iROX Pro-X/Honeywell TE923"
#define	CAPRICORN		@"Columbia Weather Capricorn 2000EX"
#define	KESTREL         @"Kestrel 4000 Family"
#define	MICROSERVER		@"Columbia Weather MicroServer"
#define	QTIUSB			@"QTI USB Probe"
#define	QTISERIAL		@"QTI Serial Probe"
#define	TWI				@"Texas Weather NWS/RWS"
#define	WSNOOP			@"WeatherSnoop XML Feed"

// Deprecated
#define	RAINWISE_DEPRECATED @"RainWise MKIIICC-LR"
#define	WEATHERHAWK_DEPRECATED @"WeatherHawk Series"
#define	PEETBROS_DEPRECATED @"Peet Bros. ULTIMETER 100/800/2000/2100"
#define	WSNOOP_DEPRECATED @"WeatherSnoop TCP/IP Sharing"
#define	WS1080_DEPRECATED @"Ambient Weather WS-1080/WS-2080"
#define	WS1080_DEPRECATED_2 @"WS-1080/WS-2080"


@interface WS2PrefsController : NSObject
{
	// Weather Underground
	BOOL sendDataToWeatherUnderground;
	NSString *wuStationID;
	NSString *wuStationPassword;
	int wuInterval;
	
	// WeatherBug
	BOOL sendDataToWeatherBug;
	NSString *wbStationID;
	NSString *wbStationPassword;
	NSString *wbStationNumber;
	int weatherBugInterval;
	
	// CWOP
	BOOL sendDataToCWOP;
	int cwopInterval;
	NSString *cwopCallSign;
	
	// HTTP Sharing
	BOOL shareDataOnHTTPPort;
	int httpPort;
	
	// FTP Sharing
	BOOL pushDataViaFTP;
	NSString *ftpUsername;
	NSString *ftpPassword;
	NSString *ftpServer;
	NSString *ftpServerPath;
	int ftpUpdateInterval;
	
	// Growl (don't use)
	//	BOOL useGrowl;
	//	int growlInterval;
	
	NSString *stationName;
	NSString *siteName;
	NSString *siteLocation;
	
	float longitudeDegrees, longitudeMinutes, longitudeSeconds;
	int longitudeHemisphere;
	float latitudeDegrees, latitudeMinutes, latitudeSeconds;
	int latitudeHemisphere;
	float elevation;
	int elevationUnits;
}

@property (assign) BOOL sendDataToWeatherUnderground;
@property (retain) NSString *wuStationID;
@property (retain) NSString *wuStationPassword;
@property (assign) int wuInterval;

@property (assign) BOOL sendDataToWeatherBug;
@property (retain) NSString *wbStationID;
@property (retain) NSString *wbStationPassword;
@property (retain) NSString *wbStationNumber;
@property (assign) int weatherBugInterval;

@property (assign) BOOL sendDataToCWOP;
@property (assign) int cwopInterval;
@property (assign) NSString *cwopCallSign;

@property (assign) BOOL shareDataOnHTTPPort;
@property (assign) int httpPort;

@property (assign) BOOL pushDataViaFTP;
@property (retain) NSString *ftpUsername;
@property (retain) NSString *ftpPassword;
@property (retain) NSString *ftpServer;
@property (retain) NSString *ftpServerPath;
@property (assign) int ftpUpdateInterval;

@property (retain) NSString *stationName;
@property (retain) NSString *siteName;
@property (retain) NSString *siteLocation;

@property (assign) float longitudeDegrees;
@property (assign) float longitudeMinutes;
@property (assign) float longitudeSeconds;
@property (assign) int longitudeHemisphere;
@property (assign) float latitudeDegrees;
@property (assign) float latitudeMinutes;
@property (assign) float latitudeSeconds;
@property (assign) int latitudeHemisphere;
@property (assign) float elevation;
@property (assign) int elevationUnits;


- (id)initWithPreferences:(NSString *)file;

@end
