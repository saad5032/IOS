

import Foundation
import UIKit
import _Concurrency
import CoreLocation

// FileHandle, URL, Notifications


let paths = Bundle.main.paths(forResourcesOfType: "txt", inDirectory: nil)
 
/*
let fileHandle = FileHandle(forReadingAtPath: paths[0])

Task {
    for try await line in fileHandle!.bytes.lines {
        print(line)
    }
}


Task {
    let url = URL(fileURLWithPath: paths[0])
    
    for try await line in url.lines {
        print(line)
    }
}
*/
/*
let url = URL(string: "https://www.google.com")!
Task {
    let (bytes, _) = try await URLSession.shared.bytes(from: url)
    for try await byte in bytes {
        print(byte)
    }
}
*/
Task {
    let center = NotificationCenter.default
    let _ = await center.notifications(named: UIApplication.didEnterBackgroundNotification).first {
        guard let key = ($0.userInfo?["Key"]) as? String else { return false }
        return key == "SomeValue"
    }
}


