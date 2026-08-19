module DashboardHelper
  def employee_workload_badge(effort_points)
    case effort_points
    when 0..3
      content_tag(:span, "#{effort_points} pts • Légère", class: "capacity-badge capacity-badge--light")
    when 4..7
      content_tag(:span, "#{effort_points} pts • Équilibrée", class: "capacity-badge capacity-badge--balanced")
    else
      content_tag(:span, "#{effort_points} pts • Surcharge", class: "capacity-badge capacity-badge--overloaded")
    end
  end

  def employee_active_tasks(employee)
    employee.assigned_tasks.reject(&:completed?)
  end

  def employee_effort_points(employee)
    employee_active_tasks(employee).sum(&:complexity_points)
  end
end
