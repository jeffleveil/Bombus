import Foundation
import CoreData

extension Session {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Session> {
        return NSFetchRequest<Session>(entityName: "Session")
    }

    @NSManaged public var start: Date?
    @NSManaged public var duration: Double
    @NSManaged public var points: Int64

}

extension Session : Identifiable {
}
