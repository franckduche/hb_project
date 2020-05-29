# README

Ruby version: 2.6.3 / Rails version: 6.0.3

A model *UserAttribute* (`hb_project/app/models/user_attribute.rb`) allows to store custom attributes for a User. The types Boolean and String are supported through the property `field_type`.  
A model *User* (`hb_project/app/models/user.rb`) represents the users, with a `role` property to defined whether they are a basic user or an admin.  
A model *UserAttributeValue* (`hb_project/app/models/user_attribute_value.rb`) has been created to act as a join model between User and UserAttribute. A many-to-many relation links them all together. This is the place where the specific values of the custom attributes will be stored for the users.  

As requested by the exercise, the following criterias must be supported:
- [x] Admin manages the global User custom attributes  
  Done through `hb_project/test/models/user_attribute_test.rb`
- [ ] Admin manages a specific Event’s custom attributes
- [x] Admin makes a custom attribute optional/required on the User profile
  Done through `hb_project/test/models/user_attribute_test.rb`
- [x] Admin makes a custom attribute optional/required on the User signup form
  Done through `hb_project/test/models/user_attribute_test.rb`
- [ ] Admin makes a custom attribute optional/required on a specific Event Registration form
- [x] User fills in a custom attribute on his profile  
  Done through `hb_project/test/models/user_test.rb`
- [x] User fills in a custom attribute on the signup form  
  Done through `hb_project/test/models/user_test.rb`
- [ ] User fills in a custom attribute on an Event Registration form
- [x] User reads his custom attributes on his profile  
  Done through `hb_project/test/models/user_test.rb`
- [ ] Admin reads an Event registration’s custom attributes

**All those tests can be launched in a Docker container with `docker/run rails test -v`.** The default test framework provided by Rails 6 was used.

For the moment, everything highly relies on models. On a second step it could be good to abstract some logic into service classes.