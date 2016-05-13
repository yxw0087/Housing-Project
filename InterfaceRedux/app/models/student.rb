class Student < ActiveRecord::Base
  
  def find_current_room(request)
    @clid = request.clid
    student = Student.find_by(clid: @clid)
    
  end
  
  def find_current_building(request)
    @clid = request.clid
    student = Student.find_by(clid: @clid)
    
  end
end
