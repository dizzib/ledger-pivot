# set global log fn. We can't just set window.log = console.log because we'll get
# 'illegal invocation' errors, since console.log expects 'this' to be console.
window.log = -> console.log ...&

<- $
$.ajax \/api/transactions do
  error  : -> log ...
  success: render

function render
  is-init    = true
  dateFormat = $.pivotUtilities.derivers.dateFormat
  sortAs     = $.pivotUtilities.sortAs

  $ \#output .pivotUI it.transactions, it.options <<< do
    derivedAttributes:
      Year : dateFormat \Date '%y'
      Month: dateFormat \Date '%n'
      Day  : dateFormat \Date '%d'
    sorters: ->
      sortAs <[ Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec ]> if it is \Month
    onRefresh: ->
      return is-init := false if is-init
      $.ajax \/api/persist do
        data : _.pick it, <[ aggregatorName cols exclusions rendererName rows vals ]>
        error: -> log ...
