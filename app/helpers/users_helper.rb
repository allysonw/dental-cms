module UsersHelper
  def first_name(user)
    user.name.split(" ")[0]
  end
end
