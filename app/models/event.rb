class Event < ActiveRecord::Base
  attr_accessible :ip, :what, :data

  scope :on_win, -> (scope) { have_ip_in(scope.visits.where 'data LIKE ?', '%Win%') }
  scope :on_mac, -> (scope) { have_ip_in(scope.visits.where 'data LIKE ?', '%Mac%') }
  scope :on_lin, -> (scope) { have_ip_in(scope.visits.where 'data LIKE ?', '%Lin%') }

  scope :filter_google, -> { where 'data LIKE ?', '%google%'}
  scope :filter_wikipedia, -> { where 'data LIKE ?', '%google%'}
  scope :filter_visits, -> { where 'data LIKE ? OR data LIKE ? OR data LIKE ?', '%google%', '%wikipedia%', '%bing%'}

  scope :visits, -> { where what: 'visit' }
  scope :downloads, -> { where what: 'download' }
  scope :contacts, -> { where what: 'contact' }
  scope :runs, -> { where what: 'run' }

  scope :in_week, -> (week) { where created_at:week..week+1.week }

  scope :distinct_ips, -> {select(:ip).distinct}

  scope :download_and_run, -> (run_scope) { downloads.where('ip in (?)', run_scope.distinct_ips.map(&:ip)).distinct_ips }

  scope :have_ip_in, -> (ip_scope) {where('ip in (?)', ip_scope.distinct_ips.map(&:ip))}

  def self.first_time_visit_count(start_of_week)
    ips = Event.in_week(start_of_week).distinct_ips.map(&:ip)
    ips.count - Event.where('ip in (?)', ips).where('created_at < ?', start_of_week).distinct_ips.count
  end

  def self.count_users
    distinct_ips.count
  end

end
