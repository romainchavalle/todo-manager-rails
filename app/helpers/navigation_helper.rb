module NavigationHelper
  def user_initials(user)
    first = user.first_name.to_s.strip[0]
    last = user.last_name.to_s.strip[0]
    "#{first}#{last}".upcase.presence || user.email[0].upcase
  end

  def role_badge(user)
    label = user.manager? ? "Manager" : "Employé"
    modifier = user.manager? ? "manager" : "employee"

    content_tag(:span, label, class: "role-badge role-badge--#{modifier}")
  end

  def nav_link_to(label, path, icon_svg, active_condition = false)
    is_active = active_condition.is_a?(Proc) ? active_condition.call : active_condition
    css_class = ["nav-item", ("nav-item--active" if is_active)].compact.join(" ")

    link_to(path, class: css_class) do
      concat content_tag(:span, icon_svg.html_safe, class: "nav-item-icon")
      concat content_tag(:span, label, class: "nav-item-label")
    end
  end
end