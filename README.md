This open source project allows users to extract pertient settings information from a WeatherSnoop 2 property list file (also known as a plist file).

WeatherSnoop 2 encodes a lot of it settings into two specific keys in the plist file:

- Windows: contains a blob of data with the state of the open windows, as well as all of their settings
- WeatherSite: contains information about the site location, longitude, latitude and elevationn

These blobs of data require unarchving to get to the specific settings. The WS2PrefsController class contains the necessary class hierachy to obtain and pull these settings out. The wS2PrefsReaderAppDelegate instantiates the WS2PrefsController object and demonstrates how to pull out a single setting: the station name.

Feel free to use the WS2PrefsController class from this project as a basis for obtaining these preferences in your project.
