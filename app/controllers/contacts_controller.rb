class ContactsController < ApplicationController
  def create
    from = params[:from]
    body = params[:body]
    name = params[:name]

    #set the default options
    Pony.options = {
      :from => 'graphtea@gmail.com',
      :via => :smtp,
      :via_options => {
          :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
          :user_name            => 'graphtea@gmail.com',
          :password             => ENV['gtp'],
          :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
          :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
        }    }
    #Pony.mail(:to => %w(aazadi@gmail.com rostamiev@gmail.com),            :subject => "[GraphTea] new download from #{from}", :body => "#{body}  -- #{from} — #{name}")

    #Pony.mail to: params[:from], subject: StaticText.find_by_key(:first_evaluation_subject).value, html_body: StaticText.find_by_key(:first_evaluation_body).value

    c = Contact.create!(from: from, body: body, name: name)
    # Event.create(ip: request.remote_ip, what: 'contact', data: c.id)

    redirect_to '/download'
  end
end
