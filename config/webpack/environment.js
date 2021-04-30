const { environment } = require('@rails/webpacker')
const coffee =  require('./loaders/coffee')
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery/src/jquery',
    'window.Tether': "tether",
    Popper: ['popper.js', 'default']
  })
)

const aliasConfig = {
    'jquery-ui': 'jquery-ui-dist/jquery-ui.js'
};

environment.config.set('resolve.alias', aliasConfig);

environment.loaders.prepend('coffee', coffee)
module.exports = environment