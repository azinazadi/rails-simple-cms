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
        th 'os / entrance'
        th 'whats'
      end
      Event.select(:ip).distinct.each do |event|
        ip = event.ip
        whats = Event.where(ip: ip).all.map(&:what).join(', ')
        count = Event.where(ip: ip).size
        tr do
          td "<a href='/admin/events?ip_contains%5D=#{ip}'>#{ip}</a>".html_safe, style: 'width:15em'
          td count
          td Event.where(ip: ip).first.data[-4..-1]
          td whats
        end

      end
    end
  end
end
