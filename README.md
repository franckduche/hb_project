# README

Ruby version: 2.6.3 / Rails version: 6.0.3

A model *UserAttribute* (`hb_project/app/models/user_attribute.rb`) allows to store custom attributes for a User.
The types Boolean and String are supported through the property `field_type`.

As requested by the exercise, the following criterias must be supported:
- [x] Admin manages the global User custom attributes  
  Done through `hb_project/test/models/user_attribute_test.rb`
- [ ] Admin manages a specific Event’s custom attributes
- [x] Admin makes a custom attribute optional/required on the User profile
  Done through `hb_project/test/models/user_attribute_test.rb`
- [x] Admin makes a custom attribute optional/required on the User signup form
  Done through `hb_project/test/models/user_attribute_test.rb`
- [ ] Admin makes a custom attribute optional/required on a specific Event Registration form
- [ ] User fills in a custom attribute on his profile
- [ ] User fills in a custom attribute on the signup form
- [ ] User fills in a custom attribute on an Event Registration form
- [x] User reads his custom attributes on his profile  
  Done through `hb_project/test/models/user_test.rb`
- [ ] Admin reads an Event registration’s custom attributes

**All those tests can be launched in a Docker container with `docker/run rails test -v`.** The default test framework provided by Rails 6 was used.

For the moment, everything highly relies on models. On a second step it could be good to abstract some logic into service classes.