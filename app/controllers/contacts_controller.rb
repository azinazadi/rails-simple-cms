class ContactsController < ApplicationController
  def create
    from = params[:from]
    body = params[:body]

    #set the default options
    Pony.options = {
      :from => 'rambleberlin@gmail.com',
      :via => :smtp,
      :via_options => {
          :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
          :user_name            => 'rambleberlin',
          :password             => 'raemble@sept2014',
          :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
          :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
        }    }
    Pony.mail(:to => 'arianepauls@web.de',          :subject => "[RAMBLE] new contact from #{from}", :body => "#{body}  -- #{from}")
    Pony.mail(:to => 'norbert.witzgall@gmail.com',  :subject => "[RAMBLE] new contact from #{from}", :body => "#{body}  -- #{from}")
    Pony.mail(:to => 'mail@arianepauls.com',        :subject => "[RAMBLE] new contact from #{from}", :body => "#{body}  -- #{from}")
    Pony.mail(:to => 'aazadi@gmail.com',            :subject => "[RAMBLE] new contact from #{from}", :body => "#{body}  -- #{from}")

    Contact.create!(from: from, body: body)

    redirect_to '/#see-you-soon'
  end
end
