# Google Map Example
Google map을 원하는 uiView 사이즈 및 위치에 맞게 그리기

![alt text](https://github.com/Sgeuni/LearnObjectiveC/blob/master/exGoogleMap/screenShot.png)
google api key link = https://developers.google.com/maps/documentation/ios-sdk/start?hl=ko 

막힌 부분
1. NSLocationWhenInUseUsageDescription 관련 permission 
해결 -> info.plist open 후
<key>NSLocationWhenInUseUsageDescription</key>
<string>맵 이용하는 이유 입력</string> 
추가

2. 그리고자하는 uiView에 GoogleMap이 원하는 사이즈에 맞게 안그려진다.
해결 -> 소스코드에 나와있듯이 googleMap을 viewDidLoad에서 맵을 그리지 말고 viewDidLayoutSubviews 에서 그린다.
