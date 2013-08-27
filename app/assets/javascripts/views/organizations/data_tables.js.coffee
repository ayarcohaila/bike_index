class BikeIndex.Views.DataTables extends Backbone.View

  initialize: ->
    # Later we can seperate these, for now though here is good enough
    if $('#org-bikes-table').length > 0
      @loadDataTable('#org-bikes-table')
    else if $('#org-users-table').length > 0
      @loadDataTable('#org-users-table')
    else if $('#admin-bikes-table').length > 0
      @loadDataTable('#admin-bikes-table')
    else if $('#admin-users-table').length > 0
      @loadDataTable('#admin-users-table')
    else if $('#admin-orgs-table').length > 0
      @loadDataTable('#admin-orgs-table')
    else if $('#admin-manufacturers-list').length > 0
      @loadDataTable('#admin-manufacturers-list')
    else if $('#user-bikes-table').length > 0
      @loadDataTable('#user-bikes-table')
      


  loadDataTable:(table_id) ->
    $(table_id).dataTable(
      "aaSorting": [ ]
      "aLengthMenu": [[25, 50, 100, 200, -1], [25, 50, 100, 200, "All"]]
      "iDisplayLength": '50'
      "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>"
      "sPaginationType": "bootstrap"
      )
