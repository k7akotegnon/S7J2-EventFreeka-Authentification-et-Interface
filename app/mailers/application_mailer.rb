class ApplicationMailer < ActionMailer::Base
  default from: "onboarding@resend.dev" # Adresse e-mail d'expédition par défaut
  layout "mailer"
end
