# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_html2pdf_session',
  :secret      => 'b477c3d0522458301bc23fb3be2a72a2916b4c9d869dce0e621f2a2d29083bcd7d7d67aaf6b229c31669f0de76c74031c7dd6cb6f9240471e817d01eb424b6db'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
