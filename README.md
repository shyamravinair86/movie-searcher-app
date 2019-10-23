![movie-searcher-logo](preview.jpg)

Movie-Searcher is an application that will help you to search movies online and add them as your favourites in Salesforce. The application is built using Lightning Web Components.

## Table of Contents
- [Generate API Key for OMDb API](#generate-api-key-for-omdb-api)
- [Installation Instructions](#installation-instruction)
- [Post Installation Instructions](#post-installation-instructions)

## Generate API Key for OMDb API
1. Go to [OMDb API website](http://www.omdbapi.com) and familiarise with the api.
2. Click on API Key tab, select FREE as Account Type and your email address and click Submit.
3. Check your inbox for the api key.

## Installation Instructions
1. Set up your environment. Follow the steps in the [Quick Start: Lightning Web Components](https://trailhead.salesforce.com/en/content/learn/projects/quick-start-lightning-web-components) Trailhead project. The steps include:
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


## Post Installation Instructions
1. In your project directory, go to force-app/main/default/labels and update the value for the custom label. Replace <enter your api key> with your api key.
```
<?xml version="1.0" encoding="UTF-8"?>
<CustomLabels xmlns="http://soap.sforce.com/2006/04/metadata">
    <labels>
        <fullName>OMDB_API_URL</fullName>
        <language>en_US</language>
        <protected>true</protected>
        <shortDescription>OMDB_API_URL</shortDescription>
        <value>http://www.omdbapi.com/?apikey=<enter your api key here></value>
    </labels>
</CustomLabels>
```
