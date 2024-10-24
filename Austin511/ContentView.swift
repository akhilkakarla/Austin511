//
//  ContentView.swift
//  SmartTrack
//
//  Created by akhil kakarla on 9/3/24.
//

import Foundation
import SwiftUI
import MapKit

struct ContentView: View {
    
        @State var austin = CLLocationCoordinate2D(latitude: 30.266666, longitude: -97.733330)
        
        @State private var showMenu = false
        @State private var camera: String = ""
        @State private var camObjs: [CameraObjects] = []
        @State private var showingInfo = false
    
        static let austin = CLLocationCoordinate2D(latitude: 30.266666, longitude: -97.733330)
        var body: some View {
            TabView{
                
                        //HomeView() ----------------------
                        NavigationStack {
                            HomeView()
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbarBackground(Color(hex: "#560591"), for: .navigationBar)
                                .toolbarBackground(.visible, for: .navigationBar)
                                .toolbarColorScheme(.dark, for: .navigationBar)
                                .toolbar{
                                    ToolbarItem(placement: .navigationBarTrailing) {
                                        Button(action: {
                                            self.showingInfo.toggle()
                                        },label: {
                                            Image(systemName: "info.circle")
                                        })
                                        .sheet(isPresented: $showingInfo) {
                                            InfoView()
                                        }
                                        
                                   }
                                }
                        }
                        .tabItem{
                            Label("Home", systemImage: "house")
                            Image(systemName: "photo")
                        }
                        .toolbar(.visible, for: .tabBar)
                        .toolbarBackground(Color(hex: "#560591"), for: .tabBar)
                        .toolbarBackground(.visible, for: .tabBar)
                        .toolbarColorScheme(.dark, for: .tabBar)
                
                
                        Cameras()
                        .tabItem{
                            Label("Cameras", systemImage: "camera.circle")
                        }
                        .toolbar(.visible, for: .tabBar)
                        .toolbarBackground(Color(hex: "#560591"), for: .tabBar)
                        .toolbarBackground(.visible, for: .tabBar)
                        .toolbarColorScheme(.dark, for: .tabBar)
                    
                
                        RoadConditions()
                        .tabItem{
                            Label("Conditions", systemImage: "snowflake.circle")
                        }
                        .toolbar(.visible, for: .tabBar)
                        .toolbarBackground(Color(hex: "#560591"), for: .tabBar)
                        .toolbarBackground(.visible, for: .tabBar)
                        .toolbarColorScheme(.dark, for: .tabBar)
                
                
                        TrafficIncidents()
                        .tabItem{
                            Label("Incidents", systemImage: "exclamationmark.triangle.fill")
                        }
                        .toolbar(.visible, for: .tabBar)
                        .toolbarBackground(Color(hex: "#560591"), for: .tabBar)
                        .toolbarBackground(.visible, for: .tabBar)
                        .toolbarColorScheme(.dark, for: .tabBar)
                    
                
                        RoadClosures()
                        .tabItem{
                            Label("Closures", systemImage: "minus.circle.fill")
                        }
                        .toolbar(.visible, for: .tabBar)
                        .toolbarBackground(Color(hex: "#560591"), for: .tabBar)
                        .toolbarBackground(.visible, for: .tabBar)
                        .toolbarColorScheme(.dark, for: .tabBar)
                          
                
                 
                    /*
                        Construction()
                        .tabItem{
                            Label("Construction", systemImage: "cone.fill")
                        }
                        .toolbar(.visible, for: .tabBar)
                        .toolbarBackground(Color(hex: "#560591"), for: .tabBar)
                        .toolbarBackground(.visible, for: .tabBar)
                        .toolbarColorScheme(.dark, for: .tabBar)
              
                     */

            }
        }

}

#Preview {
    ContentView()
}


struct InfoView: View {
    var body: some View {
        VStack {

            Spacer()

            Image(uiImage: UIImage(named: "austin511_logo.webp")!)
                .resizable()
                .clipShape(.rect(cornerRadius: 25))
                .frame(width: 200, height: 200)
            Text("AUSTIN 511")
                .font(.system(size: 40))
                .fontWeight(.bold)
                //.multilineTextAlignment(.center)
                .padding(.horizontal, 50)
                .foregroundColor(Color(hex: "#560591"))

            Text("Real-time Traffic & Road Conditions")
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                //.padding(.horizontal, 50)
                .foregroundColor(Color(hex: "#560591"))
            Spacer()

            
            VStack() {
                NavigationLink {
                    Cameras()
                } label: {
                    Image(systemName: "camera.circle.fill").foregroundStyle(.white, .green)
                    Text("CAMERAS").fontWeight(.bold).multilineTextAlignment(.leading)
                    Text("\n")
                    Text("Real time CCTV images from cameras across Austin").multilineTextAlignment(.leading)
                }
            }
            Spacer()

            VStack() {
                NavigationLink {
                    RoadConditions()
                } label: {
                    Image(systemName: "snowflake.circle.fill").foregroundStyle(.white, .blue)
                    Text("CONDITIONS").fontWeight(.bold).multilineTextAlignment(.leading)
                    Text("\n")
                    Text("Real-time road conditions for driving. Provies road GRIP_LEVEL information for safe driving.").multilineTextAlignment(.leading)
                }
            }
            Spacer()
            
            VStack() {
                NavigationLink {
                    TrafficIncidents()
                } label: {
                    Image(systemName: "exclamationmark.triangle.fill").foregroundStyle(.white, .red)
                    Text("INCIDENTS").fontWeight(.bold).multilineTextAlignment(.leading)
                    Text("\n")
                    Text("Real-time traffic realted incidents (accidents/crashes) reported to 911.").multilineTextAlignment(.leading)
                }
            }
            Spacer()

            VStack() {
                NavigationLink {
                    RoadClosures()
                } label: {
                    Image(systemName: "minus.circle.fill").foregroundStyle(.white, .orange)
                    Text("CLOSURES").fontWeight(.bold).multilineTextAlignment(.leading)
                    Text("\n")
                    Text("Real-time road closures & construction work zones information").multilineTextAlignment(.leading)
                }
            }
            Spacer()
         
        }
        .padding(.leading)
        .foregroundColor(Color(hex: "#560591"))
        .multilineTextAlignment(.leading)
    }
}



struct Construction: View{
    
    @State private var constructionObjs: [ConstructionObjects] = []
    @State private var mapSelection: MKMapItem?
    
    var body: some View{
        NavigationView{
            ZStack{
                Map(selection:$mapSelection)
                {
                    ForEach(constructionObjs) {obj in
                        let locationArray: [Substring] = obj.geometry.split(separator: " ")
                        let latitudeValue = locationArray[2].dropLast()
                        let longitudeValue = locationArray[1].dropFirst()
                        let latitude = Double((String(latitudeValue)))
                        let longitude = Double((String(longitudeValue)))
                        
                        //Marker("", systemImage: "camera", coordinate: CLLocationCoordinate2D(latitude : latitude!, longitude: longitude!))
                        Annotation("", coordinate: CLLocationCoordinate2D(latitude : latitude!, longitude: longitude!)) {
                            ConstructionPopView(library: obj)
                        }
                    }
                }
                .task {
                    await constructionObjs = getConstructionObjs()
                }
            }
        }
    }

    
    func getConstructionObjs() async -> [ConstructionObjects]{
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string:"http://127.0.0.1:8080/construction")!)
            let decodedResponse : [ConstructionObjects] = try JSONDecoder().decode([ConstructionObjects].self, from: data)
            return decodedResponse

        } catch {
            print("Error info: \(error)")
            return []
        }
    }
}

struct Cameras: View{
    
    @State private var camObjs: [CameraObjects] = []
    @State private var mapSelection: MKMapItem?
    
    var body: some View{
        NavigationView{
            ZStack{
                Map(selection:$mapSelection)
                {
                    ForEach(camObjs) {obj in
                        let locationArray: [Substring] = obj.coordinates.split(separator: " ")
                        let latitudeValue = locationArray[2].dropLast()
                        let longitudeValue = locationArray[1].dropFirst()
                        let latitude = Double((String(latitudeValue)))
                        let longitude = Double((String(longitudeValue)))
                        
                        //Marker("", systemImage: "camera", coordinate: CLLocationCoordinate2D(latitude : latitude!, longitude: longitude!))
                        Annotation("", coordinate: CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)) {
                            CamerasPopView(library: obj)
                        }
                        
/*                        MapAnnotation(coordinate: CLLocationCoordinate2D(latitude : latitude!, longitude: longitude!)) {
                                        Button {
                                            print("Location is", "")
                                        } label: {
                                            Image("camera")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                        }
                                    }*/
                    }
                }
                .task {
                    await camObjs = getCameras()
                }
            }
        }
    }

    
    func getCameras() async -> [CameraObjects]{
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string:"http://127.0.0.1:8080/cameras")!)
            let decodedResponse : [CameraObjects] = try JSONDecoder().decode([CameraObjects].self, from: data)
            return decodedResponse

        } catch {
            print("Error info: \(error)")
            return []
        }
    }
}



struct HomeView: View {
    var body: some View {
        VStack {

            Spacer()
            
            Text("AUSTIN 511")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
                .foregroundColor(Color(hex: "#560591"))
            
            Image(uiImage: UIImage(named: "austin511_logo.webp")!)
                .resizable() // Dynamic sizing
                .frame(width: 360, height: 360)
                .clipShape(.rect(cornerRadius: 25))

            

/*
            

            VStack(spacing: 40) {
                NavigationLink {
                    TrafficIncidents()
                } label: {
                    Image(systemName: "car.side.rear.and.collision.and.car.side.front.slash")
                    Text("Traffic Incidents\nReal time Traffic Incidents data")
                }
                .multilineTextAlignment(.center)
                
                NavigationLink {
                    RoadClosures()
                } label: {
                    Image(systemName: "road.lanes")
                    Text("Road Closures\nReal time Road Closures data")
                }
                .multilineTextAlignment(.center)
                
                NavigationLink {
                    Cameras()
                } label: {
                    Image(systemName: "camera")
                    Text("Cameras\nReal time Cameras data")
                }
                .multilineTextAlignment(.center)


            }
            .padding(.leading)
*/
            Spacer()
        }
    }
}






struct FeatureCell: View {
    var image: String
    var title: String
    var subtitle: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 24) {
            Image(systemName: image)
//                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32)
                .foregroundColor(color)
                    
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}


struct TrafficIncidents: View{
    
    @State private var trafficincident: String = ""
    @State private var trafficIncidentObjs: [TrafficIncidentsObjects] = []
    @State private var mapSelection: MKMapItem?

    var body: some View{
        NavigationView{
            ZStack{
                Map(selection:$mapSelection)
                {
                    ForEach(trafficIncidentObjs) { obj in
                        //Marker("", systemImage: "car.side.rear.and.collision.and.car.side.front.slash", coordinate: CLLocationCoordinate2D(latitude : obj.latitude, longitude: obj.longitude))

                        Annotation("", coordinate: CLLocationCoordinate2D(latitude : obj.latitude, longitude: obj.longitude)) {
                            TrafficIncidentsPopView(library: obj)
                        }
                    }
                }
                .task {
                    await trafficIncidentObjs = getTrafficIncidents()
                }
            }
        }
    }
    
    func getTrafficIncidents() async -> [TrafficIncidentsObjects] {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string:"http://127.0.0.1:8080/trafficincidents")!)
            let decodedResponse : [TrafficIncidentsObjects] = try JSONDecoder().decode([TrafficIncidentsObjects].self, from: data)
            return decodedResponse

        } catch {
            print("Error info: \(error)")
            return []
        }
    }
}



struct RoadClosures: View{
    
    @State private var roadClosureObjs: [RoadClosuresObjects] = []
    @State private var constructionObjs: [ConstructionObjects] = []

    @State private var mapSelection: MKMapItem?

    var body: some View{
        NavigationView{
            ZStack{
                Map(selection:$mapSelection)
                {
                    ForEach(roadClosureObjs) { obj in
                        Annotation("", coordinate: CLLocationCoordinate2D(latitude: obj.latitude_coordinate, longitude: obj.longitude_coordinate)) {
                            RoadClosurePopView(library: obj)
                        }
                    }
                    
                    ForEach(constructionObjs) {obj in
                        let locationArray: [Substring] = obj.geometry.split(separator: " ")
                        let latitudeValue = locationArray[2].dropLast()
                        let longitudeValue = locationArray[1].dropFirst()
                        let latitude = Double((String(latitudeValue)))
                        let longitude = Double((String(longitudeValue)))
                        
                        //Marker("", systemImage: "camera", coordinate: CLLocationCoordinate2D(latitude : latitude!, longitude: longitude!))
                        Annotation("", coordinate: CLLocationCoordinate2D(latitude : latitude!, longitude: longitude!)) {
                            ConstructionPopView(library: obj)
                        }
                    }
                }
                .task {
                    await roadClosureObjs = getRoadClosures()
                    await constructionObjs = getConstructionObjs()
                }
            }
        }
    }
    
    func getRoadClosures() async -> [RoadClosuresObjects] {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string:"http://127.0.0.1:8080/roadclosures")!)
            let decodedResponse : [RoadClosuresObjects] = try JSONDecoder().decode([RoadClosuresObjects].self, from: data)
            return decodedResponse

        } catch {
            print("Error info: \(error)")
            return []
        }
    }
    
    func getConstructionObjs() async -> [ConstructionObjects]{
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string:"http://127.0.0.1:8080/construction")!)
            let decodedResponse : [ConstructionObjects] = try JSONDecoder().decode([ConstructionObjects].self, from: data)
            return decodedResponse

        } catch {
            print("Error info: \(error)")
            return []
        }
    }
}


struct RoadConditions: View{
    
    @State private var roadConditionsObjs: [RoadConditionsObjects] = []
    
    var body: some View{
        NavigationView{
            ZStack{
                Map()
                {
                    ForEach(roadConditionsObjs) { obj in
                        let locationArray: [Substring] = obj.location.split(separator: " ")
                        let latitudeValue = locationArray[2].dropLast()
                        let longitudeValue = locationArray[1].dropFirst()
                        let latitude = Double((String(latitudeValue)))
                        let longitude = Double((String(longitudeValue)))
                        
                        Annotation("", coordinate: CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)) {
                            RoadConditionsPopView(library: obj)
                                .animation(.easeInOut(duration: 2.0), value: 0.5)
                        }

                        
                        /*
                        MapCircle(center: CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!), radius: 100)
                            .foregroundStyle(.cyan.opacity(0.5))
                            .mapOverlayLevel(level: .aboveRoads)
                         */
                    }
                }
                .task {
                    await roadConditionsObjs = getRoadConditions()
                }
            }
        }
    }

    
    func getRoadConditions() async -> [RoadConditionsObjects]{
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string:"http://127.0.0.1:8080/roadconditions")!)
            let decodedResponse : [RoadConditionsObjects] = try JSONDecoder().decode([RoadConditionsObjects].self, from: data)
            print(decodedResponse.count)
            return decodedResponse

        } catch {
            print("Error info: \(error)")
            return []
        }
    }
}



struct CameraObjects: Identifiable, Codable {
    var id = UUID()
    let cameraid: String!
    let locationname: String!
    let camerastatus: String!
    let turnondate: String!
    let cameramanufacturer: String!
    let atdlocationid: String!
    let landmark: String!
    let signalengineerarea: String!
    let councildistrict: String!
    let jurisdiction: String!
    let locationtype: String!
    let primarystsegmentid: String!
    let crossstsegmentid: String!
    let primarystreetblock: String!
    let primarystreet: String!
    let primary_st_aka: String!
    let crossstreetblock: String!
    let crossstreet: String!
    let cross_st_aka: String!
    let coaintersectionid: String!
    let modifieddate: String!
    let publishedscreenshots: String!
    let screenshotaddress: String!
    let funding: String!
    let camid: String!
    let coordinates: String!

}

struct LocationInfo: Codable {
    let latitude: Double!
    let longitude: Double!
}


struct TrafficIncidentsObjects: Identifiable, Codable {
    var id = UUID()
    let traffic_report_id: String!
    let published_date: String!
    let issue_reported: String!
    let location: String!
    let latitude: Double!
    let longitude: Double!
    let address: String!
    let status: String!
    let status_date: String!
    let agency: String!
}

struct RoadConditionsObjects: Identifiable, Codable {
    var id = UUID()
    let road_id: String!
    let sensor_id: String!
    let location_name: String!
    let location: String!
    let timestamp: String!
    let voltage_y: String!
    let voltage_x: String!
    let voltage_ratio: String!
    let air_temp_secondary: String!
    let temp_surface: String!
    let condition_code_displayed: String!
    let condition_code_measured: String!
    let condition_text_displayed: String!
    let condition_text_measured: String!
    let friction_code_displayed: String!
    let friction_code_measured: String!
    let friction_value_displayed: String!
    let friction_value_measured: String!
    let dirty_lens_score: String!
    let grip_text: String!
    let relative_humidity: String!
    let air_temp_primary: String!
    let air_temp_tertiary: String!
    let status_code: String!
}

struct RoadClosuresObjects: Identifiable, Codable {
    var id = UUID()
    let sr_number: String!
    let sr_type_code: String!
    let sr_description: String!
    let owning_department: String!
    let method_received: String!
    let sr_status: String!
    let status_change_date: String!
    let created_date: String!
    let last_update_date: String!
    let close_date: String!
    let sr_location: String!
    let street_number: String!
    let zip_code: String!
    let county: String!
    let state_plane_x_coordinate: String!
    let state_plane_y_coordinate: String!
    let latitude_coordinate: Double!
    let longitude_coordinate: Double!
    let latitude_longitude: String!
    let council_district: String!
    let map_page: String!
    let map_tile: String!
    let date_and_time_of_closure: String!
    let date_and_time_of_reopening: String!
    let lanes_closed: String!
    let routine_or_emergency: String!
    let permit_number: String!
    let cross_streets: String!
    let detour_information: String!
    let business_or_dept_closing_road: String!
    let name_of_business: String!
}


struct ConstructionObjects: Identifiable, Codable {
    var id = UUID()
    let type: String!
    let geometry: String!
    let event_type: String!
    let data_source_id: String!
    let road_names: String!
    let direction: String!
    let description: String!
    let start_date: String!
    let end_date: String!
    let is_start_date_verified: String!
    let is_end_date_verified: String!
    let is_start_position_verified: String!
    let is_end_position_verified: String!
    let location_method: String!
    let work_zone_type: String!
    let vehicle_impact: String!
    let folderrsn: String!
    let name: String!
}

struct RoadClosurePopView: View {
    @State var library: RoadClosuresObjects
    @State private var showRoadClosuresPopover = false
    
    var body: some View {
        Image(systemName: "minus.circle.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25)
            .onTapGesture {
                showRoadClosuresPopover = true
            }
            .foregroundStyle(.white, .red)

            .popover(isPresented: $showRoadClosuresPopover) {
                Text("Date Reported::").font(.headline)
                Text(Date(), style: .date)
                Text("\n")
                Text("ROAD CLOSURE").font(.headline)
                Text("\n")
                Text("County:").font(.headline)
                Text(library.county)
                Text("\n")
                Text("Location:").font(.headline)
                Text(library.sr_location)
                Text("\n")
                Text("Coordinates:").font(.headline)
                Text(library.latitude_longitude)
                Text("\n")
                if (library.detour_information != nil) {
                    Text("Detour Information:").font(.headline)
                    Text(library.detour_information!)
                }
            }.frame(alignment: .leading)
    }
}


struct RoadConditionsPopView: View {
    @State var library: RoadConditionsObjects
    @State private var showRoadConditionsPopover = false
    @State private var animationAmount = 1.0
    
    var body: some View {
        if (library.condition_text_measured == "WT1") {
            Image(systemName: "cloud.rain.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .onTapGesture {
                    showRoadConditionsPopover = true
                }
                .foregroundStyle(.white, .blue)
                .overlay(
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 350, height: 350)
                        .opacity(0.2)
                        .animation(
                            .easeInOut(duration: 1)
                                .repeatForever(autoreverses: true),
                            value: animationAmount
                        )
                )
                .onAppear {
                    // Switch the value to 1.5
                    // The view has a different look when the value is 1.5
                    animationAmount = 1.5
                }
                    
                .popover(isPresented: $showRoadConditionsPopover) {
                    Text("Date Reported:").font(.headline)
                    Text(Date(), style: .date)
                    Text("Address:").font(.headline)
                    Text(library.location_name)
                    Text("Location:").font(.headline)
                    Text(library.location)
                    Text("Humidity:").font(.headline)
                    Text(library.relative_humidity)
                    Text("Air Temperature:").font(.headline)
                    Text(library.air_temp_primary)
                    Text("Road Surface Temperature:").font(.headline)
                    Text(library.temp_surface)
                    Text("Road Condition:").font(.headline)
                    Text("WET")
                    Text("Over All Road GRIP LEVEL:")
                        .font(.headline)
                        .foregroundStyle(.blue)
                    Text(library.grip_text)
                    

                }.frame(alignment: .leading)
        } else {
            Image(systemName: "sun.max.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .onTapGesture {
                    showRoadConditionsPopover = true
                }
                .foregroundStyle(.white, .orange)
                .overlay(
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 350, height: 350)
                        .opacity(0.2)
                )
                .animation(.easeOut(duration: 5), value: 5)
                    
                .popover(isPresented: $showRoadConditionsPopover) {
                    Text("Date Reported:").font(.headline)
                    Text(Date(), style: .date)
                    Text("Address:").font(.headline)
                    Text(library.location_name)
                    Text("Location:").font(.headline)
                    Text(library.location)
                    Text("Humidity:").font(.headline)
                    Text(library.relative_humidity)
                    Text("Air Temperature:").font(.headline)
                    Text(library.air_temp_primary)
                    Text("Road Surface Temperature:").font(.headline)
                    Text(library.temp_surface)
                    Text("Road Condition:").font(.headline)
                    Text(library.condition_text_measured)
                    Text("Over All Road GRIP LEVEL:")
                        .font(.headline)
                        .foregroundStyle(.blue)
                    Text(library.grip_text)

                }.frame(alignment: .leading)
        }
    }
    
}


struct Pulsation: View {
    @State private var pulsate = false
    var colors: [Color] = [Color.blue]
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.blue)
                .frame(width: 325, height: 325)
                .scaleEffect(pulsate ? 1.3 : 1.1)
                .opacity(0.5)
                .animation(.easeInOut(duration: 1.1).repeatForever(autoreverses: true), value: 0)
                .onAppear() {
                    self.pulsate.toggle()
                }
        }
    }
}




struct TrafficIncidentsPopView: View {
    @State var library: TrafficIncidentsObjects
    @State private var showTrafficIncidentsPopover = false
    
    var body: some View {
        Image(systemName: "exclamationmark.triangle.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
            .onTapGesture {
                showTrafficIncidentsPopover = true
            }
            .foregroundStyle(.white, .red)

            .popover(isPresented: $showTrafficIncidentsPopover) {
                Text("Address:").font(.headline)
                Text(library.address)
                Text("\n")
                Text("Location:").font(.headline)
                Text(library.location)
                Text("\n")
                Text("Reported Issue:").font(.headline)
                Text(library.issue_reported)
                Text("\n")
                Text("Date Reported:").font(.headline)
                Text(Date(), style: .date)
            }.frame(alignment: .leading)
    }
}


struct ConstructionPopView: View {
    @State var library: ConstructionObjects
    @State private var showConstructionPopover = false
    
    var body: some View {
        
        /*let fill = ShaderLibrary.Stripes(
            .float(12),
            .colorArray([.white])
            )
        */
        
        Image(systemName: "minus.circle.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25)
            .onTapGesture {
                showConstructionPopover = true
            }
            .foregroundStyle(.white, .orange)
            //overlay(().stroke(color, lineWidth: borderLineWidth))
        
            .popover(isPresented: $showConstructionPopover) {
                Text("CONSTRUCTION WORK").font(.headline)
                Text("\n")

                Text("Address:").font(.headline)
                Text(library.road_names)
                Text("\n")
                Text("Description:").font(.headline)
                Text(library.description)
                Text("\n")
                Text("Start Date:").font(.headline)
                Text(library.start_date)
                Text("\n")
                Text("End Date:").font(.headline)
                Text(library.end_date)
                Text("\n")

            }.frame(alignment: .leading)
    }
}


struct CamerasPopView: View {
    @State var library: CameraObjects
    @State private var showCamerasPopover = false
    
    var body: some View {
        
        Image(systemName: "camera.circle.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
            .onTapGesture {
                showCamerasPopover = true
            }
            .foregroundStyle(.white, .orange)
        
            .sheet(isPresented: $showCamerasPopover) {
                
                Text("\n")
                Text("CCTV Screenshot Web address :")
                    .font(.system(size: 15, design: .rounded))
                    .fontWeight(.heavy)
                Text(library.screenshotaddress)
                    .font(.system(size: 15, design: .rounded))
                    .frame(alignment: .leading)
                
                VStack {
                    Text("Location :")
                        .font(.system(size: 15, design: .rounded))
                        .fontWeight(.heavy)
                    Text(library.coordinates)
                        .font(.system(size: 15, design: .rounded))
                    Text("Cross-Streets :")
                        .font(.system(size: 15, design: .rounded))
                        .fontWeight(.heavy)
                    Text(library.locationname)
                        .font(.system(size: 15, design: .rounded))
                }.frame(alignment: .leading)
                
                AsyncImage(url: URL(string: library.screenshotaddress)) { image in
                    image.resizable()
                } placeholder: {
                    Color.blue
                }
                .frame(width: 350, height: 250, alignment: .topLeading)
                .clipShape(.rect(cornerRadius: 25))
                
                Text("AI Analytics - Vehicle Count Per Hour")
                    .font(.headline)
                if (Int(library.cameraid) == 64) {
                    Image(resource: "64", ofType: "jpg")
                        .resizable()
                        .frame(width: 360, height: 300, alignment: .topLeading)
                        .clipShape(.rect(cornerRadius: 25))
                }
                else if (Int(library.cameraid) == 267) {
                    Image(resource: "267", ofType: "jpg")
                        .resizable()
                        .frame(width: 360, height: 300, alignment: .topLeading)
                        .clipShape(.rect(cornerRadius: 25))
                }
                else if (Int(library.cameraid) == 281) {
                    Image(resource: "281", ofType: "jpg")
                        .resizable()
                        .frame(width: 360, height: 300, alignment: .topLeading)
                        .clipShape(.rect(cornerRadius: 25))
                }
                else if (Int(library.cameraid) == 538) {
                    Image(resource: "538", ofType: "jpg")
                        .resizable()
                        .frame(width: 360, height: 300, alignment: .topLeading)
                        .clipShape(.rect(cornerRadius: 25))
                }
                else {
                    Image(resource: "267", ofType: "jpg")
                        .resizable()
                        .frame(width: 360, height: 300, alignment: .topLeading)
                        .clipShape(.rect(cornerRadius: 25))
                    
                }

            }.frame(alignment: .leading)
    }
}



//********
extension Color {

    init(hex: String) {
        let trimHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let dropHash = String(trimHex.dropFirst()).trimmingCharacters(in: .whitespacesAndNewlines)
        let hexString = trimHex.starts(with: "#") ? dropHash : trimHex
        let ui64 = UInt64(hexString, radix: 16)
        let value = ui64 != nil ? Int(ui64!) : 0
        // #RRGGBB
        var components = (
            R: CGFloat((value >> 16) & 0xff) / 255,
            G: CGFloat((value >> 08) & 0xff) / 255,
            B: CGFloat((value >> 00) & 0xff) / 255,
            a: CGFloat(1)
        )
        if String(hexString).count == 8 {
            // #RRGGBBAA
            components = (
                R: CGFloat((value >> 24) & 0xff) / 255,
                G: CGFloat((value >> 16) & 0xff) / 255,
                B: CGFloat((value >> 08) & 0xff) / 255,
                a: CGFloat((value >> 00) & 0xff) / 255
            )
        }
        self.init(.sRGB, red: components.R, green: components.G, blue: components.B, opacity: components.a)
    }

}

extension Image {
  init(resource name: String, ofType type: String) {
    guard let path = Bundle.main.path(forResource: name, ofType: type),
          let image = UIImage(contentsOfFile: path) else {
      self.init(name)
      return
    }
    self.init(uiImage: image)
  }
}
