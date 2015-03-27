Router.configure
	loadingTemplate: "loading"
	layoutTemplate: "layout"

class TheFatController extends RouteController
	action: ->
		console.clear()
		@render @route.options.template
		@render "#{@route.options.template}Nav", to: "nav"
		return

Router.route "page1",
	controller: TheFatController
	path: "/"
	template: "page1"

Router.route "page2",
	controller: TheFatController
	template: "page2"

Router.route "page3",
	controller: TheFatController
	template: "page3"

Template.layout.onRendered ->
	@find(".nav-items")._uihooks =
		insertElement: (node, next) ->
			console.log "insertElement nav", node, next
			$(node).addClass("nav-on-right")
			$(node).insertBefore(next)
			Meteor.setTimeout ->
				$(node).removeClass("nav-on-right")
			, 50
			return
		removeElement: (node) ->
			Meteor.setTimeout ->
				console.log "removeElement nav", node
				$(node).remove()
			, 1000
			return
	@find(".pages")._uihooks =
		insertElement: (node, next) ->
			console.log "insertElement", node, next
			$(node).addClass("page-on-right")
			$(node).insertBefore(next)
			Meteor.setTimeout ->
				$(node).removeClass("page-on-right")
			, 50
			return
		removeElement: (node) ->
			Meteor.setTimeout ->
				console.log "removeElement", node
				$(node).remove()
			, 1000
			return
	return
