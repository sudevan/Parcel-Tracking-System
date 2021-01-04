class TrackController < ApplicationController
    def track
        
    end
    def history
    #@History1 = History.all
    @tid=params[:trackid]
    #@History = History.all(:conditions => ["trackid = ?", tid])
    @History1 = History.where(trackid: params[:trackid] )
    @History1.each do |history|
      puts history.event 
        
    end  
    puts @History1
    puts "Tracking clicked"
    puts params[:trackid]
    if params[:trackid]==nil
      puts "Empty Parameter"
    else
      puts "Non Empty Parameter"
    end 
    end
    
    
end
