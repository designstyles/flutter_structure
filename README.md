# flutter_structure
A small basic flutter application, with production ready architecture

This application forms the base of my application design. 
It covers:
1 - Some widgets that can be easily extendable. 
2 - Internal Packages for seperation of application/models/services/repositories/apis
3 - Some basic features which are common in todays application world (Screen navigation, data deserialization, streams, state - management)
4 - Splash screen
5 - globally utilizing dark mode

# People / Projects I have learnt from:
Some really good projects / people I have learnt from are:
1 - Filled Stacks
    - A South African developer who has some really good tutorials on getting some foundational work done nicely. 
    - I specfically like his stacked_services package. I use it for appiplcation navigation. 
    - https://www.filledstacks.com/
    - https://pub.dev/publishers/filledstacks.com/packages

2 - Google Developer Student Club PoliMi
    - A group of developers who have some great talks on various topics.
    - I specifically enjoyed the talk regarding seperation of models/services/repositories. 
      I took what they did, and slightly modified it for practices that suit my coding style better. But it was a good starting point.
    - https://www.youtube.com/watch?v=WX9fmKlH5cQ&ab_channel=GoogleDeveloperStudentClubPoliMi
    
3 - Some really great packages that I use: 
   - bloc / flutter_bloc 
     - Used for state management. Generally used with equatable, however I dont always use it with equatable
     - https://pub.dev/packages/bloc
     - https://pub.dev/packages/flutter_bloc

   - build_runner (built_value, built_value_generator, built_collection, injectable_generator)
     - Used for executing auto-class generating
     - https://pub.dev/packages/built_value
     - https://pub.dev/packages/build_runner
     - https://pub.dev/packages/built_collection
     - https://pub.dev/packages/built_value_generator
     - https://pub.dev/packages/injectable_generator
     
   - flutter_launcher_icons_maker
     - Used for auto generating icons for your application
     - https://pub.dev/packages/flutter_launcher_icons_maker

   - very_good_analysis
     - used for linting. I really like their analysis tooling. They do have a full CLI that can be useful, however I found it hard to change flavors and some of the other cli defaults
     - https://pub.dev/packages/very_good_analysis
     
   - flow_builder
     - Used for login flow for authenticated / public views. Also useful for showing a splash screen
     - https://pub.dev/packages/flow_builder
     
   - firebase (analytics, crashlytics, messaging, core, performance)
     - They have various packages that are useful for public apps. There is some setup that is required, but there are
       lots of tutorials available for utilizing them. 
     - https://pub.dev/packages/firebase_analytics
     - https://pub.dev/packages/firebase_core
     - https://pub.dev/packages/firebase_crashlytics
     - https://pub.dev/packages/firebase_performance
       
   - double_back_to_close
     - Used for wrapping the entire application with a double_back_exit widget. Makes for a nice user experience
     - https://pub.dev/packages/double_back_to_close
     
There are many more that are great for development, but most are use-case dependant.
