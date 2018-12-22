process.env.NODE_ENV = process.env.NODE_ENV || 'development'
const merge = require('webpack-merge')
const environment = require('./environment')
const custom_conf = require('./custom')
module.exports = merge(environment.toWebpackConfig(), custom_conf)