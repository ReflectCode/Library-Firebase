<h1 align="center">
  <a href="http://www.reflectcode.com">
    ReflectCode
  </a>
</h1>
<p align="center">
  <strong>Automated Source Code Transformation service</strong><br>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green" alt="Platform - Android | iOS" /> 
</p>


-----
# ReflectCode Firebase Demo
[**Firebase**](https://firebase.google.com/) mobile backend as a service, provides an API to synchronizes application data across devices

ReflectCode supports porting of the basic functionality.

With this demo project RC also added - 
1) Detailed report of poring
2) Folder structure in generated Xcode project


## Firebase features supported
* SignUp using Email and Password
* SignIn using Email and Password
* Check result for success / failure
* Write data to database


## Statement Estimation
RC now generates detailed report of its porting process. 
This [**PDF report**](https://github.com/ReflectCode/Library-Firebase/blob/master/FireBaseDemo_RC-Report.pdf) includes graphs and details such as - 
* File wise statement count
* List of external framework included
* List of ToDo Items
* List of APIs which are not ported


## Dev Notes
'Firebase' needs some [configuration](https://firebase.google.com/docs/ios/setup) before running the app  
1) Register bundle ID, its package name in manifest.xml file e.g. *com.reflectcode.demo.firebase*
2) Download the configuration file 'GoogleService-Info.plist'	
3) Copy project to MAC machine
4) Open terminal and add pod packages using *% pod install*
5) Open project workspace in Xcode
6) Drag the 'GoogleService-Info.plist' in project 
7) Build and run app

Tested with - 
[*] MAC OS 10.15.1 Catalina
[*] Cocoa pods 1.8.3
[*] Xcode 11.1

-----
## Screen recording

<img src="/Visuals/ReflectCode-FirebaseDemo.gif" alt="ReflectCode Glide Demo GIF"/>

-----
## Firebase console
Here is the firebase console after running the app


* New users added
<img src="/Visuals/Users-SignedUp.png" alt="SignedUp Users"/>


* New data entry in database
<img src="/Visuals/Users database.png" alt="Users database"/>


-----
## Xcode project structure
The files in xcode projects are now arranged in sub folders

<img src="/Visuals/RC project folder mapping.png" alt="RC project folder mapping"/>

-----


## License

This project is made available under the MIT license. See the LICENSE file for more details.
