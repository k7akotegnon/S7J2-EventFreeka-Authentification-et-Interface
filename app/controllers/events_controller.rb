class EventsController < ApplicationController
  # Force la connexion pour accéder au formulaire de création
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.includes(:administrator, :attendances).order(start_date: :asc)
  end

  def show
    @event = Event.includes(:administrator, attendances: :user).find(params[:id])
  end

  def new
    @event = Event.new # Prépare une instance vide pour le formulaire
  end

  def create
    # Ici, on utilise la méthode event_params pour sécuriser les données
    @event = Event.new(event_params)

    # On associe l'administrateur à l'utilisateur connecté
    @event.administrator = current_user

    if @event.save
      flash[:success] = "Événement créé avec succès !"
      redirect_to event_path(@event.id)
    else
      # Si les validations échouent, on réaffiche le formulaire avec les erreurs
      flash.now[:error] = "Erreur lors de la création : " + @event.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  # C'est cette méthode qui manquait !
  def event_params
    # On exige que les données soient dans un hash :event
    # Et on autorise uniquement les colonnes prévues dans les specs du projet
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
  end
end
