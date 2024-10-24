//
//  File.swift
//
//
//  Created by akhil kakarla on 8/25/24.
//

import Foundation
import Fluent
import FluentPostgresDriver
import Vapor

struct ConstructionController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let construction = routes.grouped("construction")

        construction.get(use: self.index)
        construction.post(use: self.create)
        construction.group(":ID") { construction in
            construction.delete(use: self.delete)
        }
    }

    
    @Sendable
    func index(req: Request) async throws -> [ConstructionDTO] {
        try await Construction.query(on: req.db).all().map { $0.toDTO() }
    }

    @Sendable
    func create(req: Request) async throws -> ConstructionDTO {
        let construction = try req.content.decode(ConstructionDTO.self).toModel()

        try await construction.save(on: req.db)
        return construction.toDTO()
    }

    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
        guard let constructionFind = try await Construction.find(req.parameters.get("ID"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await constructionFind.delete(on: req.db)
        return .noContent
    }
 
}
