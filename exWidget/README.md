# Widget Example
## App을 통한 Widget수정 및 Widget으로 앱 실행시키기


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
해당 소스에서 <br />
NSURL * url = [NSURL URLWithString:@"AppName://PRODUCT_BUNDLE_IDENTIFIER"]; <br />
이와 같이 들어감.
<br />

2. 앱 그룹 설정 <br />
Target (app) -> Capabilities -> AppGroups 선택 <br />
Widget도 동일하게 그룹 설정 <br />

group 이 없다면 '+' 버튼 누른 후 생성 
