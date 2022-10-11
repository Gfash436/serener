# Application Name
Serener

# Description
Serener is a relaxation centre located in Abeokuta, Ogun State. It is known for selling expensive drinks and confectioneries. Create an app to enable user to sign up, login and the list of all available items. 

# Framework Used
Flutter

# Programming language Used
Dart

# Dependencies

 cupertino_icons: ^1.0.2
 google_fonts: ^3.0.1
 http: ^0.13.5

nodemon
config
in the config folder, this is where db.js file, which is where i require mongoose which is a MongoDB(database) object modeling tool designed to work in asynchronous environment.

models
In the models folder, this is where a create my schema for the User and the item. file, /serener/models/user_model.js. in this data user_model contain the model schema of register(writen in camelCase) which consist of : firstName,lastName,age,email,phoneNumber,password and role(this consist of admin and user) file, /serener/models/items_model.js. in this data item_model contain the model schema of items which categorize in two:

drinks: which consist of 'hennessy','divaVodka','johnnieWalker','brandy','smirnoff','blackLabel'.
confectionary:which consist of 'candyPatisserie','nutsCake','creamCake'. which are listed with the help of enum
controller
In the controller folder, where function to get the requested data form the models. there to two file, in the controller which is the

/controller/user_controller.js
/controller/item_controller.js
user_controller.js
this is the controller file which perform our request function which are:

userSignIn
userLogIn
allItem
allUserByEmail
switchAdmin
item_controller.js
this is the controller file which perform our request function which are:

addItem
allItem
middleware
middleware folder this where the Auth.js file is placed, which i require the jsonwebtoken for authorization which allow a login user who as been authenticated to have aacess in web app

router
this is where the request from collector is been imoprted to the routes,in which it is been routing with express in Node.express has a framework has an object corresponds to HTTP with a request method like GET,POST,PUT,DELETE etc. And also importing the Auth.js

model/item_routes router.post('/create', AdminAuth , addItem);
router.get('/all',Auth, allItem);

router.put("/purchase", Auth, selectItem);

model/item_routes

register user:router.post('/signup',userSignUp);

login user:router.post('/login',userLogIn);

adi router.get('/alluser', AdminAuth, allUser);

router.get('/user/:email',AdminAuth, findUserByEmail);

router.put('/admin/:id',switchAdmin);

index.js
index.js file handles the website startup,routing and other functions of the application and require other functions like modules,morgan,dotenv

Testing api
postman

publish test

blog: https://dev.to/folacode22/handling-exception-in-nodejs-express-4kdo

Footer
© 2022 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
Serener-app/README.md at main · folacode22/Serener-app