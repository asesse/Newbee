module ApplicationHelper

def check_authorized(record, user)
  record.user == user
end

end
