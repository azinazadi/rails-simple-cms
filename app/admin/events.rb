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
def num(num, divisor, bold=false)
  return '-' if divisor == 0
  ret = (num / divisor.to_f).round(1)
  !bold ? ret : "<b>#{ret}</b>"
end
ActiveAdmin.register_page "Analytics" do
  content do
    h2 'Reports'

    first = Event.first.created_at
    last  = Event.last.created_at
    current = first
    table do
      tr do
        th 'date'
        th 'visits'
        th 'DLs'
        th 'contacts'
        th 'runs'
        th 'first visits / day'
        th 'DLs / day, DLs / visit'
        th 'first runs / day'
        th 'contacts / DLs'
        th 'visits / day: total, win, mac, lin'
        th 'DLs / day: total, w, m, l'
        th 'first run / DLs: total, w, m, l'
      end
      while (current < last)
        tr do
          events = Event.in_week current
          td "#{current.strftime("%d.%m.%y")} .. #{(current+1.week).strftime("%d.%m.%y")}"
          [:visits, :downloads, :contacts, :runs].each{ |s| td events.try(s).count_users}
          td num(Event.first_time_visit_count(current),7)
          td [
            num(events.downloads.count_users, 7),
            num(events.downloads.count_users, Event.first_time_visit_count(current)),
          ].join(' , ').html_safe
          td num(events.runs.have_ip_in(events.downloads).count_users, 7)
          td num(events.contacts.count_users, events.downloads.count)

          td [
            num(events.visits.count_users, 7),
            num(events.visits.on_win(events).count_users, 7),
            num(events.visits.on_mac(events).count_users, 7),
            num(events.visits.on_lin(events).count_users, 7),
          ].join(' , ').html_safe

          td [
            num(events.downloads.count_users,7),
            num(events.downloads.on_win(events).count_users, 7),
            num(events.downloads.on_mac(events).count_users, 7),
            num(events.downloads.on_lin(events).count_users,1),
          ].join(' , ').html_safe



          td [
              num(events.runs.have_ip_in(events.downloads).count_users, events.downloads.count_users),
              num(events.runs.have_ip_in(events.downloads.on_win(events)).count_users, events.downloads.on_win(events).count_users),
              num(events.runs.have_ip_in(events.downloads.on_mac(events)).count_users, events.downloads.on_mac(events).count_users),
              num(events.runs.have_ip_in(events.downloads.on_lin(events)).count_users, events.downloads.on_lin(events).count_users),
             ].join(' , ').html_safe

          current += 1.week
        end
      end
    end

    table do
      tr do
        th 'date'
        th 'count'
        th 'os'
        th 'ip'
        th 'whats'
      end
      sorted_ips = Event.where("created_at >= ?", 14.days.ago).select(:ip).distinct.map(&:ip)
      sorted_ips.reverse.each do |ip|
        whats = Event.where(ip: ip).all.map do |event|
          if event.what=='contact'
            c = Contact.find(event.data)
            link_to("contact: #{c.from}", admin_contact_path(c), target: '_blank')
          elsif event.what == 'visit'
            "visit"
          else
            event.what
          end
        end.join(', ')
        count = Event.where(ip: ip).size
        tr do
          td "#{Event.where(ip: ip).first.created_at.strftime("%d.%m.%y")} - #{Event.where(ip: ip).last.created_at.strftime("%d.%m.%y")}"
          td count
          td (Event.where(ip: ip).first.data || '' )[-4..-1]
          td "<a href='/admin/events?utf8=✓&q%5Bip_contains%5D=#{ip}' target='_blank'>#{ip}</a>".html_safe, style: 'width:15em'
          td whats.html_safe
        end

      end
    end
  end
end
