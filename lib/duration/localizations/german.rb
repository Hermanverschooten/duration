# -*- encoding : utf-8 -*-
class Duration
  module Localizations
    # English localization
    module German
      LOCALE    = :de
      PLURALS   = %w(Sekunden Minuten Stunden Tage Woche)
      SINGULARS = %w(sekunde Minute Stunde Tag Woche)
      FORMAT    = proc do |duration|
    		str = duration.format('%w %~w, %d %~d, %h %~h, %m %~m, %s %~s')
    		str.sub(/^0 [a-z]+,?/i, '').gsub(/ 0 [a-z]+,?/i, '').chomp(',').sub(/, (\d+ [a-z]+)$/i, ' and \1').strip
    		# Produces a message like:
    		#  10 weeks, 2 days, 3 hours, 4 minutes and 5 seconds
    		#
    		# Any zero values should be removed.
    		# For example, if there's 0 days and 0 minutes, it might be:
    		#   10 weeks, 3 hours and 5 seconds
    	end
    end
  end
end
