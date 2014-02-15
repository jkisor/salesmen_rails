module ApplicationHelper
  def labeled_text_field_for(attribute, f)
    render 'shared/labeled_text_field', attribute: attribute, f: f
  end

  def labeled_select_for(attribute, options, f)
    id = attribute.to_s + '_id'
    render 'shared/labeled_select', attribute: attribute, id: id, options: options, f: f
  end

  def options(collection, display, value)
    collection ||= []
    collection.map { |obj| [obj.send(display), obj.send(value)]}
  end
end
