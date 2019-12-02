RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    # if current_administrator && current_administrator.admin != true
      
      warden.authenticate! scope: :administrator unless current_administrator && current_administrator.admin == true
      alert =  'Oops,Only authorized systeme administrator can access this page, Login to continue.'
    # end
  end
  config.current_user_method(&:current_user)

  # config.navigation_static_links = {
  #   'Logout' => destroy_administrator_session_path
  # }
   
  
  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  # config.authorize_with do
  #   redirect_to home_path  unless current_user && current_user.admin == true
  #   end
  

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
