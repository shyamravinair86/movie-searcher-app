![movie-searcher-logo](preview.jpg)

Movie-Searcher is an application that will help you to search movies online and add them as your favourites in Salesforce. The application is built using Lightning Web Components.

## Table of Contents
- [Installation Instructions](#installation-instruction)

- [Application Walkthrough](#application-walkthrough)

## Installation Instructions
1. Se up your environment. Follow the steps in the [Quick Start: Lightning Web Components](https://trailhead.salesforce.com/en/content/learn/projects/quick-start-lightning-web-components) Trailhead project. The steps include:
- Enable Dev Hub in your Trailhead Playground
- Install [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli)
- Install [Visual Studio Code](https://code.visualstudio.com/)
- Install the [Salesforce Extension Pack](https://marketplace.visualstudio.com/items?itemName=salesforce.salesforcedx-vscode) for Visual Studio Code.
2. Authenticate to your hub org and provide it with an alias as shown below:
```
sfdx force:auth:web:login -d -a myhuborg
```
3. Clone the movie-searcher-app repository:
```
git clone https://github.com/shyamravinair86/movie-searcher-app.git
git cd movie-searcher-app
```
4. Create a scratch org and provide it with an alias:
```
sfdx force:org:create -s -f config/project-scratch-def.json -a movie-searcher-app
```
5. Push the app to your scratch org:
```
sfdx force:source:push
```
6. Assign the MovieSearcher permission set to the default user:
```
sfdx force:user:permset:assign -n MovieSearcher
```
7. Export sample data to your dev hub:
```
sfdx force:data:tree:import --sobjecttreefiles data/My_Favourite_Movie__c.json
``` 
8. Open the scratch org:
```
sfdx force:org:open
```


## Application Walkthrough
