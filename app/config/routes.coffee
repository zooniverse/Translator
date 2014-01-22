App.Router.map ->
  @route 'login'
  @resource 'projects'
  @resource 'project', path: '/projects/:name'
