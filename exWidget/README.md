# Widget Example
## App에서 Widget수정 / Widget으로 앱 deeplink실행 / Widget expand 기능 추가.

![alt text](https://github.com/Sgeuni/LearnObjectiveC/blob/master/exWidget/example.gif) </br>

1. info.plist에 URL types 추가<br />
```html
	<key>CFBundleURLTypes</key>
	  <array>
	    <dict>
	        <key>CFBundleURLName</key>
	        <string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
	        <key>CFBundleURLSchemes</key>
	        <array>
	            <string>AppName</string>
	        </array>
	    </dict>
	  </array>
```
해당 소스에서는 <br />
NSURL * url = [NSURL URLWithString:@"**AppName**://**PRODUCT_BUNDLE_IDENTIFIER**"]; <br />
이와 같이 들어감.
<br />

2. 앱 그룹 설정 <br />
	Target (app) -> Capabilities -> AppGroups 선택 <br />
	Widget도 동일하게 그룹 설정 <br />
	group 이 없다면 '+' 버튼 누른 후 생성 
