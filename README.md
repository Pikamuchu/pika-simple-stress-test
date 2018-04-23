# Pika chromeless stress test 

## Introduction

Simple stress test script for opening pages using chromeless library.

## Installing / Getting started 

TODO

## Developing 
 
### Built With
* [Headless Chrome Automation tool](https://github.com/graphcool/chromeless)

### Prerequisites
The following software must be installed
* [Node >= v8](https://nodejs.org/en/)
* [Chrome >= v60](https://www.google.com.mx/chrome/)
* [Git](https://git-scm.com/downloads) - optional

### Folder structure
* root: Contains the README.md, the main configuration to execute the project such as package.json or any other configuration file.
* processes: Contains the scripts to start/stop Chrome in headless mode or any other system script required to run the tests.
* src: Contains the simple stress test script.
* node_modules: Contains third party JS libraries used in this project

### Setting up Dev

Download the code
```
git clone https://github.com/pikamachu/pika-chromeless-stress-test.git
cd pika-chromeless-stress-test
```

Install dependencies
```
npm install
```

Run simple stress test.
```
npm run stress-test []
```

This will start the chrome headless process
```
npm run start:win
```

This will stop the chrome headless process
```
npm run stop:win
```

### Pika commands

All previous command can be executed using pika script

```shell
Usage: pika [command]

where [command] is one of:
   stress-test - execute application tests (starts and stops chrome).
```

## Environment
* The project should be ran in a Windows environment an use the .bat files to start and stop chrome.
* Chrome should be installed in **c:\Program Files (x86)\Google\Chrome\Application**, if it is not the case update the path in **processes/start-chrome-headless.bat**.

