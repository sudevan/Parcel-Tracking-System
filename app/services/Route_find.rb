class RouteFind
    def initialize
    end
    def findpath2(source_orig,destination)
        puts "Route find started"
        route =[]
        state = 0
        source = source_orig
        route_id = -1
        Route.distinct.pluck(:route_id).each do |r|
            puts r
            route =[]
            state = 0
            source = source_orig

            Route.all.each do |path|
            if path.route_id == r
                    if state == 1 and path.s_pin == source
                        route.push(path.d_pin)
                        source = path.d_pin
                    end
                    if state == 0 and path.s_pin == source
                        route.push(path.s_pin)
                        route.push(path.d_pin)
                        state = 1;
                        source = path.d_pin        
                    end
                    if source == destination
                        state = 3
                        break
                    end
                end
            end
        end
            if state == 3
                puts "route found"
            end
 
        puts route
        return route
    end
    def findpath(source_orig,destination)
        puts "Route find started"
        puts source_orig , destination
        route =[]
        state = 0
        source = source_orig
        route_id = -1
        traveltime = 0
        ParcelRoute.distinct.pluck(:route_id).each do |r|
            puts r
            route =[]
            state = 0
            source = source_orig
            traveltime = 0
            ParcelRoute.all.each do |path|
            if path.route_id == r
                    if state == 1 and path.city_1 == source
                        route.push(path.city_2)
                        source = path.city_2
                        traveltime += path.travel_time
                    end
                    if state == 0 and path.city_1 == source
                        route.push(path.city_1)
                        route.push(path.city_2)
                        state = 1;
                        source = path.city_2 
                        traveltime += path.travel_time     
                    end
                    if source == destination
                        state = 3
                        puts " break  "
                        puts source , destination   
                        break
                    end
                end
            end
            if state == 3
                break
            end
        end
            if state == 3
                puts "route found"
            end
        route.push(traveltime)
        puts route
        return route
    end

end