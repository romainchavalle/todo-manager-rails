module ProjectsHelper
  def project_status_badge(project)
    status = project.status
    labels = { "active" => "Actif", "archived" => "Archivé" }
    content_tag(:span, labels[status] || status.humanize, class: "status-badge status-badge--#{status}")
  end

  def project_status_options
    [
      ["Actifs", "active"],
      ["Archivés", "archived"]
    ]
  end

  def project_preset_colors
    [
      ["Indigo", "#4f46e5"],
      ["Bleu Océan", "#0284c7"],
      ["Émeraude", "#10b981"],
      ["Ambre", "#f59e0b"],
      ["Corail", "#ef4444"],
      ["Violet", "#8b5cf6"],
      ["Rose", "#ec4899"],
      ["Ardoise", "#64748b"]
    ]
  end
end
