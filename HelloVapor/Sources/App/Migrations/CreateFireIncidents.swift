//
//  File.swift
//  
//
//  Created by akhil kakarla on 8/6/24.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateFireIncidents: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("fireincidents")
            .id()
            .field("incidentid", .string)
            .field("year", .string)
            .field("date", .string)
            .field("problem", .string)
            .field("priority", .string)
            .create()
        }

    func revert(on database: Database) async throws {
        try await database.schema("fireincidents").delete()
    }
}
