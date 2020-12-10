const { environment } = require('@rails/webpacker')

// JQueryやpopperを事前に読み込むように設定
// https://qiita.com/beanbeenzou/items/4f49d4d63776234cc992

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
