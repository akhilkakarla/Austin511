//
//  File.swift
//  
//
//  Created by akhil kakarla on 8/7/24.
//
import Foundation
import Fluent
import FluentPostgresDriver
import Vapor

struct FireController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let fireincidents = routes.grouped("fireincidents")

        fireincidents.get(use: self.index)
        fireincidents.post(use: self.create)
        fireincidents.group(":FireID") { fire in
            fire.delete(use: self.delete)
        }
    }

    
    @Sendable
    func index(req: Request) async throws -> [FireDTO] {
        try await FireModel.query(on: req.db).all().map { $0.toDTO() }
    }

    @Sendable
    func create(req: Request) async throws -> FireDTO {
        let fire = try req.content.decode(FireDTO.self).toModel()

        try await fire.save(on: req.db)
        return fire.toDTO()
    }

    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
        guard let fire = try await FireModel.find(req.parameters.get("FireID"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await fire.delete(on: req.db)
        return .noContent
    }
 
}
