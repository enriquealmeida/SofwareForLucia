/*!-----------------------------------------------------------
 * Copyright (c) Microsoft Corporation. All rights reserved.
 * Version: 0.18.0(f8027ea54e0307dcd9b59906ddca042717a810c7)
 * Released under the MIT license
 * https://github.com/Microsoft/vscode/blob/master/LICENSE.txt
 *-----------------------------------------------------------*/
define("vs/editor/editor.main.nls.ko",{"vs/base/browser/ui/actionbar/actionbar":["{0}({1})"],"vs/base/browser/ui/aria/aria":["{0}(다시 발생함)","{0} ({1}번 발생하다)"],"vs/base/browser/ui/findinput/findInput":["입력"],"vs/base/browser/ui/findinput/findInputCheckboxes":["대/소문자 구분","단어 단위로","정규식 사용"],"vs/base/browser/ui/findinput/replaceInput":["input","Preserve Case"],"vs/base/browser/ui/inputbox/inputBox":["오류: {0}","경고: {0}","정보: {0}"],"vs/base/browser/ui/keybindingLabel/keybindingLabel":["바인딩 안 됨"],"vs/base/browser/ui/list/listWidget":["{0}. 탐색하려면 탐색 키를 사용하세요."],"vs/base/browser/ui/menu/menu":["{0}({1})"],"vs/base/browser/ui/tree/abstractTree":["지우기","형식을 기준으로 필터링 사용 안 함","형식을 기준으로 필터링 사용","찾은 요소 없음","{1}개 요소 중 {0}개 일치"],"vs/base/common/keybindingLabels":["Ctrl","<Shift>","<Alt>","Windows","Ctrl","<Shift>","<Alt>","슈퍼","제어","<Shift>","<Alt>","명령","제어","<Shift>","<Alt>","Windows","제어","<Shift>","<Alt>","슈퍼"],"vs/base/common/severity":["오류","경고","정보"],"vs/base/parts/quickopen/browser/quickOpenModel":["{0}, 선택기","선택기"],
"vs/base/parts/quickopen/browser/quickOpenWidget":["빠른 선택기입니다. 결과의 범위를 축소하려면 입력합니다.","빠른 선택기","{0}개 결과"],"vs/editor/browser/controller/coreCommands":["모두 선택(&&S)","실행 취소(&&U)","다시 실행(&&R)"],"vs/editor/browser/controller/textAreaHandler":["The editor is not accessible at this time. Press Alt+F1 for options."],"vs/editor/browser/widget/codeEditorWidget":["커서 수는 {0}(으)로 제한되었습니다."],"vs/editor/browser/widget/diffEditorWidget":["파일 1개가 너무 커서 파일을 비교할 수 없습니다."],"vs/editor/browser/widget/diffReview":["닫기","no lines","1 line","{0} lines","차이 {0}/{1}개: 원본 {2}, {3}, 수정 {4}, {5}","비어 있음","원본 {0}, 수정 {1}: {2}","+ 수정됨 {0}: {1}","- 원본 {0}: {1}","다음 다른 항목으로 이동","다음 다른 항목으로 이동"],"vs/editor/browser/widget/inlineDiffMargin":["Copy deleted lines","Copy deleted line","Copy deleted line ({0})","Revert this change","Copy deleted line ({0})"],
"vs/editor/common/config/commonEditorConfig":["편집기","탭 한 개에 해당하는 공백 수입니다. `#editor.detectIndentation#`이 켜져 있는 경우 이 설정은 파일 콘텐츠에 따라 재정의됩니다.","'탭' 키를 누를 때 공백을 삽입합니다. `#editor.detectIndentation#`이 켜져 있는 경우 이 설정은 파일 콘텐츠에 따라 재정의됩니다.","파일을 열 때 파일 콘텐츠를 기반으로 `#editor.tabSize#`와  `#editor.insertSpaces#`가 자동으로 검색되는지 여부를 제어합니다.","끝에 자동 삽입된 공백을 제거합니다.","큰 파일에 대한 특수 처리로, 메모리를 많이 사용하는 특정 기능을 사용하지 않도록 설정합니다.","문서 내 단어를 기반으로 완성을 계산할지 여부를 제어합니다.","해당 콘텐츠를 두 번 클릭하거나 'Esc' 키를 누르더라도 Peek 편집기를 열린 상태로 유지합니다.","이 길이를 초과하는 줄은 성능상의 이유로 토큰화되지 않습니다.","파일 저장 시 가져오기 구성 작업을 실행할지 여부를 제어합니다.","파일을 저장할 때 자동 수정 작업을 실행해야 하는지 여부를 제어합니다.","저장할 때 실행되는 코드 동작 종류입니다.","저상 시 실행되는 코드 동작이 취소되기 전까의 제한 시간(밀리초)입니다.","diff 편집기에서 diff를 나란히 표시할지 인라인으로 표시할지를 제어합니다.","diff 편집기에서 선행 공백 또는 후행 공백 변경을 diff로 표시할지 여부를 제어합니다.","diff 편집기에서 추가/제거된 변경 내용에 대해 +/- 표시기를 표시하는지 여부를 제어합니다."],
"vs/editor/common/config/editorOptions":["The editor will use platform APIs to detect when a Screen Reader is attached.","The editor will be permanently optimized for usage with a Screen Reader.","The editor will never be optimized for usage with a Screen Reader.","Controls whether the editor should run in a mode where it is optimized for screen readers.","Controls whether copying without a selection copies the current line.","Controls whether the search string in the Find Widget is seeded from the editor selection.","Controls whether the find operation is carried out on selected text or the entire file in the editor.","Controls whether the Find Widget should read or modify the shared find clipboard on macOS.","Controls whether the Find Widget should add extra lines on top of the editor. When true, you can scroll beyond the first line when the Find Widget is visible.","Controls the font size in pixels.","Controls the behavior of 'Go To' commands, like Go To Definition, when multiple target locations exist.","Show peek view of the results (default)","Go to the primary result and show a peek view","Go to the primary result and enable peek-less navigation to others","Controls whether the hover is shown.","Controls the delay in milliseconds after which the hover is shown.","Controls whether the hover should remain visible when mouse is moved over it.","Enables the code action lightbulb in the editor.","Controls the line height. Use 0 to compute the line height from the font size.","Controls whether the minimap is shown.","Controls the side where to render the minimap.","Controls whether the minimap slider is automatically hidden.","Render the actual characters on a line as opposed to color blocks.","Limit the width of the minimap to render at most a certain number of columns.","Enables a pop-up that shows parameter documentation and type information as you type.","Controls whether the parameter hints menu cycles or closes when reaching the end of the list.","Enable quick suggestions inside strings.","Enable quick suggestions inside comments.","Enable quick suggestions outside of strings and comments.","Controls whether suggestions should automatically show up while typing.","Line numbers are not rendered.","Line numbers are rendered as absolute number.","Line numbers are rendered as distance in lines to cursor position.","Line numbers are rendered every 10 lines.","Controls the display of line numbers.","Render vertical rulers after a certain number of monospace characters. Use multiple values for multiple rulers. No rulers are drawn if array is empty.","Controls whether filtering and sorting suggestions accounts for small typos.","Controls whether sorting favours words that appear close to the cursor.","Controls whether remembered suggestion selections are shared between multiple workspaces and windows (needs `#editor.suggestSelection#`).","Control whether an active snippet prevents quick suggestions.","Controls whether to show or hide icons in suggestions.","Controls how many suggestions IntelliSense will show before showing a scrollbar (maximum 15).","Controls whether some suggestion types should be filtered from IntelliSense. A list of suggestion types can be found here: https://code.visualstudio.com/docs/editor/intellisense#_types-of-completions.","When set to `false` IntelliSense never shows `method` suggestions.","When set to `false` IntelliSense never shows `function` suggestions.","When set to `false` IntelliSense never shows `constructor` suggestions.","When set to `false` IntelliSense never shows `field` suggestions.","When set to `false` IntelliSense never shows `variable` suggestions.","When set to `false` IntelliSense never shows `class` suggestions.","When set to `false` IntelliSense never shows `struct` suggestions.","When set to `false` IntelliSense never shows `interface` suggestions.","When set to `false` IntelliSense never shows `module` suggestions.","When set to `false` IntelliSense never shows `property` suggestions.","When set to `false` IntelliSense never shows `event` suggestions.","When set to `false` IntelliSense never shows `operator` suggestions.","When set to `false` IntelliSense never shows `unit` suggestions.","When set to `false` IntelliSense never shows `value` suggestions.","When set to `false` IntelliSense never shows `constant` suggestions.","When set to `false` IntelliSense never shows `enum` suggestions.","When set to `false` IntelliSense never shows `enumMember` suggestions.","When set to `false` IntelliSense never shows `keyword` suggestions.","When set to `false` IntelliSense never shows `text` suggestions.","When set to `false` IntelliSense never shows `color` suggestions.","When set to `false` IntelliSense never shows `file` suggestions.","When set to `false` IntelliSense never shows `reference` suggestions.","When set to `false` IntelliSense never shows `customcolor` suggestions.","When set to `false` IntelliSense never shows `folder` suggestions.","When set to `false` IntelliSense never shows `typeParameter` suggestions.","When set to `false` IntelliSense never shows `snippet` suggestions.","Controls whether suggestions should be accepted on commit characters. For example, in JavaScript, the semi-colon (`;`) can be a commit character that accepts a suggestion and types that character.","Only accept a suggestion with `Enter` when it makes a textual change.","Controls whether suggestions should be accepted on `Enter`, in addition to `Tab`. Helps to avoid ambiguity between inserting new lines or accepting suggestions.","편집기 콘텐츠","Use language configurations to determine when to autoclose brackets.","Autoclose brackets only when the cursor is to the left of whitespace.","Controls whether the editor should automatically close brackets after the user adds an opening bracket.","Type over closing quotes or brackets only if they were automatically inserted.","Controls whether the editor should type over closing quotes or brackets.","Use language configurations to determine when to autoclose quotes.","Autoclose quotes only when the cursor is to the left of whitespace.","Controls whether the editor should automatically close quotes after the user adds an opening quote.","Controls whether the editor should automatically adjust the indentation when users type, paste or move lines. Extensions with indentation rules of the language must be available.","Use language configurations to determine when to automatically surround selections.","Surround with quotes but not brackets.","Surround with brackets but not quotes.","Controls whether the editor should automatically surround selections.","Controls whether the editor shows CodeLens.","Controls whether the editor should render the inline color decorators and color picker.","Controls whether syntax highlighting should be copied into the clipboard.","Control the cursor animation style.","Controls whether the smooth caret animation should be enabled.","Controls the cursor style.","Controls the minimal number of visible leading and trailing lines surrounding the cursor. Known as 'scrollOff' or `scrollOffset` in some other editors.","Controls the width of the cursor when `#editor.cursorStyle#` is set to `line`.","Controls whether the editor should allow moving selections via drag and drop.","Scrolling speed multiplier when pressing `Alt`.","Controls whether the editor has code folding enabled.","Controls the strategy for computing folding ranges. `auto` uses a language specific folding strategy, if available. `indentation` uses the indentation based folding strategy.","Controls the font family.","Enables/Disables font ligatures.","Controls the font weight.","Controls whether the editor should automatically format the pasted content. A formatter must be available and the formatter should be able to format a range in a document.","Controls whether the editor should automatically format the line after typing.","Controls whether the editor should render the vertical glyph margin. Glyph margin is mostly used for debugging.","Controls whether the cursor should be hidden in the overview ruler.","Controls whether the editor should highlight the active indent guide.","Controls the letter spacing in pixels.","Controls whether the editor should detect links and make them clickable.","Highlight matching brackets when one of them is selected.","A multiplier to be used on the `deltaX` and `deltaY` of mouse wheel scroll events.","Zoom the font of the editor when using mouse wheel and holding `Ctrl`.","Merge multiple cursors when they are overlapping.","Maps to `Control` on Windows and Linux and to `Command` on macOS.","Maps to `Alt` on Windows and Linux and to `Option` on macOS.","The modifier to be used to add multiple cursors with the mouse. The Go To Definition and Open Link mouse gestures will adapt such that they do not conflict with the multicursor modifier. [Read more](https://code.visualstudio.com/docs/editor/codebasics#_multicursor-modifier).","Each cursor pastes a single line of the text.","Each cursor pastes the full text.","Controls pasting when the line count of the pasted text matches the cursor count.","Controls whether the editor should highlight semantic symbol occurrences.","Controls whether a border should be drawn around the overview ruler.","Controls the number of decorations that can show up at the same position in the overview ruler.","Controls the delay in milliseconds after which quick suggestions will show up.","Controls whether the editor should render control characters.","Controls whether the editor should render indent guides.","Render last line number when the file ends with a newline.","Highlights both the gutter and the current line.","Controls how the editor should render the current line highlight.","Render whitespace characters except for single spaces between words.","Render whitespace characters only on selected text.","Controls how the editor should render whitespace characters.","Controls whether selections should have rounded corners.","Controls the number of extra characters beyond which the editor will scroll horizontally.","Controls whether the editor will scroll beyond the last line.","Controls whether the Linux primary clipboard should be supported.","Controls whether the editor should highlight matches similar to the selection.","Controls whether the fold controls on the gutter are automatically hidden.","Controls fading out of unused code.","Show snippet suggestions on top of other suggestions.","Show snippet suggestions below other suggestions.","Show snippets suggestions with other suggestions.","Do not show snippet suggestions.","Controls whether snippets are shown with other suggestions and how they are sorted.","Controls whether the editor will scroll using an animation.","Font size for the suggest widget. When set to `0`, the value of `#editor.fontSize#` is used.","Line height for the suggest widget. When set to `0`, the value of `#editor.lineHeight#` is used.","Controls whether suggestions should automatically show up when typing trigger characters.","Always select the first suggestion.","Select recent suggestions unless further typing selects one, e.g. `console.| -> console.log` because `log` has been completed recently.","Select suggestions based on previous prefixes that have completed those suggestions, e.g. `co -> console` and `con -> const`.","Controls how suggestions are pre-selected when showing the suggest list.","Tab complete will insert the best matching suggestion when pressing tab.","Disable tab completions.","Tab complete snippets when their prefix match. Works best when 'quickSuggestions' aren't enabled.","Enables tab completions.","Inserting and deleting whitespace follows tab stops.","Characters that will be used as word separators when doing word related navigations or operations.","Lines will never wrap.","Lines will wrap at the viewport width.","Lines will wrap at `#editor.wordWrapColumn#`.","Lines will wrap at the minimum of viewport and `#editor.wordWrapColumn#`.","Controls how lines should wrap.","Controls the wrapping column of the editor when `#editor.wordWrap#` is `wordWrapColumn` or `bounded`.","No indentation. Wrapped lines begin at column 1.","Wrapped lines get the same indentation as the parent.","Wrapped lines get +1 indentation toward the parent.","Wrapped lines get +2 indentation toward the parent.","Controls the indentation of wrapped lines."],
"vs/editor/common/modes/modesRegistry":["일반 텍스트"],
"vs/editor/common/standaloneStrings":["없음 선택","줄 {0}, 열 {1}({2} 선택됨)입니다.","행 {0}, 열 {1}","{0} 선택 항목({1}자 선택됨)","{0} 선택 항목","이제 'accessibilitySupport' 설정을 'on'으로 변경합니다.","지금 편집기 접근성 문서 페이지를 여세요.","차이 편집기의 읽기 전용 창에서.","diff 편집기 창에서."," 읽기 전용 코드 편집기에서"," 코드 편집기에서","화면 판독기 사용에 최적화되도록 편집기를 구성하려면 지금 Command+E를 누르세요.","화면 판독기에 사용할 수 있도록 편집기를 최적화하려면 지금 Ctrl+E를 누르세요.","The editor is configured to be optimized for usage with a Screen Reader.","The editor is configured to never be optimized for usage with a Screen Reader, which is not the case at this time.","현재 편집기에서 <Tab> 키를 누르면 포커스가 다음 포커스 가능한 요소로 이동합니다. {0}을(를) 눌러서 이 동작을 설정/해제합니다.","현재 편집기에서 <Tab> 키를 누르면 포커스가 다음 포커스 가능한 요소로 이동합니다. {0} 명령은 현재 키 바인딩으로 트리거할 수 없습니다.","현재 편집기에서 <Tab> 키를 누르면 탭 문자가 삽입됩니다. {0}을(를) 눌러서 이 동작을 설정/해제합니다.","현재 편집기에서 <Tab> 키를 누르면 탭 문자가 삽입됩니다. {0} 명령은 현재 키 바인딩으로 트리거할 수 없습니다.","Command+H를 눌러 편집기 접근성과 관련된 자세한 정보가 있는 브라우저 창을 여세요.","Ctrl+H를 눌러 편집기 접근성과 관련된 자세한 정보가 있는 브라우저 창을 엽니다.","이 도구 설명을 해제하고 Esc 키 또는 Shift+Esc를 눌러서 편집기로 돌아갈 수 있습니다.","접근성 도움말 표시","개발자: 검사 토큰","줄 {0} 및 문자 {1}(으)로 이동","줄 {0}(으)로 이동","이동할 1과 {0} 사이의 줄 번호 입력","검색하려면 1-{0}자 사이의 문자를 입력하세요.","현재 줄: {0}. 줄 {1}(으)로 이동합니다.","행 번호를 입력하고 콜론(:)과 문자 번호를 입력하여 검색하세요.","줄 이동...","{0}, {1}, 명령","{0}, 명령","실행하려는 작업의 이름을 입력하세요.","명령 팔레트","{0}, 기호","검색하려는 ID의 이름을 입력하세요.","기호로 가서...","기호({0})","모듈({0})","클래스({0})","인터페이스({0})","메서드({0})","함수({0})","속성({0})","변수({0})","변수({0})","생성자({0})","호출({0})","편집기 콘텐츠","내게 필요한 옵션을 보려면 Ctrl+F1을 누릅니다.","접근성 옵션은 Alt+F1을 눌러여 합니다.","고대비 테마로 전환","{1} 파일에서 편집을 {0}개 했습니다."],
"vs/editor/common/view/editorColorRegistry":["커서 위치의 줄 강조 표시에 대한 배경색입니다.","커서 위치의 줄 테두리에 대한 배경색입니다.","빠른 열기 및 찾기 기능 등을 통해 강조 표시된 영역의 배경색입니다. 기본 장식을 숨기지 않도록 색은 불투명하지 않아야 합니다.","강조 영역 주변의 테두리에 대한 배경색입니다","편집기 커서 색입니다.","편집기 커서의 배경색입니다. 블록 커서와 겹치는 글자의 색상을 사용자 정의할 수 있습니다.","편집기의 공백 문자 색입니다.","편집기 들여쓰기 안내선 색입니다.","활성 편집기 들여쓰기 안내선 색입니다.","편집기 줄 번호 색입니다.","편집기 활성 영역 줄번호 색상","ID는 사용되지 않습니다. 대신 'editorLineNumber.activeForeground'를 사용하세요.","편집기 활성 영역 줄번호 색상","편집기 눈금의 색상입니다.","편집기 코드 렌즈의 전경색입니다.","일치하는 괄호 뒤의 배경색","일치하는 브래킷 박스의 색상","개요 눈금 경계의 색상입니다.","편집기 거터의 배경색입니다. 거터에는 글리프 여백과 행 수가 있습니다.","편집기의 불필요한(사용하지 않는) 소스 코드 테두리 색입니다.","편집기의 불필요한(사용하지 않는) 소스 코드 불투명도입니다. 예를 들어 \"#000000c0\"은 75% 불투명도로 코드를 렌더링합니다. 고대비 테마의 경우 페이드 아웃하지 않고 'editorUnnecessaryCode.border' 테마 색을 사용하여 불필요한 코드에 밑줄을 그으세요.","오류의 개요 눈금자 마커 색입니다.","경고의 개요 눈금자 마커 색입니다.","정보의 개요 눈금자 마커 색입니다."],"vs/editor/contrib/bracketMatching/bracketMatching":["괄호에 해당하는 영역을 표시자에 채색하여 표시합니다.","대괄호로 이동","괄호까지 선택","대괄호로 이동(&&B)"],
"vs/editor/contrib/caretOperations/caretOperations":["캐럿을 왼쪽으로 이동","캐럿을 오른쪽으로 이동"],"vs/editor/contrib/caretOperations/transpose":["문자 바꾸기"],"vs/editor/contrib/clipboard/clipboard":["잘라내기","잘라내기(&&T)","복사","복사(&&C)","붙여넣기","붙여넣기(&&P)","구문을 강조 표시하여 복사"],"vs/editor/contrib/codeAction/codeActionCommands":["An unknown error occurred while applying the code action","빠른 수정...","사용 가능한 코드 동작이 없습니다.","사용 가능한 코드 동작이 없습니다.","리팩터링...","사용 가능한 리펙터링이 없습니다.","소스 작업...","사용 가능한 소스 작업이 없습니다.","가져오기 구성","사용 가능한 가져오기 구성 작업이 없습니다.","모두 수정","모든 작업 수정 사용 불가","자동 수정...","사용할 수 있는 자동 수정 없음"],"vs/editor/contrib/codeAction/lightBulbWidget":["Show Fixes ({0})","Show Fixes"],"vs/editor/contrib/comment/comment":["줄 주석 설정/해제","줄 주석 설정/해제(&&T)","줄 주석 추가","줄 주석 제거","블록 주석 설정/해제","블록 주석 설정/해제(&&B)"],"vs/editor/contrib/contextmenu/contextmenu":["편집기 상황에 맞는 메뉴 표시"],"vs/editor/contrib/cursorUndo/cursorUndo":["소프트 실행 취소"],
"vs/editor/contrib/find/findController":["찾기","찾기(&&F)","선택 영역에서 찾기","다음 찾기","다음 찾기","이전 찾기","이전 찾기","다음 선택 찾기","이전 선택 찾기","바꾸기","바꾸기(&&R)"],"vs/editor/contrib/find/findWidget":["찾기","찾기","이전 일치","다음 일치 항목","선택 항목에서 찾기","닫기","바꾸기","바꾸기","바꾸기","모두 바꾸기","바꾸기 모드 설정/해제","처음 {0}개의 결과가 강조 표시되지만 모든 찾기 작업은 전체 텍스트에 대해 수행됩니다.","{1}의 {0}","결과 없음","{0} found","{0} found for {1}","{0} found for {1} at {2}","{0} found for {1}","Ctrl+Enter now inserts line break instead of replacing all. You can modify the keybinding for editor.action.replaceAll to override this behavior."],"vs/editor/contrib/folding/folding":["펼치기","재귀적으로 펼치기","접기","Toggle Fold","재귀적으로 접기","모든 블록 코멘트를 접기","모든 영역 접기","모든 영역 펼치기","모두 접기","모두 펼치기","수준 {0} 접기"],"vs/editor/contrib/fontZoom/fontZoom":["편집기 글꼴 확대","편집기 글꼴 축소","편집기 글꼴 확대/축소 다시 설정"],"vs/editor/contrib/format/format":["줄 {0}에서 1개 서식 편집을 수행했습니다.","줄 {1}에서 {0}개 서식 편집을 수행했습니다.","줄 {0}과(와) {1} 사이에서 1개 서식 편집을 수행했습니다.","줄 {1}과(와) {2} 사이에서 {0}개 서식 편집을 수행했습니다."],
"vs/editor/contrib/format/formatActions":["문서 서식","선택 영역 서식"],"vs/editor/contrib/goToDefinition/goToDefinitionCommands":["'{0}'에 대한 정의를 찾을 수 없습니다.","정의를 찾을 수 없음","– {0} 정의","정의로 이동","측면에서 정의 열기","정의 피킹(Peeking)","'{0}'에 대한 선언을 찾을 수 없음","선언을 찾을 수 없음"," - {0} 선언","선언으로 이동","'{0}'에 대한 선언을 찾을 수 없음","선언을 찾을 수 없음"," - {0} 선언","선언 미리 보기","'{0}'에 대한 구현을 찾을 수 없습니다.","구현을 찾을 수 없습니다."," – {0} 개 구현","구현으로 이동","구현 미리 보기","'{0}'에 대한 형식 정의를 찾을 수 없습니다.","형식 정의를 찾을 수 없습니다.","– {0} 형식 정의","형식 정의로 이동","형식 정의 미리 보기","정의로 이동(&&D)","형식 정의로 이동(&&T)","구현으로 이동(&&I)"],"vs/editor/contrib/goToDefinition/goToDefinitionMouse":["{0}개 정의를 표시하려면 클릭하세요."],"vs/editor/contrib/goToDefinition/goToDefinitionResultsNavigation":["Symbol {0} of {1}, {2} for next","Symbol {0} of {1}"],"vs/editor/contrib/gotoError/gotoError":["다음 문제로 이동 (오류, 경고, 정보)","이전 문제로 이동 (오류, 경고, 정보)","파일의 다음 문제로 이동 (오류, 경고, 정보)","파일의 이전 문제로 이동 (오류, 경고, 정보)","다음 문제(&&P)","이전 문제(&&P)"],
"vs/editor/contrib/gotoError/gotoErrorWidget":["문제 {1}개 중 {0}개","문제 {1}개 중 {0}개","편집기 표식 탐색 위젯 오류 색입니다.","편집기 표식 탐색 위젯 경고 색입니다.","편집기 표식 탐색 위젯 정보 색입니다.","편집기 표식 탐색 위젯 배경입니다."],"vs/editor/contrib/hover/hover":["가리키기 표시"],"vs/editor/contrib/hover/modesContentHover":["로드 중...","문제 보기","Checking for quick fixes...","No quick fixes available","빠른 수정..."],"vs/editor/contrib/inPlaceReplace/inPlaceReplace":["이전 값으로 바꾸기","다음 값으로 바꾸기"],"vs/editor/contrib/linesOperations/linesOperations":["위에 줄 복사","위에 줄 복사(&&C)","아래에 줄 복사","아래에 줄 복사(&&P)","줄 위로 이동","줄 위로 이동(&&V)","줄 아래로 이동","줄 아래로 이동(&&L)","줄을 오름차순 정렬","줄을 내림차순으로 정렬","후행 공백 자르기","줄 삭제","줄 들여쓰기","줄 내어쓰기","위에 줄 삽입","아래에 줄 삽입","왼쪽 모두 삭제","우측에 있는 항목 삭제","줄 연결","커서 주위 문자 바꾸기","대문자로 변환","소문자로 변환","단어의 첫 글자를 대문자로 변환"],"vs/editor/contrib/links/links":["Execute command","Follow link","click","click","click","click","{0} 형식이 올바르지 않으므로 이 링크를 열지 못했습니다","대상이 없으므로 이 링크를 열지 못했습니다.","링크 열기"],"vs/editor/contrib/message/messageController":["읽기 전용 편집기에서는 편집할 수 없습니다."],
"vs/editor/contrib/multicursor/multicursor":["위에 커서 추가","위에 커서 추가(&&A)","아래에 커서 추가","아래에 커서 추가(&&D)","줄 끝에 커서 추가","줄 끝에 커서 추가(&&U)","맨 아래에 커서 추가","맨 위에 커서 추가","다음 일치 항목 찾기에 선택 항목 추가","다음 항목 추가(&&N)","이전 일치 항목 찾기에 선택 항목 추가","이전 항목 추가(&&R)","다음 일치 항목 찾기로 마지막 선택 항목 이동","마지막 선택 항목을 이전 일치 항목 찾기로 이동","일치 항목 찾기의 모든 항목 선택","모든 항목 선택(&&O)","모든 항목 변경"],"vs/editor/contrib/parameterHints/parameterHints":["매개 변수 힌트 트리거"],"vs/editor/contrib/parameterHints/parameterHintsWidget":["{0}, 힌트"],"vs/editor/contrib/referenceSearch/peekViewWidget":["닫기"],"vs/editor/contrib/referenceSearch/referenceSearch":["–참조 {0}개","참조 미리 보기"],"vs/editor/contrib/referenceSearch/referencesController":["로드 중..."],"vs/editor/contrib/referenceSearch/referencesModel":["{2}열, {1}줄, {0}의 기호","{0}의 기호 1개, 전체 경로 {1}","{1}의 기호 {0}개, 전체 경로 {2}","결과 없음","{0}에서 기호 1개를 찾았습니다.","{1}에서 기호 {0}개를 찾았습니다.","{1}개 파일에서 기호 {0}개를 찾았습니다."],"vs/editor/contrib/referenceSearch/referencesTree":["파일을 확인하지 못했습니다.","참조 {0}개","참조 {0}개"],
"vs/editor/contrib/referenceSearch/referencesWidget":["미리 보기를 사용할 수 없음","참조","결과 없음","참조","Peek 뷰 제목 영역의 배경색입니다.","Peek 뷰 제목 색입니다.","Peek 뷰 제목 정보 색입니다.","Peek 뷰 테두리 및 화살표 색입니다.","Peek 뷰 결과 목록의 배경색입니다.","Peek 뷰 결과 목록에서 라인 노드의 전경색입니다.","Peek 뷰 결과 목록에서 파일 노드의 전경색입니다.","Peek 뷰 결과 목록에서 선택된 항목의 배경색입니다.","Peek 뷰 결과 목록에서 선택된 항목의 전경색입니다.","Peek 뷰 편집기의 배경색입니다.","Peek 뷰 편집기의 거터 배경색입니다.","Peek 뷰 결과 목록의 일치 항목 강조 표시 색입니다.","Peek 뷰 편집기의 일치 항목 강조 표시 색입니다.","Peek 뷰 편집기의 일치 항목 강조 표시 테두리입니다."],"vs/editor/contrib/rename/rename":["결과가 없습니다.","위치 이름을 바꾸는 중 알 수 없는 오류가 발생했습니다.","'{0}'을(를) '{1}'(으)로 이름을 변경했습니다. 요약: {2}","이름 변경을 실행하지 못했습니다.","기호 이름 바꾸기"],"vs/editor/contrib/rename/renameInputField":["입력 이름을 바꾸세요. 새 이름을 입력한 다음 [Enter] 키를 눌러 커밋하세요."],"vs/editor/contrib/smartSelect/smartSelect":["선택 영역 확장","선택 영역 확장(&&E)","선택 영역 축소","선택 영역 축소(&&S)"],
"vs/editor/contrib/snippet/snippetVariables":["일요일","월요일","화요일","수요일","목요일","금요일  ","토요일","일","월","화","수","목","금","토","1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월","1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],"vs/editor/contrib/suggest/suggestController":["{0}의 {1}개의 수정사항을 수락하는 중","제안 항목 트리거"],"vs/editor/contrib/suggest/suggestWidget":["제안 위젯의 배경색입니다.","제안 위젯의 테두리 색입니다.","제안 위젯의 전경색입니다.","제한 위젯에서 선택된 항목의 배경색입니다.","제안 위젯의 일치 항목 강조 표시 색입니다.","자세히 알아보기...{0}","간단히 보기...{0}","Loading...","로드 중...","제안 항목이 없습니다.","항목 {0}, 문서: {1}"],"vs/editor/contrib/toggleTabFocusMode/toggleTabFocusMode":["<Tab> 키로 포커스 이동 설정/해제","이제 <Tab> 키를 누르면 포커스가 다음 포커스 가능한 요소로 이동합니다.","이제 <Tab> 키를 누르면 탭 문자가 삽입됩니다."],"vs/editor/contrib/tokenization/tokenization":["개발자: 강제로 다시 토큰화"],
"vs/editor/contrib/wordHighlighter/wordHighlighter":["변수 읽기와 같은 읽기 액세스 중 기호의 배경색입니다. 기본 장식을 숨기지 않도록 색은 불투명하지 않아야 합니다.","변수에 쓰기와 같은 쓰기 액세스 중 기호의 배경색입니다. 기본 장식을 숨기지 않도록 색은 불투명하지 않아야 합니다.","변수 읽기와 같은 읽기 액세스 중 기호의 테두리 색입니다.","변수에 쓰기와 같은 쓰기 액세스 중 기호의 테두리 색입니다.","기호 강조 표시의 개요 눈금자 표식 색입니다. 기본 장식을 숨기지 않도록 색은 불투명하지 않아야 합니다.","쓰기 액세스 기호에 대한 개요 눈금자 표식 색이 강조 표시됩니다. 기본 장식을 숨기지 않도록 색은 불투명하지 않아야 합니다.","다음 강조 기호로 이동","이전 강조 기호로 이동","기호 강조 표시 트리거"],"vs/platform/configuration/common/configurationRegistry":["기본 구성 재정의","언어에 대해 재정의할 편집기 설정을 구성합니다.","'{0}'을(를) 등록할 수 없습니다. 이는 언어별 편집기 설정을 설명하는 속성 패턴인 '\\\\[.*\\\\]$'과(와) 일치합니다. 'configurationDefaults' 기여를 사용하세요.","'{0}'을(를) 등록할 수 없습니다. 이 속성은 이미 등록되어 있습니다."],"vs/platform/keybinding/common/abstractKeybindingService":["({0})을(를) 눌렀습니다. 둘째 키는 잠시 기다렸다가 누르세요.","키 조합({0}, {1})은 명령이 아닙니다."],
"vs/platform/list/browser/listService":["워크벤치","Windows와 Linux의 'Control'을 macOS의 'Command'로 매핑합니다.","Windows와 Linux의 'Alt'를 macOS의 'Option'으로 매핑합니다.","마우스로 트리와 목록의 항목을 다중 선택에 추가할 때 사용할 한정자입니다(예를 들어 탐색기에서 편집기와 SCM 보기를 여는 경우). '옆에서 열기' 마우스 제스처(지원되는 경우)는 다중 선택 한정자와 충돌하지 않도록 조정됩니다.","트리와 목록에서 마우스를 사용하여 항목을 여는 방법을 제어합니다(지원되는 경우). 트리에서 자식 항목이 있는 부모 항목의 경우 이 설정은 부모 항목을 한 번 클릭으로 확장할지 또는 두 번 클릭으로 확장할지 여부를 제어합니다. 일부 트리와 목록에서는 이 설정을 적용할 수 없는 경우  무시하도록 선택할 수 있습니다. ","Workbench에서 목록 및 트리가 가로 스크롤을 지원하는지 여부를 제어합니다.","워크벤치에서 수평 스크롤 지원 여부를 제어 합니다.","이 설정은 사용되지 않습니다. 대신 '{0}'을(를) 사용하세요.","트리 들여쓰기를 픽셀 단위로 제어합니다.","Controls whether the tree should render indent guides.","간단한 키보드 탐색에서는 키보드 입력과 일치하는 요소에 집중합니다. 일치는 접두사에서만 수행됩니다.","키보드 탐색 강조 표시에서는 키보드 입력과 일치하는 요소를 강조 표시합니다. 이후로 탐색에서 위 및 아래로 이동하는 경우 강조 표시된 요소만 트래버스합니다.","키보드 탐색 필터링에서는 키보드 입력과 일치하지 않는 요소를 모두 필터링하여 숨깁니다.","워크벤치의 목록 및 트리 키보드 탐색 스타일을 제어합니다. 간소화하고, 강조 표시하고, 필터링할 수 있습니다.","목록 및 트리에서 키보드 탐색이 입력만으로 자동 트리거되는지 여부를 제어합니다. 'false'로 설정하면 'list.toggleKeyboardNavigation' 명령을 실행할 때만 키보드 탐색이 트리거되어 바로 가기 키를 할당할 수 있습니다."],
"vs/platform/markers/common/markers":["오류","경고","정보"],
"vs/platform/theme/common/colorRegistry":["전체 전경색입니다. 이 색은 구성 요소에서 재정의하지 않은 경우에만 사용됩니다.","오류 메시지에 대한 전체 전경색입니다. 이 색은 구성 요소에서 재정의하지 않은 경우에만 사용됩니다.","포커스가 있는 요소의 전체 테두리 색입니다. 이 색은 구성 요소에서 재정의하지 않은 경우에만 사용됩니다.","더 뚜렷이 대비되도록 요소를 다른 요소와 구분하는 요소 주위의 추가 테두리입니다.","더 뚜렷이 대비되도록 요소를 다른 요소와 구분하는 활성 요소 주위의 추가 테두리입니다.","텍스트 내 링크의 전경색입니다.","텍스트 내 코드 블록의 전경색입니다.","편집기 내에서 찾기/바꾸기 같은 위젯의 그림자 색입니다.","입력 상자 배경입니다.","입력 상자 전경입니다.","입력 상자 테두리입니다.","입력 필드에서 활성화된 옵션의 테두리 색입니다.","Background color of activated options in input fields.","정보 심각도의 입력 유효성 검사 배경색입니다.","정보 심각도의 입력 유효성 검사 전경색입니다.","정보 심각도의 입력 유효성 검사 테두리 색입니다.","경고 심각도의 입력 유효성 검사 배경색입니다.","경고 심각도의 입력 유효성 검사 전경색입니다.","경고 심각도의 입력 유효성 검사 테두리 색입니다.","오류 심각도의 입력 유효성 검사 배경색입니다.","오류 심각도의 입력 유효성 검사 전경색입니다.","오류 심각도의 입력 유효성 검사 테두리 색입니다.","드롭다운 배경입니다.","드롭다운 전경입니다.","목록/트리가 활성 상태인 경우 포커스가 있는 항목의 목록/트리 배경색입니다. 목록/트리가 활성 상태이면 키보드 포커스를 가지며, 비활성 상태이면 포커스가 없습니다.","목록/트리가 활성 상태인 경우 포커스가 있는 항목의 목록/트리 전경색입니다. 목록/트리가 활성 상태이면 키보드 포커스를 가지며, 비활성 상태이면 포커스가 없습니다.","목록/트리가 활성 상태인 경우 선택한 항목의 목록/트리 배경색입니다. 목록/트리가 활성 상태이면 키보드 포커스를 가지며, 비활성 상태이면 포커스가 없습니다.","목록/트리가 활성 상태인 경우 선택한 항목의 목록/트리 전경색입니다. 목록/트리가 활성 상태이면 키보드 포커스를 가지며, 비활성 상태이면 포커스가 없습니다.","목록/트리가 비활성 상태인 경우 선택한 항목의 목록/트리 배경색입니다. 목록/트리가 활성 상태이면 키보드 포커스를 가지며, 비활성 상태이면 포커스가 없습니다.","목록/트리가 비활성 상태인 경우 선택한 항목의 목록/트리 전경색입니다. 목록/트리가 활성 상태이면 키보드 포커스를 가지며, 비활성 상태이면 포커스가 없습니다.","목록/트리가 비활성 상태인 경우 포커스가 있는 항목의 목록/트리 배경색입니다. 목록/트리가 활성 상태이면 키보드 포커스를 가지며, 비활성 상태이면 포커스가 없습니다.","마우스로 항목을 가리킬 때 목록/트리 배경입니다.","마우스로 항목을 가리킬 때 목록/트리 전경입니다.","마우스로 항목을 이동할 때 목록/트리 끌어서 놓기 배경입니다.","목록/트리 내에서 검색할 때 일치 항목 강조 표시의 목록/트리 전경색입니다.","목록 및 트리에서 형식 필터 위젯의 배경색입니다.","목록 및 트리에서 형식 필터 위젯의 윤곽 색입니다.","일치하는 항목이 없을 때 목록 및 트리에서 표시되는 형식 필터 위젯의 윤곽 색입니다.","Tree stroke color for the indentation guides.","그룹화 레이블에 대한 빠른 선택기 색입니다.","그룹화 테두리에 대한 빠른 선택기 색입니다.","배지 배경색입니다. 배지는 검색 결과 수와 같은 소량의 정보 레이블입니다.","배지 전경색입니다. 배지는 검색 결과 수와 같은 소량의 정보 레이블입니다.","스크롤되는 보기를 나타내는 스크롤 막대 그림자입니다.","스크롤 막대 슬라이버 배경색입니다.","마우스로 가리킬 때 스크롤 막대 슬라이더 배경색입니다.","클릭된 상태일 때 스크롤 막대 슬라이더 배경색입니다.","오래 실행 중인 작업에 대해 표시되는 진행률 표시 막대의 배경색입니다.","메뉴 테두리 색입니다.","메뉴 항목 전경색입니다.","메뉴 항목 배경색입니다.","메뉴의 선택된 메뉴 항목 전경색입니다.","메뉴의 선택된 메뉴 항목 배경색입니다.","메뉴의 선택된 메뉴 항목 테두리 색입니다.","메뉴에서 구분 기호 메뉴 항목의 색입니다.","Foreground color of error squigglies in the editor.","Border color of error boxes in the editor.","Foreground color of warning squigglies in the editor.","Border color of warning boxes in the editor.","Foreground color of info squigglies in the editor.","Border color of info boxes in the editor.","Foreground color of hint squigglies in the editor.","Border color of hint boxes in the editor.","편집기 배경색입니다.","편집기 기본 전경색입니다.","찾기/바꾸기 같은 편집기 위젯의 배경색입니다.","Foreground color of editor widgets, such as find/replace.","편집기 위젯의 테두리 색입니다. 위젯에 테두리가 있고 위젯이 색상을 무시하지 않을 때만 사용됩니다.","편집기 위젯 크기 조정 막대의 테두리 색입니다. 이 색은 위젯에서 크기 조정 막대를 표시하도록 선택하고 위젯에서 색을 재지정하지 않는 경우에만 사용됩니다.","편집기 선택 영역의 색입니다.","고대비를 위한 선택 텍스트의 색입니다.","비활성 편집기의 선택 항목 색입니다. 기본 장식을 숨기지 않도록 색은 불투명하지 않아야 합니다.","선택 영역과 동일한 콘텐츠가 있는 영역의 색입니다. 기본 장식을 숨기지 않도록 색은 불투명하지 않아야 합니다.","선택 영역과 동일한 콘텐츠가 있는 영역의 테두리 색입니다.","현재 검색 일치 항목의 색입니다.","기타 검색 일치 항목의 색입니다. 기본 장식을 숨기지 않도록 색은 불투명하지 않아야 합니다.","검색을 제한하는 범위의 색입니다. 기본 장식을 숨기지 않도록 색은 불투명하지 않아야 합니다.","현재 검색과 일치하는 테두리 색입니다.","다른 검색과 일치하는 테두리 색입니다.","검색을 제한하는 범위의 테두리 색입니다. 기본 장식을 숨기지 않도록 색은 불투명하지 않아야 합니다.","호버가 표시된 단어 아래를 강조 표시합니다. 기본 장식을 숨기지 않도록 색은 불투명하지 않아야 합니다.","편집기 호버의 배경색.","편집기 호버의 테두리 색입니다.","편집기 호버 상태 표시줄의 배경색입니다.","활성 링크의 색입니다.","The color used for the lightbulb actions icon.","The color used for the lightbulb auto fix actions icon.","삽입된 텍스트의 배경색입니다. 기본 장식을 숨기지 않도록 색은 불투명하지 않아야 합니다.","제거된 텍스트 배경색입니다. 기본 장식을 숨기지 않도록 색은 불투명하지 않아야 합니다.","삽입된 텍스트의 윤곽선 색입니다.","제거된 텍스트의 윤곽선 색입니다.","두 텍스트 편집기 사이의 테두리 색입니다.","코드 조각 탭 정지의 강조 표시 배경색입니다.","코드 조각 탭 정지의 강조 표시 테두리 색입니다.","코드 조각 마지막 탭 정지의 강조 표시 배경색입니다.","코드 조각 마지막 탭 정지의 강조 표시 배경색입니다.","일치 항목 찾기의 개요 눈금자 표식 색입니다. 기본 장식을 숨기지 않도록 색은 불투명하지 않아야 합니다.","선택 항목의 개요 눈금자 표식 색이 강조 표시됩니다. 기본 장식을 숨기지 않도록 색은 불투명하지 않아야 합니다.","Minimap marker color for find matches.","Minimap marker color for the editor selection."]
});
//# sourceMappingURL=editor.main.nls.ko.js.map
