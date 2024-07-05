# Portfolio Firebase Hosting

To deploy a Dart web application on Firebase Hosting, follow these steps:

Install Firebase Tools: Ensure you have the Firebase CLI (Command Line Interface) installed on your system. You can install it using npm (Node Package Manager) by running the following command in your terminal:

```
npm install -g firebase-tools
```

Build Your Dart Web Application: Before deploying, make sure you build your Dart web application into a production-ready state. In the root directory of your Dart web project, run the following command:

```
flutter build web --no-tree-shake-icons
```

This will create a `build/web` directory with the optimized and compiled files.

Authenticate with Firebase: Sign in to your Firebase account using the Firebase CLI by running:

```
firebase login
```

Follow the authentication steps in your browser.

Initialize Firebase: If you haven't already initialized Firebase in your project, run the following command in your project's root directory:

```
firebase init
```

1. Select a Firebase CLI feature: Hosting: `Configure File for Firebase and (Optionally) set up Github Action deploys`

2. Select a default Firebase project: If you have multiple Firebase projects associated with your account, you'll be asked to choose the one you want to use for hosting. Select the appropriate project from the list.

3. What do you want to use as your public directory? This is where you'll specify the directory that contains your compiled Dart web files. Since you are building a Dart web application, you should enter `build/web` as the public directory. This is the location where Flutter compiles your web assets.

4. Configure as a single-page app (rewrite all URLs to /index.html)? Answer `No` to this question. For a Dart web application built with Flutter, you want to rewrite all URLs to "/index.html" to enable proper routing within your application.

5. Set up automatic builds and deploys with GitHub? This question asks if you want to set up continuous integration with GitHub. If you don't want to use this feature, you can choose `No`.

6. File "build/web/index.html" already exists. Overwrite? If you've run flutter build web before and the "index.html" file exists in the "build/web" directory, Firebase CLI will ask if you want to overwrite it. You can choose `No` to keep your existing "index.html" file if you've made custom changes to it.

Deploy to Firebase Hosting: Finally, deploy your Dart web application to Firebase Hosting by running:

```
firebase deploy
```
After a successful deployment, you will receive a hosting URL where your Dart web application is now live and accessible.


