// SampleData.swift
import Foundation

struct SampleData {
	// サンプルプロジェクト1の作成
	static let project1 = Project(
		id: UUID(),
		tickets: [], // チケットは後から追加
		projectName: "モバイルアプリ開発"
	)

	// サンプルチケットの作成
	static let ticket1 = Ticket(
		id: UUID(),
		project: project1,
		ticketName: "ログイン画面の実装",
		dueDate: Date(),
		completeDate: nil,
		status: .notStarted
	)

	static let ticket2 = Ticket(
		id: UUID(),
		project: project1,
		ticketName: "設定画面のUIデザイン",
		dueDate: Date().addingTimeInterval(86400 * 2), // 2日後
		completeDate: nil,
		status: .inProgress
	)

	// サンプルノートの作成
	static let note1 = Note(
		id: UUID(),
		ticket: ticket1,
		note: "ログイン画面の仕様メモ",
		url: nil,
		madeDateTime: Date()
	)

	static let note2 = Note(
		id: UUID(),
		ticket: ticket2,
		note: "UIデザインの参考URLを追加",
		url: nil,
		madeDateTime: Date().addingTimeInterval(3600)
	)

	// プロジェクトにチケットを関連付ける
	static func getProjectWithTickets() -> Project {
		let proj = project1
		proj.tickets = [ticket1, ticket2]
		return proj
	}

	// チケットにノートを関連付け
	static func getTicket1WithNotes() -> Ticket {
		let t = ticket1
		t.notes = [note1]
		return t
	}
	static func getTicket2WithNotes() -> Ticket {
		let t = ticket2
		t.notes = [note2]
		return t
	}

	// プレビュー用のプロジェクト配列
	static let projects: [Project] = [
		getProjectWithTickets(),
		Project(
			id: UUID(),
			tickets: [],
			projectName: "Webサイトリニューアル"
		)
	]

	// プレビュー用ノート配列
	static let notes: [Note] = [note1, note2]

	// プロジェクトにチケット（ノート付き）を関連付ける
	static func getProjectWithTicketsAndNotes() -> Project {
		let proj = project1
		proj.tickets = [getTicket1WithNotes(), getTicket2WithNotes()]
		return proj
	}
}
