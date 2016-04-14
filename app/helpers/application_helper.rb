module ApplicationHelper
  def flash_message
    show_message(:"is-danger") || show_message(:"is-success")
  end

  private

  def show_message(type)
    if flash[type]
      content_tag :div, class: ['notification is-container-margin ', type] do
        content_tag :p do
          flash[type]
        end
      end
    end
  end
end
