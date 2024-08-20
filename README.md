Overview:
This app is a simple logger for three different activities: Exercise, Meditation, and Hydration. It allows users to log their activities and view a summary of their logged activities.

Features Log Activities: 
Users can log Exercise, Meditation, and
Hydration activities.  

Picker: 
Uses a wheel picker for selecting the duration of Exercise and Meditation activities to reduce human error
in input validation. 

Hydration Validation: 
The app includes basic validation for hydration input to ensure users enter valid quantities.

Wheel Picker for Duration Reasoning: 
The wheel picker was chosen for selecting the duration of activities to minimize human
error and simplify input validation. The decision to use SwiftData with the MVVM pattern was driven by curiosity,despite it being a new experience. 

Challenges: 
Using SwiftData with MVVM proved challenging due to the @Query property wrapper being availableonly in the SwiftUI View context. 

Approaches Tried: Extending ViewModel:
Attempted to extend the ViewModel dedicated to SwiftData. Singleton SwiftDataService: Implemented a singleton SwiftDataService while losing the @Query property wrapper and manually refreshing and updating the data. Experience Despite the challenges, it has been a fun and rewarding experience working through the implementation of this app.

