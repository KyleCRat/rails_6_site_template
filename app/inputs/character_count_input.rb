class CharacterCountInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    count_options = { target: 'character-count.input', action: 'keyup->character-count#update' }
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    if input_html_options[:data]
      input_html_options[:data] = input_html_options[:data].merge(count_options)
    else
      input_html_options[:data] = count_options
    end


    template.content_tag(:div, class: 'character-count', data: { controller: 'character-count', target: 'character-count.wrapper' }) do
      content_tag(:span, content_tag(:span, 0), class: 'counter', data: { target: 'character-count.counter' }) +
      @builder.text_field(attribute_name, input_html_options)
    end
  end
end
