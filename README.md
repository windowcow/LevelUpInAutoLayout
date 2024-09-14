# 5강 
> 2024 0914
## AutoLayout 이 뭔가요?
뷰들의 크기와 위치를 설정하는 여러 방법론이 있다.
그 중 하나가 바로 AutoLayout이라는 개념이다.

AutoLayout라는 큰 틀에서 Anchor라는 개념이 사용된다.
우리가 A4 용지에 작은 네모를 배치한다고 생각해보자

AutoLayout에서는 사각형의 배치, 크기를 정하기 위해서 그 사각형이 가질 수 있는 가상의 속성 몇 가지를 정의한다.
(물론 이게 다는 아니고 이해를 위해 임의로 이렇게 나누었다.)

1. Position Anchor
    - 사각형의 상하좌우 변이 A4 의 상하좌우 변과 어떤 관계를 가지는지
2. Sizing Anchors 
    - 사각형의 너비, 높이
3. Alignment Anchors
    - 사각형이 A4의 몇 % 정도에 위치하는지 (Center 등)
4*. BaseLine Anchors
    - 사각형 안에 글자가 있다면 다른 사각형의 글자와 수평선을 일치시킬 수 있다.


## SafeAreaLayoutGuide 가 뭔가요?
A4에서 맨 윗 쪽과 맨 아랫 쪽에 글자를 적으면 나중에 문제가 생길 수 있다.
예를 들어서 스테이플러를 왼쪽 위에 찍을 때가 많으니까
거기에는 글자를 적지 않는게 국룰이다.
마찬가지로 뷰 컨트롤러도 이런 국룰을 가질 때가 있는데
상단바, 하단 탭바, 네비게이션바가 있는 경우 이걸 존중해서 다른 뷰를 배치해야한다.

```swift
topLeadingLabel.topAnchor
    .constraint(equalTo: view.topAnchor, constant: 8).isActive = true
topLeadingLabel.leadingAnchor
    .constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
```
이렇게 쓰기보다는

```swift
topLeadingLabel.topAnchor
    .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 8).isActive = true

topLeadingLabel.leadingAnchor
    .constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 8).isActive = true
```

이렇게 적어야 한다.

# 토막 지식
- 사각형 크기를 정하는 방법?
    1. WidthAnchor를 통해서 명시적으로 정하는 방식이 있고
    2. 다른 Anchor를 통해서 Dynamic하게 정할 수 있다.
        - 이때 당연히 Width가 변경될 수 있다. 
        - 변경되지 않을 크기는 WidthAnchor로 정하면 되는거다
