import SwiftUI

@main
struct SmartHomeApp: App {
    var body: some Scene {
        WindowGroup {
            SmartHomeView(objects: mockup_objects)
        }
    }
}
