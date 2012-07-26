# Be sure to restart your server when you modify this file.

Web::Application.config.session_store :cookie_store, key: '_web_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Web::Application.config.session_store :active_record_store

# OmniauthDemo::Application.config.session_store :active_record_store   # >rake db:sessions:create  >rake db:migrate
Web::Application.config.session_store :cookie_store

Web::Application.config.session = {
  :key          => '_omniauthpure_session',     # name of cookie that stores the data
  :domain       => nil,                         # you can share between subdomains here: '.communityguides.eu'
  :expire_after => 1.month,                     # expire cookie
  :secure       => false,                       # fore https if true
  :httponly     => true,                        # a measure against XSS attacks, prevent client side scripts from accessing the cookie
  :secret      => '8bfb09358e663e8984e78cdd7160225c16bbafa0bb72a7975c4082353bf640b29bd01e8ff9763bface110a4a640c40b18894fe985480c228724a2fb5bf0a5922'
}
