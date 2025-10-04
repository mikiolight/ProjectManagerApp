import Foundation

extension Optional where Wrapped == Date{
	func shortDate() -> String {
		guard let date = self else { return "" }
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy/MM/dd"
		formatter.locale = Locale(identifier: "ja_JP")
		formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
		return formatter.string(from: date)
	}

	func shortTime() -> String {
		guard let date = self else { return "" }
		let formatter = DateFormatter()
		formatter.dateFormat = "HH:mm"
		formatter.locale = Locale(identifier: "ja_JP")
		formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
		return formatter.string(from: date)
	}

	func shortDateTime() -> String {
		guard let date = self else { return "" }
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy/MM/dd HH:mm"
		formatter.locale = Locale(identifier: "ja_JP")
		formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
		return formatter.string(from: date)
	}
}

extension Date {
    func shortDate() -> String {
        Optional(self).shortDate()
    }
    func shortTime() -> String {
        Optional(self).shortTime()
    }
    func shortDateTime() -> String {
        Optional(self).shortDateTime()
    }
}
