module TasksHelper
  def task_status_badge(task)
    status = task.status
    labels = { "todo" => "À faire", "in_progress" => "En cours", "completed" => "Terminée" }
    content_tag(:span, labels[status] || status.humanize, class: "status-badge status-badge--#{status}")
  end

  def task_priority_badge(task)
    priority = task.priority
    labels = { "low" => "Basse", "medium" => "Moyenne", "high" => "Haute", "urgent" => "Urgente" }
    content_tag(:span, labels[priority] || priority.humanize, class: "priority-badge priority-badge--#{priority}")
  end

  def task_complexity_badge(task)
    comp = task.complexity
    labels = {
      "simple" => "1 pt • Simple",
      "medium" => "2 pts • Moyen",
      "complex" => "3 pts • Complexe",
      "heavy" => "5 pts • Très lourd"
    }
    content_tag(:span, labels[comp] || comp.humanize, class: "complexity-badge complexity-badge--#{comp}")
  end

  def task_status_options
    [
      ["À faire", "todo"],
      ["En cours", "in_progress"],
      ["Terminée", "completed"]
    ]
  end

  def task_priority_options
    [
      ["Basse", "low"],
      ["Moyenne", "medium"],
      ["Haute", "high"],
      ["Urgente", "urgent"]
    ]
  end

  def task_complexity_options
    [
      ["1 pt • Simple", "simple"],
      ["2 pts • Moyen", "medium"],
      ["3 pts • Complexe", "complex"],
      ["5 pts • Très lourd", "heavy"]
    ]
  end
end
