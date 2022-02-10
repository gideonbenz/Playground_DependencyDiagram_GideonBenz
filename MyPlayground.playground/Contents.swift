//
// Copyright © Gideon Benz. All rights reserved.
//

import UIKit

protocol FeedLoader {
    func loadFeed(completion: (([String]) -> Void) -> Void)
}

struct Reachability {
    static let networkAvailable = false
}

class FeedViewController: UIViewController {
    var remote: RemoteFeedLoader!
    var local: LocalFeedLoader!
    
    convenience init(remote: RemoteFeedLoader, local: LocalFeedLoader) {
        self.init()
        self.remote = remote
        self.local = local
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Reachability.networkAvailable {
            remote.loadFeed { loadedItems in
                // update UI
            }
        } else {
            local.loadFeed { loadedItems in
                // update UI
            }
        }
    }
}

class RemoteFeedLoader: FeedLoader {
    func loadFeed(completion: (([String]) -> Void) -> Void) {
        // do something
    }
}

class LocalFeedLoader: FeedLoader {
    func loadFeed(completion: (([String]) -> Void) -> Void) {
        // do something
    }
}
