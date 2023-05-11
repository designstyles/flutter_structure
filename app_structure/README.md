# app_structure

This repository is a base level, fully functioning flutter application. 
## Things that I cover:
1) The live API response model is taken from a backend C# API structure example.
- [Example: C# Backend Structure] (https://github.com/designstyles/api_structure_net_6)

2) Mock API to show how to go about ensuring the front-end use cases are not dependant on a functioning API.

3) Application Architecture and References
    - Main
    	- Bootstrap to App
    	- All frontend logic  [cubits/state/views]
    - Packages
    	- API
    	- Models
    	- Repositories
    	- Services
	 
4) Navigation within the application #WITHOUT context being required
5) Global app wrappers (theme provider , any loading)
6) Authentication and UX update based on result
7) Generic FutureBuilder scaffold 
8) Lightweight widgets scoped to feature
9) Linting

## Things that I DO NOT cover:
1) Tests
2) Firebase (analytics, crashlytics, performance, messaging)
3) In-depth custom themes (I just use the default)
4) Inherited Widgets (might do a seperate branch for this)
