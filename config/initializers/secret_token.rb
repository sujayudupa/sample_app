# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# SampleApp::Application.config.secret_key_base = '5a3a65dee7ff910e32fb44ac61bd3078943b245a0884f6c998a43eb89149d6439f0794292d61690c785ca0b30d18c51c5d8b4d7eceac3c2f3908f20aa9ec60a4'
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exists?(token_file)
		File.read(token_file).chomp
	else
		token = SecureRandom.hex(64)
		File.write(token_file,token)
		token
	end
end

SampleApp::Application.config.secret_key_base = secure_token