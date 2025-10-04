// SampleData.swift
import Foundation

struct SampleData {
	// ノート
	static let note1: Note = {
		let n = Note(
			id: UUID(),
			ticket: ticket1,
			note: "ログイン画面の仕様メモ",
			url: nil,
			madeDateTime: Date()
		)
		return n
	}()

	static let note2: Note = {
		let n = Note(
			id: UUID(),
			ticket: ticket2,
			note: "UIデザインの参考URLを追加",
			url: nil,
			madeDateTime: Date().addingTimeInterval(3600)
		)
		return n
	}()

	static let note3: Note = {
		let n = Note(
			id: UUID(),
			ticket: ticket1,
			note: "バックエンドは後でやる",
			url: nil,
			madeDateTime: Date()
		)
		return n
	}()

	static let note4: Note = {
		let n = Note(
			id: UUID(),
			ticket: ticket1,
			note: "ログイン画面の仕様メモ2",
			url: nil,
			madeDateTime: Date()
		)
		return n
	}()

    // チケット
    static let ticket1: Ticket = {
        let t = Ticket(
            id: UUID(),
            project: project1,
            ticketName: "ログイン画面の実装",
            ticketDetail: "",
            startDate: Date(),
            dueDate: Date(),
            completeDate: nil,
            status: .notStarted
        )
        return t
    }()

    static let ticket2: Ticket = {
        let t = Ticket(
            id: UUID(),
            project: project1,
            ticketName: "設定画面のUIデザイン",
            ticketDetail: "",
            startDate: Date(),
            dueDate: Date().addingTimeInterval(86400 * 2),
            completeDate: nil,
            status: .inProgress
        )
        return t
    }()

	// プロジェクト
	static let project1: Project = {
		let p = Project(
			id: UUID(),
			tickets: [],
			projectName: "モバイルアプリ開発",
			projectDetails: nil
		)
		return p
	}()

    // 関連付け（notes, tickets）をインスタンス生成後にセット
    static func setupRelations() {
        ticket1.notes = [note1, note4]
        ticket2.notes = [note2, note3]
        project1.tickets = [ticket1, ticket2]
    }

    // プレビュー・テスト用データ
    static let projects: [Project] = {
        setupRelations()
        return [
            project1,
            Project(
                id: UUID(),
                tickets: [],
                projectName: "Webサイトリニューアル",
                projectDetails: nil
            )
        ]
    }()

    static let notes: [Note] = [note1, note2]
}
