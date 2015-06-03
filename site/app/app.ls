<- $ # wait for dom load

# set global log fn. We can't just set window.log = console.log because we'll get
# 'illegal invocation' errors, since console.log expects 'this' to be console.
window.log = -> console.log ...&

pid = _.trim window.location.pathname, '/'
return $ \#output .text "Please specify pivot-id in the url e.g. /example" unless pid.length
$.ajax "/api/#pid/transactions" error:render-error, success:render, timeout:5000ms

function render-error xhr, status, msg
  $ \#output .text "An error occurred when calling the server: #msg"

function render
  is-init    = true
  dateFormat = $.pivotUtilities.derivers.dateFormat
  sortAs     = $.pivotUtilities.sortAs

  log it
  $ \#output .pivotUI it.transactions, (it.options or {}) <<< do
    derivedAttributes:
      Year : dateFormat \Date '%y'
      Month: dateFormat \Date '%n'
      Day  : dateFormat \Date '%d'
    hiddenAttributes: <[ Date ]>
    sorters: ->
      sortAs <[ Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec ]> if it is \Month
    onRefresh: ->
      return is-init := false if is-init
      $.ajax "/api/#pid/persist" do
        data : _.pick it, <[ aggregatorName cols exclusions rendererName rows vals ]>
        error: -> log ...
