module SubjectLock
  def self.included(base)
    base.class_eval do
      default_scope {
        if Subject.current
          where(subject_id: Subject.current.id)
        else
          raise NoSubjectAvailable
        end
      }
      # HELP: http://stackoverflow.com/questions/12667036/default-scope-ignoring-dynamic-value-in-condition/12667077#12667077
      belongs_to :subject
      validates_presence_of :subject

      before_save :verify_current_subject
    end
  end

  def verify_current_subject
    if self.subject != Subject.current
      raise WrongSubjectException
    end
  end
end

class WrongSubjectException < Exception
end

class NoSubjectAvailable < Exception
end