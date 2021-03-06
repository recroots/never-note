import Foundation
import RealmSwift

class DatabaseManager {
    static var realm: Realm? {
    do {
        let realm = try Realm()
        return realm
        } catch {
            print("unexpected error: \(error).")
        }
        return nil
    }
    
    public static func write(realm: Realm, writeClosure: () -> Void) {
        do {
            try realm.write {
                writeClosure()
            }
        } catch {
            print("unexpected error: \(error).")
        }
    }
}
