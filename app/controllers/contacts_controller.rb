class ContactsController < ApplicationController
  def create
    from = params[:from]
    body = params[:body]
    Pony.mail(:to => 'arianepauls@web.de',          :from => 'letter@ramble.berlin', :subject => "[RAMBLE] new contact from #{from}", :body => "#{body}  -- #{from}")
    Pony.mail(:to => 'norbert.witzgall@gmail.com',  :from => 'letter@ramble.berlin', :subject => "[RAMBLE] new contact from #{from}", :body => "#{body}  -- #{from}")
    Pony.mail(:to => 'mail@arianepauls.com',        :from => 'letter@ramble.berlin', :subject => "[RAMBLE] new contact from #{from}", :body => "#{body}  -- #{from}")
    Pony.mail(:to => 'aazadi@gmail.com',            :from => 'letter@ramble.berlin', :subject => "[RAMBLE] new contact from #{from}", :body => "#{body}  -- #{from}")

    Contact.create!(from: from, body: body)

    redirect_to '/#see-you-soon'
  end
end
