# Be sure to restart your server when you modify this file.
require 'action_dispatch/middleware/session/dalli_store'

I4u::Application.config.session_store :dalli_store

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# I4u::Application.config.session_store :active_record_store
