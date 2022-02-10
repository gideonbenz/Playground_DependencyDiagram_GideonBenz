//
// Copyright © Gideon Benz. All rights reserved.
//

import UIKit

protocol FeedLoader {
    func loadFeed(completion: (([String]) -> Void) -> Void)
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
