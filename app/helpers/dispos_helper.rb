module DisposHelper
  # wdays is an array with the days of the week
   # to exclude (eg: [0,6] for sunday and saturday )

  def calculate_working_days(d1,d2,wdays)
        diff = d2 - d1
        holidays = 0
        ret = (d2-d1).divmod(7)
        holidays =  ret[0].truncate * wdays.length
        d1 = d2 - ret[1]
        while(d1 <= d2)
                if wdays.include?(d1.wday)
                        holidays += 1
                end
                d1 += 1
        end
        diff - holidays
   end
   def nbre_mission(name)
     id_statut = Statut.where(:name => name)
     @dispos.where(:statut_id => id_statut).count
   end
   def user_nbre_mission(name)
     id_statut = Statut.where(:name => name)
     current_user.dispos.where(:jour => (@date.beginning_of_month)..(@date.end_of_month)).where(:statut_id => id_statut).count
   end
   #TODO : Gérer ici au mieux les "non missions" => Prendre tous les jours, et soustraire ceux qui sont en mission
   def nbre_not_mission(working_days,formation,conges)
     working_days - formation - conges
   end
   def tx_production(nbre_mission,nbre_not_mission)
    tx = nbre_mission.to_f/nbre_not_mission * 100
    number_to_percentage(tx, :precision => 1)
   end
end
