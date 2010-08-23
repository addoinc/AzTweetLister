# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tweetauth_session',
  :secret      => '0e4b9631dc78838dd53a1c60d637de35983924d0ef94fc4cb2ba39deb9261e744ed584a3c87f4455737f2bfde335594635050cde1f2f8849f5dc4086143c404f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
