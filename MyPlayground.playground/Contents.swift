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
    var loader: FeedLoader!
    
    convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.loadFeed { loadedItems in
            // update UI
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

class RemoteWithLocalFallbackFeedLoader: FeedLoader {
    let remote: RemoteFeedLoader
    let local: LocalFeedLoader
    
    init(remote: RemoteFeedLoader, local: LocalFeedLoader) {
        self.remote = remote
        self.local = local
    }
    
    func loadFeed(completion: (([String]) -> Void) -> Void) {
        let load = Reachability.networkAvailable ? remote.loadFeed : local.loadFeed
        load(completion)
    }
}

// setup test implementation
let vcRemote = FeedViewController(loader: RemoteFeedLoader())
let vcLocal = FeedViewController(loader: LocalFeedLoader())
let vcRemoteWithLocal = FeedViewController(loader: RemoteWithLocalFallbackFeedLoader(remote: RemoteFeedLoader(), local: LocalFeedLoader()))
