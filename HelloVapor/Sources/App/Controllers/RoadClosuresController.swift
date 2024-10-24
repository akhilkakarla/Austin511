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

struct RoadClosuresController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let lane_and_road_closures = routes.grouped("lane_and_road_closures")

        lane_and_road_closures.get(use: self.index)
        lane_and_road_closures.post(use: self.create)
        lane_and_road_closures.group(":ID") { lane_and_road_closure in
            lane_and_road_closure.delete(use: self.delete)
        }
    }

    
    @Sendable
    func index(req: Request) async throws -> [RoadClosuresDTO] {
        try await RoadClosures.query(on: req.db).all().map { $0.toDTO() }
    }

    @Sendable
    func create(req: Request) async throws -> RoadClosuresDTO {
        let lane_and_road_closure = try req.content.decode(RoadClosuresDTO.self).toModel()

        try await lane_and_road_closure.save(on: req.db)
        return lane_and_road_closure.toDTO()
    }

    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
        guard let RoadClosureFind = try await RoadClosures.find(req.parameters.get("sr_number"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await RoadClosureFind.delete(on: req.db)
        return .noContent
    }
 
}



