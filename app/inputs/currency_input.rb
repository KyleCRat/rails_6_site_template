class CurrencyInput < SimpleForm::Inputs::NumericInput
  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    template.content_tag(
      :span,
      content_tag(
        :div,
        content_tag(
          :abbr,
          '$',
          class: 'usd-symbol',
          title: 'USD'
        ),
        class: 'symbol-wrapper'
      ) +
      @builder.number_field(attribute_name, input_html_options),
      class: 'currency-input relative'
    )
  end
end
