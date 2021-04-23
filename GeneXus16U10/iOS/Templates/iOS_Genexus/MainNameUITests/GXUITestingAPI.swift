//
//  GXUITestingAPI.swift
//

@_exported import Foundation
@_exported import GXStandardClasses
@_exported import GXObjectsModel
import XCTest

// GXTest 4 UITest object

public class SdtUITestSD {
	public func back( )
	{
		GXEOUITestSD.back()
	}

	public func tap( _ target: String )
	{
		GXEOUITestSD.tap(target)
	}

	public func tap( _ target: String ,
					 _ context: String )
	{
		GXEOUITestSD.tap(target,context)
	}

	public func longtap( _ target: String )
	{
		GXEOUITestSD.longTap(target)
	}

	public func longtap( _ target: String ,
						 _ context: String )
	{
		GXEOUITestSD.longTap(target,context)
	}

	public func doubletap( _ target: String )
	{
		GXEOUITestSD.doubleTap(target)
	}

	public func doubletap( _ target: String ,
						   _ context: String )
	{
		GXEOUITestSD.doubleTap(target,context)
	}

	public func fill( _ controlName: String ,
					  _ value: String )
	{
		GXEOUITestSD.fill(controlName,value)
	}

	public func fill( _ controlName: String ,
					  _ value: String ,
					  _ context: String )
	{
		GXEOUITestSD.fill(controlName,value,context)
	}

	public func pickdate( _ controlName: String ,
						  _ year: Int ,
						  _ month: Int ,
						  _ day: Int )
	{
		GXEOUITestSD.pickDate(controlName,year,month,day)
	}

	public func pickdate( _ controlName: String ,
						  _ year: Int ,
						  _ month: Int ,
						  _ day: Int ,
						  _ context: String )
	{
		GXEOUITestSD.pickDate(controlName,year,month,day,context)
	}

	public func pickdatetime( _ controlName: String ,
							  _ year: Int ,
							  _ month: Int ,
							  _ day: Int ,
							  _ hour: Int ,
							  _ minutes: Int )
	{
		GXEOUITestSD.pickDateTime(controlName,year,month,day,hour,minutes)
	}

	public func pickdatetime( _ controlName: String ,
							  _ year: Int ,
							  _ month: Int ,
							  _ day: Int ,
							  _ hour: Int ,
							  _ minutes: Int ,
							  _ context: String )
	{
		GXEOUITestSD.pickDateTime(controlName,year,month,day,hour,minutes,context)
	}

	public func picktime( _ controlName: String ,
						  _ hour: Int ,
						  _ minutes: Int )
	{
		GXEOUITestSD.pickTime(controlName, hour, minutes)
	}

	public func picktime( _ controlName: String ,
						  _ hour: Int ,
						  _ minutes: Int ,
						  _ context: String )
	{
		GXEOUITestSD.pickTime(controlName,hour,minutes,context)
	}

	public func selectvalue( _ controlName: String ,
							 _ value: String )
	{
		GXEOUITestSD.selectValue(controlName,value)
	}

	public func selectvalue( _ controlName: String ,
							 _ value: String ,
							 _ context: String )
	{
		GXEOUITestSD.selectValue(controlName,value,context)
	}

	public func swipe( _ direction: Int )
	{
		GXEOUITestSD.swipe(direction)
	}

	public func swipe( _ direction: Int ,
					   _ controlName: String )
	{
		GXEOUITestSD.swipe(direction,controlName)
	}

	public func swipe( _ direction: Int ,
					   _ controlName: String ,
					   _ context: String )
	{
		GXEOUITestSD.swipe(direction,controlName,context)
	}

	public func wait( _ milliseconds: Int )
	{
		GXEOUITestSD.wait(milliseconds)
	}

	public func verifytext( _ text: String )
	{
		GXEOUITestSD.verifyText(text)
	}

	public func verifytext( _ text: String ,
							_ expected: Bool )
	{
		GXEOUITestSD.verifyText(text,expected)
	}

	public func verifytext( _ text: String ,
							_ expected: Bool ,
							_ context: String )
	{
		GXEOUITestSD.verifyText(text,expected,context)
	}

	public func verifygridrowscount( _ gridControlName: String ,
									 _ value: Int )
	{
		GXEOUITestSD.verifyGridRowsCount(gridControlName,value)
	}

	public func verifygridrowscount( _ gridControlName: String ,
									 _ value: Int ,
									 _ expected: Bool )
	{
		GXEOUITestSD.verifyGridRowsCount(gridControlName,value,expected)
	}

	public func verifygridrowscount( _ gridControlName: String ,
									 _ value: Int ,
									 _ expected: Bool ,
									 _ context: String )
	{
		GXEOUITestSD.verifyGridRowsCount(gridControlName,value,expected,context)
	}

	public func verifycheckbox( _ controlName: String ,
								_ value: Bool )
	{
		GXEOUITestSD.verifyCheckbox(controlName,value)
	}

	public func verifycheckbox( _ controlName: String ,
								_ value: Bool ,
								_ context: String )
	{
		GXEOUITestSD.verifyCheckbox(controlName,value,context)
	}

	public func verifycontrolvalue( _ controlName: String ,
									_ value: String )
	{
		GXEOUITestSD.verifyControlValue(controlName,value)
	}

	public func verifycontrolvalue( _ controlName: String ,
									_ value: String ,
									_ expected: Bool )
	{
		GXEOUITestSD.verifyControlValue(controlName,value,expected)
	}

	public func verifycontrolvalue( _ controlName: String ,
									_ value: String ,
									_ expected: Bool ,
									_ context: String )
	{
		GXEOUITestSD.verifyControlValue(controlName,value,expected,context)
	}

	public func verifycontrolenabled( _ controlName: String )
	{
		GXEOUITestSD.verifyControlEnabled(controlName)
	}

	public func verifycontrolenabled( _ controlName: String ,
									  _ expected: Bool )
	{
		GXEOUITestSD.verifyControlEnabled(controlName,expected)
	}

	public func verifycontrolenabled( _ controlName: String ,
									  _ expected: Bool ,
									  _ context: String )
	{
		GXEOUITestSD.verifyControlEnabled(controlName,expected,context)
	}

	public func verifymsg( _ text: String )
	{
		GXEOUITestSD.verifyMsg(text)
	}

	public func verifymsg( _ text: String ,
						   _ expected: Bool )
	{
		GXEOUITestSD.verifyMsg(text,expected)
	}

	public func verifycontrolvisible( _ controlName: String )
	{
		GXEOUITestSD.verifyControlVisible(controlName)
	}

	public func verifycontrolvisible( _ controlName: String ,
									  _ expected: Bool )
	{
		GXEOUITestSD.verifyControlVisible(controlName,expected)
	}

	public func verifycontrolvisible( _ controlName: String ,
									  _ expected: Bool ,
									  _ context: String )
	{
		GXEOUITestSD.verifyControlVisible(controlName,expected,context)
	}
}

public class GXProcedure: NSObject {
	public func cleanup( ) {}

	public func initialize( ) {}
}

public class GXUserType: NSObject {
	public override init() {
		super.init()
	}

	public var sdtLevelPathNames: [String] {
		return []
	}

	public var sdtPropertiesNameMapping: [String: String]
	{
		return [:]
	}


	public func objectValue(forPropertyName propName: String) -> Any?
	{
		return nil
	}


	public func setObjectValue(_ value: Any, forPropertyName propName: String)
	{
	}
}

public class GXEOUITestSD {

	public static var testCase: XCTestCase!

	public static func back() {
		testCase.back()
	}

	public static func tap(_ target: String, _ context: String? = nil) {
		runActivity(forAction: "Tap", target: target, inContext: context) {
			testCase.tap(target, context)
		}
	}

	public static func longTap(_ target: String, _ context: String? = nil) {
		runActivity(forAction: "LongTap", target: target, inContext: context) {
			testCase.longTap(target, context)
		}
	}

	public static func doubleTap(_ target: String, _ context: String? = nil) {
		runActivity(forAction: "DoubleTap", target: target, inContext: context) {
			testCase.doubleTap(target, context)
		}
	}

	public static func fill(_ controlName: String, _ value: String, _ context: String? = nil) {
		runActivity(forAction: "Fill", target: controlName, inContext: context) {
			testCase.fill(controlName, value, context)
		}
	}

	public static func pickDate(_ controlName: String, _ year: Int, _ month: Int, _ day: Int, _ context: String? = nil) {
		runActivity(forAction: "PickDate", target: controlName, inContext: context) {
			guard let dateField = testCase._findControl(name: controlName, context: context) else {
				XCTAssert(false, "Could not find control with name '\(controlName)'")
				return
			}
			dateField.tap()
			let datePickers = XCUIApplication().descendants(matching: .datePicker)
			if datePickers.count > 0 {
				pickDate(datePickers.element(boundBy: datePickers.count-1), year: year, month: month, day: day)
			}
			else {
				XCTAssert(false, "Could not find date picker for control '\(controlName)'")
			}
		}
	}

	public static func pickDateTime(_ controlName: String, _ year: Int, _ month: Int, _ day: Int, _ hour: Int, _ minutes: Int, _ context: String? = nil) {
		runActivity(forAction: "PickDateTime", target: controlName, inContext: context) {
			guard let dateTimeField = testCase._findControl(name: controlName, context: context) else {
				XCTAssert(false, "Could not find control with name '\(controlName)'")
				return
			}
			dateTimeField.tap()
			
			let dateItem = XCUIApplication().tables.cells.element(boundBy: 0)
			dateItem.tap()
			
			let datePickers = XCUIApplication().descendants(matching: .datePicker)
			if datePickers.count > 0 {
				pickDate(datePickers.element(boundBy: datePickers.count-1), year: year, month: month, day: day)
			}
			else {
				XCTAssert(false, "Could not find date picker for control '\(controlName)'")
			}
			
			let timeItem = XCUIApplication().tables.cells.element(boundBy: 1)
			timeItem.tap()
			
			let timePickers = XCUIApplication().descendants(matching: .datePicker)
			if timePickers.count > 0 {
				pickTime(timePickers.element(boundBy: timePickers.count-1), hour: hour, minute: minutes)
			}
			else {
				XCTAssert(false, "Could not find time picker for control '\(controlName)'")
			}
			
			testCase.navigationBar().tap(button: "Done")
		}
	}

	public static func pickTime(_ controlName: String, _ hour: Int, _ minutes: Int, _ context: String? = nil) {
		runActivity(forAction: "PickTime", target: controlName, inContext: context) {
			guard let timeField = testCase._findControl(name: controlName, context: context) else {
				XCTAssert(false, "Could not find control with name '\(controlName)'")
				return
			}
			timeField.tap()

			let timePickers = XCUIApplication().descendants(matching: .datePicker)
			if timePickers.count > 0 {
				pickTime(timePickers.element(boundBy: timePickers.count-1), hour: hour, minute: minutes)
			}
			else {
				XCTAssert(false, "Could not find time picker for control '\(controlName)'")
			}
		}
	}

	public static func selectValue(_ controlName: String, _ value: String, _ context: String? = nil) {
		runActivity(forAction: "SelectValue", target: controlName, inContext: context) {
			testCase.selectValue(controlName, value, context)
		}
	}

	public static func swipe(_ direction: Int, _ controlName: String? = nil, _ context: String? = nil) {
		let strDirection: String = {
			switch direction {
			case 1: return "up"
			case 2: return "down"
			case 3: return "left"
			case 4: return "right"
			default: return "left"
			}
		}()
		runActivity(forAction: "Swipe \(strDirection)", target: controlName, inContext: context) {
			testCase.swipe(strDirection, controlName, context)
		}
	}

	public static func wait(_ milliseconds: Int) {
		runActivity(forAction: "Wait", target: nil, inContext: nil) {
			testCase.wait(milliseconds)
		}
	}

	public static func verifyText(_ text: String, _ expected: Bool = true, _ context: String? = nil) {
		runActivity(forAction: "VerifyText", target: text, inContext: context) {
			testCase.verifyText(text, expected, context)
		}
	}

	public static func verifyGridRowsCount(_ gridControlName: String, _ value: Int, _ expected: Bool = true, _ context: String? = nil) {
		runActivity(forAction: "VerifyGridRowsCount", target: gridControlName, inContext: context) {
			testCase.verifyGridRowsCount(gridControlName, value, expected, context)
		}
	}

	public static func verifyCheckbox(_ controlName: String, _ value: Bool, _ context: String? = nil) {
		runActivity(forAction: "VerifyCheckbox", target: controlName, inContext: context) {
			testCase.verifyCheckbox(controlName, value, true, context)
		}
	}

	public static func verifyControlValue(_ controlName: String, _ value: String, _ expected: Bool = true, _ context: String? = nil) {
		runActivity(forAction: "VerifyControlValue", target: controlName, inContext: context) {
			testCase.verifyControlValue(controlName, value, expected, context)
		}
	}

	public static func verifyControlEnabled(_ controlName: String, _ expected: Bool = true, _ context: String? = nil) {
		runActivity(forAction: "VerifyControlEnabled", target: controlName, inContext: context) {
			testCase.verifyControlEnabled(controlName, expected, context)
		}
	}

	public static func verifyMsg(_ text: String, _ expected: Bool = true) {
		runActivity(forAction: "VerifyMsg", target: text, inContext: nil) {
			testCase.verifyMsg(text, expected)
		}
	}

	public static func verifyControlVisible(_ controlName: String, _ expected: Bool = true, _ context: String? = nil) {
		runActivity(forAction: "VerifyControlVisible", target: controlName, inContext: context) {
			testCase.verifyControlVisible(controlName, expected, context)
		}
	}

	// MARK: - Private methods

	private static func runActivity(forAction action: String, target: String?, inContext context: String?, _ activityBlock: () -> Void) {
		let activityDescription = { () -> String in
			let baseDescription = target == nil ? action : "\(action) '\(target!)'"
			return context == nil ? baseDescription : "\(baseDescription) at '\(context!)'"
		}()
		
		XCTContext.runActivity(named: activityDescription) { _ in
			activityBlock()
		}
	}

	private static func pickDate(_ datePicker: XCUIElement, year: Int, month: Int, day: Int) {
		// ¿ d-m-y or m-d-y ?
		let firstWheel = datePicker.descendants(matching: .pickerWheel).element(boundBy: 0)
		let firstValue = firstWheel.value as! String
		let dayIndex = Int(firstValue) != nil ? 0 : 1
		let monthIndex = Int(firstValue) != nil ? 1 : 0

		let yearWheel = datePicker.descendants(matching: .pickerWheel).element(boundBy: 2)
		yearWheel.adjust(toPickerWheelValue: String(year))

		let monthWheel = datePicker.descendants(matching: .pickerWheel).element(boundBy: monthIndex)
		let monthName = DateFormatter().monthSymbols[month-1]
		monthWheel.adjust(toPickerWheelValue: monthName)

		let dayWheel = datePicker.descendants(matching: .pickerWheel).element(boundBy: dayIndex)
		dayWheel.adjust(toPickerWheelValue: String(day))
	}

	private static func pickTime(_ datePicker: XCUIElement, hour: Int, minute: Int) {
		// ¿H:m or h:m:a?
		let pickerWheels = datePicker.descendants(matching: .pickerWheel)
		let hasAMPM = pickerWheels.count == 3

		let hourWheel = pickerWheels.element(boundBy: 0)
		let hourValue = hasAMPM ? String(hour % 12) : String(hour)
		hourWheel.adjust(toPickerWheelValue: hourValue)

		let minuteWheel = pickerWheels.element(boundBy: 1)
		let minuteStr = (minute < 10 ? "0" : "") + String(minute)
		minuteWheel.adjust(toPickerWheelValue: minuteStr)

		if hasAMPM {
			let amPmWheel = pickerWheels.element(boundBy: 2)
			amPmWheel.adjust(toPickerWheelValue: hour >= 12 ? "PM" : "AM")
		}
	}
}

// New API methods

fileprivate let _anyElementTypes: Array<XCUIElement.ElementType> = [.any]

fileprivate let _allElementTypes: Array<XCUIElement.ElementType> = [.textField,
																	.secureTextField,
																	.staticText,
																	.button,
																	.table,
																	.image,
																	.checkBox,
																	.switch,
																	.segmentedControl,
																	.other]

fileprivate let _tapableElementTypes: Array<XCUIElement.ElementType> = [.button,
																		.textField,
																		.secureTextField,
																		.staticText,
																		.table,
																		.image,
																		.checkBox,
																		.switch,
																		.segmentedControl,
																		.other]

fileprivate let _textInputElementTypes: Array<XCUIElement.ElementType> = [.textField,
																		  .secureTextField,
																		  .other]

extension XCTestCase {
	fileprivate func _applyControlNameCasing(_ name: String) -> String {
		let head = name.first.uppercased()
		let tail = name.dropFirst().lowercased()
		return head + tail
	}

	fileprivate func _findContextElement(_ context: String?, root: XCUIElement) -> XCUIElement? {
		guard let context = context else {
			return root;
		}

		let components = context.components(separatedBy: CharacterSet(charactersIn: "."))
		var searchRoot = root
		for component in components {
			if let itemIndex = _findItemIndex(in: component) {
				if itemIndex > 0 && itemIndex <= searchRoot.cells.count {
					searchRoot = searchRoot.cells.element(boundBy: itemIndex-1)
				}
				else {
					break;
				}
			}
			else {
				// control name expression
				let query = searchRoot.descendants(matching: .any).matching(identifier: _applyControlNameCasing(component))
				if query.count > 0 {
					searchRoot = query.element(boundBy: 0)
				}
				else {
					break;
				}
			}
		}
		return searchRoot;
	}

	fileprivate func _findItemIndex(in text: String) -> Int? {
		guard let regExp = try? NSRegularExpression(pattern: "^item\\\\(([0-9]+)\\\\)\$",
													options: .caseInsensitive),
			let result = regExp.firstMatch(in: text,
											 options: .withTransparentBounds,
											 range: NSRange(location: 0, length: (text as NSString).length)),
			result.numberOfRanges > 1
		else {
			return nil
		}

		let range = result.range(at: 1)
		let match = (text as NSString).substring(with: range)
		return Int(match)
	}

	fileprivate func _findControl(name: String, context: String?, elementTypes: Array<XCUIElement.ElementType> = _anyElementTypes) -> XCUIElement? {
		guard var searchRoot = _findContextElement(context, root: XCUIApplication()) else {
			return nil
		}

		let modalAlerts = searchRoot.descendants(matching: .alert)
		if (modalAlerts.count > 0) {
			searchRoot = modalAlerts.firstMatch;
		}

		return _findControl(name: name, searchRoot: searchRoot, elementTypes: elementTypes)
	}

	fileprivate func _findControl(name: String, searchRoot: XCUIElement, elementTypes: Array<XCUIElement.ElementType> = _anyElementTypes) -> XCUIElement? {
	
		let findElementWithIdentifier = { (name: String) -> XCUIElement? in
			for elementType in elementTypes {
				let descendants = searchRoot.descendants(matching: elementType).matching(identifier: name)
				if descendants.count > 0 {
					return descendants.element(boundBy: 0)
				}
			}
			return nil
		}

		let findElementWithIdentifierIgnoringCase = { (name: String) -> XCUIElement? in
			if let result = findElementWithIdentifier(self._applyControlNameCasing(name)) {
				return result
			}
			else {
				return findElementWithIdentifier(name)
			}
		}

		var control = findElementWithIdentifierIgnoringCase(name)
		if (control == nil) {
			// automatic retry
			wait(2000)
			control = findElementWithIdentifierIgnoringCase(name)
		}
		return control
	}

	public func back() {
		// Note: back button is (generally...) the first button in the navigation bar
		var backButton: XCUIElement? = nil;
		let navBars = XCUIApplication().navigationBars
		if navBars.count > 0 {
			let navButtons = navBars.element(boundBy: 0).buttons
			if navButtons.count > 0 {
				backButton = navButtons.element(boundBy: 0)
			}
		}
		if let backButton = backButton {
			backButton.tap()
		}
		else {
			XCTAssert(false, "Could not find back button")
		}
	}

	public func wait(_ milliseconds: Int) {
		Thread.sleep(forTimeInterval: Double(milliseconds) / 1000.0)
	}

	public func tap(_ controlName: String, _ context: String? = nil) {
		var control: XCUIElement? = nil

		if context == "applicationbar" {
			let findElementInQuery = { (name: String, query: XCUIElementQuery) -> XCUIElement? in
				var control: XCUIElement? = nil
				for i in 0..<query.count {
					control = self._findControl(name: name, searchRoot: query.element(boundBy: i))
					if control != nil {
						break
					}
				}
				return control
			}

			control = findElementInQuery(controlName, XCUIApplication().navigationBars)

			if control == nil {
				control = findElementInQuery(controlName, XCUIApplication().toolbars)
			}

			if control == nil {
				// Low priority buttons may not be present directly on screen, they may appear in an action sheen after tapping the "share" button
				var shareButtons = XCUIApplication().toolbars.descendants(matching: .button).matching(identifier: "Share")
				if shareButtons.count == 0 {
					shareButtons = XCUIApplication().navigationBars.descendants(matching: .button).matching(identifier: "Share")
				}
				if shareButtons.count > 0 {
					let shareButton = shareButtons.element(boundBy: 0)
					shareButton.tap()
					let sheets = XCUIApplication().descendants(matching: .sheet)
					if sheets.count == 1 {
						let actionSheet = sheets.element(boundBy: 0)
						let buttons = actionSheet.descendants(matching: .button).matching(identifier: controlName)
						if buttons.count == 1 {
							control = buttons.element(boundBy: 0)
						}
					}
				}
			}
		}
		else {
			control = _findControl(name: controlName, context: context, elementTypes: _tapableElementTypes)
		}

		if let control = control {
			control.tap()
		}
		else {
			XCTAssert(false, "Could not find control with name '\(controlName)'")
		}
	}

	public func doubleTap(_ controlName: String, _ context: String? = nil) {
		if let control = _findControl(name: controlName, context: context, elementTypes: _tapableElementTypes) {
			control.doubleTap()
		}
		else {
			XCTAssert(false, "Could not find control with name '\(controlName)'")
		}
	}

	public func longTap(_ controlName: String, _ context: String? = nil) {
		if let control = _findControl(name: controlName, context: context, elementTypes: _tapableElementTypes) {
			control.press(forDuration: 1.0)
		}
		else {
			XCTAssert(false, "Could not find control with name '\(controlName)'")
		}
	}

	public func fill(_ controlName: String, _ value: String, _ context: String? = nil) {
		if let control = _findControl(name: controlName, context: context, elementTypes: _textInputElementTypes) {
			control.clearText()
			control.typeText(value)
		}
		else {
			XCTAssert(false, "Could not find control with name '\(controlName)'")
		}
	}

	public func selectValue(_ controlName: String, _ value: String, _ context: String? = nil) {
		if let control = _findControl(name: controlName, context: context, elementTypes: _allElementTypes) {
			if (control.elementType == .segmentedControl) {
				// radio button
				let radioContext = context == nil ? controlName : "\(context!).\(controlName)"
				tap(value, radioContext)
			}
			else {
				tap(controlName, context)
				tap(value)
			}
		}
	}

	public func swipe(_ direction: String, _ controlName: String? = nil, _ context: String? = nil) {
		let targetControlName = controlName == nil ? "maintable" : controlName!;
		if let control = _findControl(name: targetControlName, context: context) {
			switch (direction.lowercased()) {
			case "up":
				control.swipeUp()
			case "down":
				control.swipeDown()
			case "left":
				control.swipeLeft()
			case "right":
				control.swipeRight()
			default:
				XCTAssert(false, "Unknown swipe direction: \(direction)")
			}
		}
		else {
			XCTAssert(false, "Could not find control with name '\(targetControlName)'")
		}
	}

	public func verifyMsg(_ text: String, _ expected: Bool = true) {
		let alertsQuery = XCUIApplication().descendants(matching: .alert)
		let found = alertsQuery.matching(identifier: text).count > 0 || alertsQuery.descendants(matching: .staticText).matching(identifier: text).count > 0
		XCTAssert(found == expected, "Alert with test '\(text)' was \(expected ? "" : "not ")expected but did \(found ? "" : "not ")find it")
	}

	public func verifyText(_ text: String, _ expected: Bool = true, _ context: String? = nil) {
		let control = _findControl(name: text, context: context)
		let found = control != nil
		XCTAssert(found == expected, "Text '\(text)' was \(expected ? "" : "not ")expected but did \(found ? "" : "not ")find it")
	}

	public func verifyControlEnabled(_ controlName: String, _ expected: Bool = true, _ context: String? = nil) {
		// TODO: control.isEnabled is returning 'true' even when the control is no enabled
//		if let control = _findControl(name: controlName, context: context, elementTypes: _allElementTypes) {
//			let enabled = control.isEnabled
//			XCTAssert(enabled == expected, "Control '\(controlName)' should \(expected ? "" : "not ")be enabled but it was\(enabled ? "" : " not").")
//		}
//		else {
//			XCTAssert(false, "Could not find control with name '\(controlName)'")
//		}
	}

	public func verifyControlVisible(_ controlName: String, _ expected: Bool = true, _ context: String? = nil) {
		if let control = _findControl(name: controlName, context: context, elementTypes: _allElementTypes) {
			let visible = control.isHittable
			XCTAssert(visible == expected, "Control '\(controlName)' should \(expected ? "" : "not ")be enabled but it was\(visible ? "" : " not").")
		}
		else {
			XCTAssert(!expected, "Could not find control with name '\(controlName)'")
		}
	}

	private func controlValueString(control: XCUIElement?) -> String? {
		guard let control = control else {
			return nil
		}

		var value: Any? = nil
		switch control.elementType {
		case .staticText:
			value = control.label
		case .segmentedControl:
			let buttonsQuery = control.descendants(matching: .button)
			for i in 0..<buttonsQuery.count {
				let button = buttonsQuery.element(boundBy: i)
				if button.isSelected {
					value = button.label
					break
				}
			}
		default:
			value = control.value
		}

		return value as? String
	}
	
	private func isEqualTextValue(_ received: String, to expected: String) -> Bool {
		if received == expected {
			return true
		}
		else {
			let expectedNoNewlines = expected.replacingOccurrences(of: "\n", with: " ")
			return received == expectedNoNewlines
		}
	}

	public func verifyControlValue(_ controlName: String, _ value: String, _ expected: Bool = true, _ context: String? = nil) {
		if let control = _findControl(name: controlName, context: context, elementTypes: _allElementTypes),
			let controlValueString = controlValueString(control: control) {

			XCTAssert(isEqualTextValue(controlValueString, to: value))
		}
		else {
			XCTAssert(false, "Could not find control with name '\(controlName)'")
		}
	}

	public func verifyGridRowsCount(_ controlName: String, _ count: Int, _ expected: Bool = true, _ context: String? = nil) {
		if let control = _findControl(name: controlName, context: context, elementTypes: _allElementTypes) {
			let rows = control.cells.count
			XCTAssert(expected ? rows == count : rows != count, "Grid '\(controlName)' should \(expected ? "" : "not ")have \(count) rows, found \(rows).")
		}
		else {
			XCTAssert(false, "Could not find grid with name '\(controlName)'")
		}
	}

	public func verifyCheckbox(_ controlName: String, _ value: Bool, _ expected: Bool = true, _ context: String? = nil) {
		if let control = _findControl(name: controlName, context: context, elementTypes: _allElementTypes) {
			let selected = control.isSelected;
			XCTAssert(selected == value, "Checkbox '\(controlName)' was expected to be \(value ? "un" : "")selected but is not.")
		}
		else {
			XCTAssert(false, "Could not find grid with name '\(controlName)'")
		}
	}
}

// Old API (compatibility)

enum GXUIElementType {
	case textField
	case secureTextField
	case other
	case staticText
	case button
	case table
	case image
	case checkBox
	case `switch`
	case navigationBar
	case toolbar
	case tabBar
	case map
}

class GXTestHelperTypes {
	static let editControlTypes:   [GXUIElementType] = [.textField, .secureTextField, .other]
	static let textControlTypes:   [GXUIElementType] = [.staticText, .other]
	static let buttonControlTypes: [GXUIElementType] = [.button, .other]
	static let tableControlTypes:  [GXUIElementType] = [.table, .other]
	static let imageControlTypes:  [GXUIElementType] = [.image, .other]
	static let booleanControlTypes:[GXUIElementType] = [.checkBox, .switch, .button, .other]
	static let navigationBarTypes: [GXUIElementType] = [.navigationBar]
	static let toolBarTypes:       [GXUIElementType] = [.toolbar]
	static let tabBarTypes:        [GXUIElementType] = [.tabBar]
	static let mapControlTypes:    [GXUIElementType] = [.map]
}

extension XCTestCase {
	// MARK: Application shortcuts

	func tap(alert alertName: String, button buttonName: String) {
		let alert = XCUIApplication().alerts[alertName]
		wait(forElement: alert)
		alert.buttons[buttonName].tap()
	}

	func read(alert alertName: String) -> String {
		let alert = XCUIApplication().alerts[alertName]
		wait(forElement: alert)
		return alert.staticTexts.allElementsBoundByIndex.map({ (element) -> String in
			return element.label
		}).joined(separator: "\n")
	}

	func exists(alert alertName: String) -> Bool {
		let alert = XCUIApplication().alerts[alertName]
		return alert.exists
	}

	func tap(menuOption option: String) {
		XCUIApplication().tables.tap(text: option)
	}

	func tap(menuOptions options: [String]) {
		let app = XCUIApplication()
		for option in options {
			app.tables.tap(text: option)
			waitForNetworkActivity()
		}
	}

	func waitForNetworkActivity() {
		let networkActivityIndicator = XCUIApplication().otherElements["Network connection in progress"]
		wait(forElement: networkActivityIndicator, condition: "exists == 0")
	}

	// MARK: Root elements

	func mainTable(name: String = "Maintable") -> XCUIElementQuery {
		return findElement(withName: name, inQuery: XCUIApplication().otherElements)
	}

	func navigationBar(name: String? = nil) -> XCUIElementQuery {
		return findElement(withName: name, inQuery: XCUIApplication().navigationBars)
	}

	func toolbar(name: String? = nil) -> XCUIElementQuery {
		return findElement(withName: name, inQuery: XCUIApplication().toolbars)
	}

	func tabBar(name: String? = nil) -> XCUIElementQuery {
		return findElement(withName: name, inQuery: XCUIApplication().tabBars)
	}

	func actionGroup(name: String? = nil) -> XCUIElementQuery {
		return findElement(withName: name, inQuery: XCUIApplication().windows)
	}

	private func findElement(withName name: String?, inQuery query: XCUIElementQuery) -> XCUIElementQuery {
		if let name = name {
			return query.matching(identifier: name)
		}
		return query
	}

	// MARK: - Waiting

	func wait(forElement element: XCUIElementTypeQueryProvider, condition: String = "exists == 1") {
		let exp = expectation(for: NSPredicate(format: condition),
							  evaluatedWith: element,
							  handler: nil)
		wait(for: [exp], timeout: 3)
	}

	func waitFor(edit name: String, timeout: UInt = 5, retries: UInt = 2) -> Bool {
		return recursiveWait(for: name, totalTimeout: timeout, tries: retries, types: GXTestHelperTypes.editControlTypes)
	}

	func waitFor(text name: String, timeout: UInt = 5, retries: UInt = 2) -> Bool {
		return recursiveWait(for: name, totalTimeout: timeout, tries: retries, types: GXTestHelperTypes.textControlTypes)
	}

	func waitFor(button name: String, timeout : UInt = 5, retries: UInt = 2) -> Bool {
		return recursiveWait(for: name, totalTimeout: timeout, tries: retries, types: GXTestHelperTypes.buttonControlTypes)
	}

	func waitFor(table name: String, timeout : UInt = 5, retries: UInt = 2) -> Bool {
		return recursiveWait(for: name, totalTimeout: timeout, tries: retries, types: GXTestHelperTypes.tableControlTypes)
	}

	func waitFor(grid name: String, timeout: UInt = 5, retries: UInt = 2) -> Bool{
		return waitFor(table: name, timeout: timeout, retries: retries)
	}

	func waitFor(image name: String, timeout : UInt = 5, retries: UInt = 2) -> Bool {
		return recursiveWait(for: name, totalTimeout: timeout, tries: retries, types: GXTestHelperTypes.imageControlTypes)
	}

	func waitFor(boolean name: String, timeout: UInt = 5, retries: UInt = 2) -> Bool {
		return recursiveWait(for: name, totalTimeout: timeout, tries: retries, types: GXTestHelperTypes.booleanControlTypes)
	}

	private func recursiveWait(for name: String, totalTimeout timeout: UInt, tries: UInt, types: [GXUIElementType]) -> Bool {
		return recursiveWait(for: name, timeout: timeout / tries, tries: Int(tries), types: types)
	}

	private func recursiveWait(for name: String, timeout: UInt, tries: Int, types: [GXUIElementType]) -> Bool {
		if tries == 0 {
			return false
		}
		else if XCUIApplication().findElement(name: name, types: types) != nil {
			return true
		}
		else {
			sleep(UInt32(TimeInterval(timeout)))
			return recursiveWait(for:name, timeout: timeout, tries: tries-1, types: types)
		}
	}

	// MARK: - Validate

	func validate(expression: Bool, message:String = "") {
		XCTAssert(expression, message)
	}

	func validateEquals<T>(expression1: T, expression2: T, message: String = "") where T: Equatable {
		XCTAssertEqual(expression1, expression2, message)
	}

	func validateTrue(expression: Bool, message: String = "") {
		XCTAssertTrue(expression, message)
	}

	func validateFalse(expression: Bool, message: String = "") {
		XCTAssertFalse(expression, message)
	}
}

protocol GXXCUIElementTypeQueryProvider: XCUIElementTypeQueryProvider {
	func gxChildren(matching type: GXUIElementType) -> XCUIElementQuery
	func gxDescendants(matching type: GXUIElementType) -> XCUIElementQuery
}

extension XCUIElement: GXXCUIElementTypeQueryProvider {
	func gxChildren(matching type: GXUIElementType) -> XCUIElementQuery {
		switch type {
		case .textField:
			return self.children(matching: .textField)
		case .secureTextField:
			return self.children(matching: .secureTextField)
		case .other:
			return self.children(matching: .other)
		case .staticText:
			return self.children(matching: .staticText)
		case .button:
			return self.children(matching: .button)
		case .table:
			return self.children(matching: .table)
		case .image:
			return self.children(matching: .image)
		case .checkBox:
			return self.children(matching: .checkBox)
		case .switch:
			return self.children(matching: .switch)
		case .navigationBar:
			return self.children(matching: .navigationBar)
		case .toolbar:
			return self.children(matching: .toolbar)
		case .tabBar:
			return self.children(matching: .tabBar)
		case .map:
			return self.children(matching: .map)
		}
	}

	func gxDescendants(matching type: GXUIElementType) -> XCUIElementQuery {
		switch type {
		case .textField:
			return self.descendants(matching: .textField)
		case .secureTextField:
			return self.descendants(matching: .secureTextField)
		case .other:
			return self.descendants(matching: .other)
		case .staticText:
			return self.descendants(matching: .staticText)
		case .button:
			return self.descendants(matching: .button)
		case .table:
			return self.descendants(matching: .table)
		case .image:
			return self.descendants(matching: .image)
		case .checkBox:
			return self.descendants(matching: .checkBox)
		case .switch:
			return self.descendants(matching: .switch)
		case .navigationBar:
			return self.descendants(matching: .navigationBar)
		case .toolbar:
			return self.descendants(matching: .toolbar)
		case .tabBar:
			return self.descendants(matching: .tabBar)
		case .map:
			return self.descendants(matching: .map)
		}
	}
}

extension XCUIElementQuery: GXXCUIElementTypeQueryProvider {
	func gxChildren(matching type: GXUIElementType) -> XCUIElementQuery {
		switch type {
		case .textField:
			return self.children(matching: .textField)
		case .secureTextField:
			return self.children(matching: .secureTextField)
		case .other:
			return self.children(matching: .other)
		case .staticText:
			return self.children(matching: .staticText)
		case .button:
			return self.children(matching: .button)
		case .table:
			return self.children(matching: .table)
		case .image:
			return self.children(matching: .image)
		case .checkBox:
			return self.children(matching: .checkBox)
		case .switch:
			return self.children(matching: .switch)
		case .navigationBar:
			return self.children(matching: .navigationBar)
		case .toolbar:
			return self.children(matching: .toolbar)
		case .tabBar:
			return self.children(matching: .tabBar)
		case .map:
			return self.children(matching: .map)
		}
	}

	func gxDescendants(matching type: GXUIElementType) -> XCUIElementQuery {
		switch type {
		case .textField:
			return self.descendants(matching: .textField)
		case .secureTextField:
			return self.descendants(matching: .secureTextField)
		case .other:
			return self.descendants(matching: .other)
		case .staticText:
			return self.descendants(matching: .staticText)
		case .button:
			return self.descendants(matching: .button)
		case .table:
			return self.descendants(matching: .table)
		case .image:
			return self.descendants(matching: .image)
		case .checkBox:
			return self.descendants(matching: .checkBox)
		case .switch:
			return self.descendants(matching: .switch)
		case .navigationBar:
			return self.descendants(matching: .navigationBar)
		case .toolbar:
			return self.descendants(matching: .toolbar)
		case .tabBar:
			return self.descendants(matching: .tabBar)
		case .map:
			return self.descendants(matching: .map)
		}
	}
}

extension GXXCUIElementTypeQueryProvider {
	fileprivate func findElement(name: String, types: [GXUIElementType]) -> XCUIElement? {
		var element: XCUIElement? = nil
		for type in types {
			let identifier = type == .staticText ? name : name.capitalize
			let query = self.gxDescendants(matching: type).matching(identifier: identifier)
			if query.count > 0 {
				element = query.element(boundBy: 0)
				break
			}
		}
		return element
	}

	private func existsElement(name: String, types: [GXUIElementType]) -> Bool {
		return findElement(name: name, types: types) != nil
	}

	// MARK: fill

	func fill(edit name: String, value: String) {
		guard let element = findElement(name: name, types: GXTestHelperTypes.editControlTypes) else {
			XCTFail("Unknown edit with name \(name)")
			return
		}
		element.clearText()
		element.typeText(value)
	}

	// MARK: table

	func table(name: String) -> XCUIElement {
		let element = findElement(name: name, types: GXTestHelperTypes.tableControlTypes)
		if element == nil {
			XCTFail("Unknown table with name \(name)")
		}
		return element!
	}

	// MARK: tap

	private func tap(element name: String, types: [GXUIElementType]) {
		guard let element = findElement(name: name, types: types) else {
			XCTFail("Unknown element with name \(name)")
			return
		}
		element.tap()
	}

	func tap(text name: String) {
		tap(element: name, types: GXTestHelperTypes.textControlTypes)
	}

	func tap(button name: String) {
		tap(element: name, types: GXTestHelperTypes.buttonControlTypes)
	}

	func tap(table name: String) {
		tap(element: name, types: GXTestHelperTypes.tableControlTypes)
	}

	func tap(image name: String) {
		tap(element: name, types: GXTestHelperTypes.tableControlTypes)
	}

	func tap(boolean name: String) {
		tap(element: name, types: GXTestHelperTypes.booleanControlTypes)
	}

	// MARK: exists

	func exists(text name: String) -> Bool {
		return existsElement(name: name, types: GXTestHelperTypes.textControlTypes)
	}

	func exists(button name: String) -> Bool {
		return existsElement(name: name, types: GXTestHelperTypes.buttonControlTypes)
	}

	func exists(edit name: String) -> Bool {
		return existsElement(name: name, types: GXTestHelperTypes.editControlTypes)
	}

	func exists(table name: String) -> Bool {
		return existsElement(name: name, types: GXTestHelperTypes.tableControlTypes)
	}

	func exists(image name: String) -> Bool {
		return existsElement(name: name, types: GXTestHelperTypes.imageControlTypes)
	}

	func exists(boolean name: String) -> Bool {
		return existsElement(name: name, types: GXTestHelperTypes.booleanControlTypes)
	}

	func exists(map name: String) -> Bool {
		if let _ = findElement(name: "\(name)-Map", types: [.other]) {
			return true
		} else if let gridElement = findElement(name: name, types: GXTestHelperTypes.tableControlTypes) {
			return gridElement.maps.count > 0
		}
		return false
	}

	// MARK: read

	func read(edit name: String) -> String {
		guard let element = findElement(name: name, types: GXTestHelperTypes.editControlTypes) else {
			XCTFail("Unknown edit with name \(name)")
			return ""
		}
		return element.value as! String
	}

	func read(text name: String) -> String {
		guard let element = findElement(name: name, types: GXTestHelperTypes.textControlTypes) else {
			XCTFail("Unknown text with name \(name)")
			return ""
		}

		if (element.elementType != .staticText) {
			return element.value as! String
		} else {
			return element.label
		}
	}

	func read(boolean name: String) -> String {
		guard let element = findElement(name: name, types: GXTestHelperTypes.booleanControlTypes) else {
			XCTFail("Unknown element with name \(name)")
			return ""
		}
		var isSelected: Bool
		if (element.elementType == .button) {
			isSelected = element.isSelected
		}
		else {
			isSelected = (element.value as! String) == "1"
		}
		return isSelected ? "True" : "False"
	}

	// MARK: isVisible

	private func isDisplayed(element name: String, types: [GXUIElementType]) -> Bool {
		guard let element = findElement(name: name, types: types) else {
			return false
		}
		return element.isHittable
	}

	func isVisible(button name: String) -> Bool {
		return isDisplayed(element: name, types: GXTestHelperTypes.buttonControlTypes)
	}

	func isVisible(edit name: String) -> Bool {
		return isDisplayed(element: name, types: GXTestHelperTypes.editControlTypes)
	}

	func isVisible(text name: String) -> Bool {
		return isDisplayed(element: name, types: GXTestHelperTypes.textControlTypes)
	}

	func isVisible(table name: String) -> Bool{
		return isDisplayed(element: name, types: GXTestHelperTypes.tableControlTypes)
	}

	func isVisible(image name: String) -> Bool{
		return isDisplayed(element: name, types: GXTestHelperTypes.imageControlTypes)
	}

	func isVisible(boolean name: String) -> Bool {
		return isDisplayed(element: name, types: GXTestHelperTypes.booleanControlTypes)
	}

	func isVisible(map name: String) -> Bool {
		if let mapElement = findElement(name: "\(name)-Map", types: [.other]) {
			return mapElement.isHittable
		}
		else if let gridElement = findElement(name: name, types: GXTestHelperTypes.tableControlTypes), gridElement.maps.count > 0 {
			let mapElement = gridElement.maps.element(boundBy: 0)
			return mapElement.isHittable
		}
		return false
	}

	// MARK: grids

	func grid(name: String = "Grid1") -> XCUIElement {
		let element = findElement(name: name, types: GXTestHelperTypes.tableControlTypes)
		if element == nil {
			XCTFail("Unknown grid with name \(name)")
		}
		return element!
	}
	func row(index: Int) -> XCUIElement {
		return cells.element(boundBy: index)
	}

	// MARK: - Date

	private func editDate(month: String, day: String, year: String) {
		let picker : XCUIElement = XCUIApplication().datePickers.element(boundBy: 0)
		picker.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: month)
		picker.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: day)
		picker.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: year)
	}

	func edit(date name: String, month: String, day: String, year: String) {
		tap(button: name)
		editDate(month: month, day: day, year: year)
		tap(button: name)
	}
}

private extension String {
	var first: String {
		return String(self.prefix(1))
	}

	var uppercaseFirst: String {
		return first.uppercased() + String(self.dropFirst())
	}

	var capitalize: String {
		return self.hasPrefix("&") ? self : self.uppercaseFirst
	}

	var boolValue: Bool {
		return NSString(string: self).boolValue
	}
}

fileprivate extension XCUIElement {
	private var charactersCount: Int {
		guard let value = self.value as? String else {
			return 0
		}
		if let placeholder = self.placeholderValue, placeholder == value {
			return 0
		}
		return value.count
	}

	func clearText() {
		self.press(forDuration: 2) // tap and hold to select all
		self.typeText(XCUIKeyboardKey.delete.rawValue)
		/*
		self.tap()
		while self.charactersCount > 0 {
			let oldCount = self.charactersCount
			self.typeText(XCUIKeyboardKey.delete.rawValue)
			if !(self.charactersCount < oldCount) {
				break;
			}
		}
		*/
	}
}

final public class genexus_client_SdtClientInformation : GXStandardClasses.GXUserType {
	public lazy var gxTv_SdtClientInformation_Id: String = GXClientInformation.deviceUUID() ?? ""

	public lazy var gxTv_SdtClientInformation_Osname: String = GXClientInformation.osName()

	public lazy var gxTv_SdtClientInformation_Osversion: String = GXClientInformation.osVersion()

	public lazy var gxTv_SdtClientInformation_Language: String = GXClientInformation.deviceLanguage()

	public lazy var gxTv_SdtClientInformation_Devicetype: Int = Int(GXClientInformation.deviceType())

	public lazy var gxTv_SdtClientInformation_Platformname: String = GXClientInformation.platformName() ?? ""

	public lazy var gxTv_SdtClientInformation_Appversioncode: String = GXClientInformation.appVersionCode() ?? ""

	public lazy var gxTv_SdtClientInformation_Appversionname: String = GXClientInformation.appVersionName() ?? ""

	public lazy var gxTv_SdtClientInformation_Applicationid: String = GXClientInformation.appID()
}
