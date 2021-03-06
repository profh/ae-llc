class WorkDay < ActiveRecord::Base
    #Relationships
    belongs_to :job
    belongs_to :employee
    
    #Scopes
    scope :for_week, -> (week) { where("day >= ? and day < ?", week-week.wday, week-week.wday+7.days) }
    scope :for_job, -> (job_id) { where("job_id = ?", job_id) }
    scope :for_employee, -> (employee_id) { where("employee_id = ?", employee_id) }
    scope :for_day, -> (day) { where("day = ?", day.to_datetime) }#bugged not working, fix this
    
    #Validations
    validates_presence_of :day
    validates :day, uniqueness: { scope: [:job_id, :employee_id] }
    
end
