import Foundation
import Fluent
import FluentPostgresDriver

struct CreateStudents: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("students")
            .id()
            .field("name", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("students").delete()
    }
}
