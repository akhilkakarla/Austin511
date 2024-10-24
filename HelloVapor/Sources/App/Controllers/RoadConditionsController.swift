//
//  File.swift
//  
//
//  Created by akhil kakarla on 9/1/24.
//

import Foundation
import Fluent
import FluentPostgresDriver
import Vapor

struct RoadConditionsController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let road_conditions = routes.grouped("road_conditions")

        road_conditions.get(use: self.index)
        road_conditions.post(use: self.create)
        road_conditions.group(":ID") { road_condition in
            road_condition.delete(use: self.delete)
        }
    }

    
    @Sendable
    func index(req: Request) async throws -> [RoadConditionsDTO] {
        try await RoadConditions.query(on: req.db).all().map { $0.toDTO() }
    }

    @Sendable
    func create(req: Request) async throws -> RoadConditionsDTO {
        let road_condition = try req.content.decode(RoadConditionsDTO.self).toModel()

        try await road_condition.save(on: req.db)
        return road_condition.toDTO()
    }

    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
        guard let roadFind = try await RoadConditions.find(req.parameters.get("Road_ID"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await roadFind.delete(on: req.db)
        return .noContent
    }
 
}

