## My Version
#### ubuntu 14.04/Linux-mint 15
#### git 		(now - 1.8.1.2)
#### nodejs	(now - v0.10.25)
#### android-sdk	(now - api 19,android 4.4)

----------------------------------------------

### This 3 steps only need to do once.

- install Cordova	(now - 3.5.0-0.2.4)

        $ sudo npm install -g cordova

- install Yeoman	(now - 1.2.0)

        $ sudo npm install -g yeoman

- install AngularJS generator for Yeoman

        $ sudo npm install -g generator-angular

-----------------------------------------------

### The commands below should be done when create a cordova+angular+android project

- create a new cordova project,navigate to your workspace direction,and execute:
    
        $ cd to_my_worksapce/
    
        $ cordova create demo com.company.demo "DemoApp"

- add target platform(you can instead android by ios for ios developer)

        $ cd demo/

        $ cordova platform add android

- create a folder in the project to code in it

        $ mkdir webapp && cd webapp

- initial the new folder to a angularjs app struct
- during this command you need to input some words to chat with the terminal,don't worry about the error message:).
- there's so long a time to running this command,but you'd better watch it carefully.

        $ yo angular webapp 
    
        $ sudo npm install

----------------------------------------------------

### The commands under this line should be run when you build an apk first time

- build this angular app

        $ grunt --force

- preview the app demo on browser

        $ grunt serve

- if the display on browser run well(no bug),then build app for the platforms you have added before,here we build an android app, execute:

        $ rm -rf ../www/* 

        $ cp -rf dist/* ../www/

        $ cd ..

        $ cordova build

- then you can find out a apk file in platforms/android/ant-build/*debug.apk
- and if you have connected your android device with this pc,you can install it by command:
    
        $ adb install platforms/android/ant-build/*debug.apk

-----------------------------------------------

### after those step above,you have finished full steps from initial a empty project to build a apk and install it on device

- you can also write a auto_sync_deploy.sh script file,by running it in terminal you can auto sync the change code to cordova project and build a new version apk to install it into your device conected with pc.
    
        $ cd webapp/

        $ touch auto_sync_deploy.sh

        $ gedit auto_sync_deploy.sh

- input these code in it

        #!/bin/sh
        grunt --force
        rm -rf ../www/*
        cp -rf dist/* ../www/
        cd ../
        cordova build android
        cd mybapp/
        echo "Complete Now.You can install it by 'adb install -r *debug.apk'"
        adb install -r ../platforms/android/ant-build/*debug.apk

- to run it,under webapp/ you can run:

        $ sh auto_sync_deploy.sh

------------------------------------


#### Totol commands:

        $ sudo npm install -g cordova

        $ sudo npm install -g yeoman

        $ sudo npm install -g generator-angular

        $ cd to_my_worksapce/

        $ cordova create demo com.company.demo "DemoApp"

        $ cd demo/

        $ cordova platform add android

        $ mkdir webapp && cd webapp

        $ yo angular webapp

            n

            enter

            Y

            enter

            enter

        $ bower install

        $ sudo npm install

        $ grunt --force

        $ rm -rf ../www/*

        $ cp -rf dist/* ../www/

        $ cd ..

        $ cordova build

        $ cd webapp/

        $ adb install -r ../platforms/android/ant-build/*debug.apk

        $ echo "FINISHED"

----------------------------------------

###### Welcome your treasured suggestions to make this document better.
