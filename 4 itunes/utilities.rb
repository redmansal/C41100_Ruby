#!/opt/local/bin/ruby1.9 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2010
# This is fairly crap...does not deal with other types like nil or 12

module Tuneuts

   #will fetch object give string that is its name
   def self.fetch(item, out = [])
       songs = ObjectSpace.each_object(Song).to_a
       actors = ObjectSpace.each_object(Actor).to_a
       albums = ObjectSpace.each_object(Album).to_a
       libraries = ObjectSpace.each_object(Library).to_a
       all = songs + actors + albums + libraries
	  case
		when item.instance_of?(String) 
		   all.each do |obj| 
			 if obj.name.downcase == item.downcase
				   then	out << obj end end
		     if (out.length > 1) 
		   	      then MyErr.new("multiple_answer_error", item, "fetch").do_it end
		when item.isa?
			 all.each {|obj| if obj.eql?(item) then out << obj end}
		else MyErr.new("weird_item", item, "fetch").do_it
	  end
	  out.first
   end
	
end

