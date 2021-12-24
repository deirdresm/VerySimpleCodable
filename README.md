#  To answer a question on r/SwiftUI

[Question here.](https://www.reddit.com/r/SwiftUI/comments/rn1gba/beginner_help_how_do_i_display_json_data_with/)

This kind of thing is common, trying to unpack data from a file (or database) and splat it onto the screen, and there are really not that many great *simple* examples.

This example borrows a couple of tips from Apple's [Garden example for WWDC 2021](https://developer.apple.com/videos/play/wwdc2021/10289/), which was built for macOS (and thus could easily be missed by iOS developers). I'm not using iOS-specific aspects, though; that app was written to show off some of the new fun for SwiftUI 3 for macOS (e.g., Table).

## Basics

1. FileDocument for the JSON file you're reading from. (Assumes a local file. If you're reading from an API, the process is slightly different.) Like the Garden app, I called this one Store. In a larger app with more relationships, you'd probably want ViewModel classes between the views and the Store (which is the Model's back end). But this is a simple case.
2. You need a model struct/class for your data rows. This one's the incredibly cleverly named Thing.swift. :P
3. This example uses the newer SwiftUI App lifecycle, which is weird and wonderful, especially on macOS (You design menus HOW? Yeah, they're views in the body of the app. Seriously.).
4. A compatible JSON file to read. database.json - in this case, stored in the app's bundle.
5. A view struct with the default name of ContentView.swift.
6. Make sure you allow read access to user-selected files. (Default on macOS.) Target -> Signing and Capabilities.

License: MIT
