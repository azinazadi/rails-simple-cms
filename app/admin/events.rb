ActiveAdmin.register Event do
  # [:ip, :what, :created_at].each { |f| filter f}
  # index do
    # [:ip, :what, :created_at].each { |f| columns f}
    # column :data do |event|
    #   event.what=='contact' ? "Contact##{event.data}" : event.data
    # end

  # end
  # index do
  #
  #
  # end
  # index :as => :grid do |event|
  #   link_to(event.ip, admin_event_path(event))
  # end

end
ActiveAdmin.register_page "Analytics" do
  content do
    table do
      tr do
        th 'ip'
        th 'count'
        th 'os'
        th 'whats'
      end
      sorted_ips = Event.select(:ip).distinct.map(&:ip).sort_by { |ip| Event.find_by(ip: ip).created_at}
      sorted_ips.reverse.each do |ip|
        whats = Event.where(ip: ip).all.map do |event|
          unless event.what=='contact'
            event.what
          else
            c = Contact.find(event.data)
            link_to("contact: #{c.from}", admin_contact_path(c), target: '_blank')
          end
        end.join(', ')
        count = Event.where(ip: ip).size
        tr do
          td "<a href='/admin/events?utf8=✓&q%5Bip_contains%5D=#{ip}' target='_blank'>#{ip}</a>".html_safe, style: 'width:15em'
          td count
          td (Event.where(ip: ip).first.data || '' )[-4..-1]
          td whats.html_safe
        end

      end
    end
  end
end
