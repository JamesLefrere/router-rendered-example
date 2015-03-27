Router.configure
	loadingTemplate: "loading"
	layoutTemplate: "layout"

Router.route "page1",
	path: "/"

Router.route "page2"
Router.route "page3"

Template.layout.onRendered ->
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
			console.log "removeElement", node
			$(node).remove()
			return
	return
