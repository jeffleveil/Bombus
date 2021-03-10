import CoreData

public class PersistentContainer: NSPersistentContainer {}

public class StorageProvider {

    public let persistentContainer: NSPersistentContainer

    public init() {
        persistentContainer = PersistentContainer(name: "Bombus")

        // TODO: Create error checking to make sure containers are loaded properly.

        persistentContainer.loadPersistentStores(completionHandler: { _, error in
            if let error = error {
                fatalError("Core Data store failed to load with error: \(error)")
            }
        })
    }
}

public extension StorageProvider {

    func saveSession(with duration: Double) {
        let session = Session(context: persistentContainer.viewContext)
        session.duration = duration

        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
    }

}

public extension StorageProvider {
    func getAllSessions() -> [Session] {
        let fetchRequest: NSFetchRequest<Session> = Session.fetchRequest()

        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            // Present a prompt at this point for a failed fetch.
            print("Failed to fetch movies: \(error)")
            return []
        }
    }
}

public extension StorageProvider {
    func deleteSession(_ session: Session) {
        persistentContainer.viewContext.delete(session)

        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
    }
}
