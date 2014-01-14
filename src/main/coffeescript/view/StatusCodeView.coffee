class StatusCodeView extends Backbone.View
  initialize: ->

  render: ->
    template = @template()
    $(@el).html(template(@model))

    signatureModel =
      sampleJSON: @model.sampleJSON
      signature: @model.signature

    if @model.sampleJSON
      signatureView = new SignatureView({model: signatureModel, tagName: 'div'})
      $('.model-signature', $(@el)).append signatureView.render().el
    else
      $('.model-signature', $(@el)).html(@model.signature)

    @

  template: ->
    Handlebars.templates.status_code

