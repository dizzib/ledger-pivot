<- $ # wait for dom load

# set global log fn. We can't just set window.log = console.log because we'll get
# 'illegal invocation' errors, since console.log expects 'this' to be console.
window.log = -> console.log ...&

pid = _.trim window.location.pathname, '/'
return $ \#output .text "Please specify pivot-id in the url e.g. /example" unless pid.length
$.ajax "/api/#pid" error:render-error, success:render, timeout:5000ms

function render-error xhr, status, msg
  $ \#output .text "An error occurred when calling the server: #msg"

function render
  is-init    = true
  dateFormat = $.pivotUtilities.derivers.dateFormat
  sortAs     = $.pivotUtilities.sortAs

  $.pivotUtilities.renderers <<< $.pivotUtilities.subtotal_renderers
  $.pivotUtilities.renderers <<< $.pivotUtilities.c3_renderers

  $ \#output .pivotUI it.transactions, (it.config.options or {}) <<< do
    dataClass: $.pivotUtilities.SubtotalPivotData
    derivedAttributes:
      Year : dateFormat \Date '%y'
      Month: dateFormat \Date '%n'
      Day  : dateFormat \Date '%d'
    hiddenAttributes: <[ Date ]>
    onRefresh: ->
      return is-init := false if is-init
      $.ajax "/api/#pid/persist/" do
        data:
          options: _.pick it, <[ aggregatorName cols exclusions rendererName rows vals ]>
        error: -> log ...
    rendererOptions:
      table:
        clickCallback: drilldown            # table
        eventHandlers: 'click': drilldown   # table with subtotal
    sorters: ->
      sortAs <[ Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec ]> if it is \Month

  function drilldown e, value, filters, pivotData
    items = []
    append = ->
      items.push it.Date + ' ' + it.Payee + ' ' + it.Commodity + it.Amount
    pivotData.forEachMatchingRecord filters, append
    alert items.join '\n'
