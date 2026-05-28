# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Configuration SMTP pour SendGrid
#ActionMailer::Base.smtp_settings = {
#  :user_name => ENV['SENDGRID_LOGIN'], # Doit être 'apikey'
#  :password => ENV['SENDGRID_PWD'],   # Ta clé API secrète (SG.xxx)
#  :domain => 'ton-app-eventfreeka.onrender.com',
#  :address => 'smtp.sendgrid.net',
#  :port => 587,
#  :authentication => :plain,
#  :enable_starttls_auto => true
#}

# Configuration SMTP pour Brevo (ex-Sendinblue)
ActionMailer::Base.smtp_settings = {
  :user_name => ENV['BREVO_LOGIN'],      # Ton login SMTP Brevo (souvent ton email)
  :password => ENV['BREVO_PWD'],        # Ta clé API v3 (Master ou spécifique)
  :domain => 'https://s7j2-eventfreeka-authentification-et.onrender.com', # Ton domaine de prod
  :address => 'smtp-relay.brevo.com',    # L'adresse du serveur Brevo
  :port => 587,                          # Le port standard sécurisé
  :authentication => :plain,
  :enable_starttls_auto => true
}
