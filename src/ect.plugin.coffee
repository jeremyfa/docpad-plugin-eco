# Export Plugin
module.exports = (BasePlugin) ->

	# Define Plugin
	class EctPlugin extends BasePlugin

		# Plugin name
		name: 'ect'

		# Render some content
		render: (opts) ->
			# Prepare
			{inExtension, templateData, file} = opts

			# Check extensions
			if inExtension is 'ect'
				# Requires
				ECT = require('ect')
				renderer = ECT({ root: { page: opts.content or '' } })

				# Note: when running ECT this way, advanced features of ECT like extends and partials won't work.

				# Render
				try
					opts.content = renderer.render('page', templateData)
				catch err
					return err

			# Complete
			return true