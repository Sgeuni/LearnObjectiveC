# UIView Touch effect
## UIView에 tap기능 넣었을 경우 효과주기

![alt text](https://github.com/Sgeuni/LearnObjectiveC/blob/master/exUIViewTouchEffect/example.gif) </br>

UITapGestureRecognizer를 사용 안하고 UILongPressGestureRecognizer를 사용하는 이유는 </br>
UITapGestureRecognizer는 state의 UIGestureRecognizerStateBegan 경우를 알 수 없다. </br>
(혹시 방법 있다면 말해주세요) UILongPressGestureRecognizer를 사용하여 touch시 start 와 end 부분을 Detect한다. </br>
해당 UI뷰 및 하위 뷰에 같은 효과를 줄 수 있다.
