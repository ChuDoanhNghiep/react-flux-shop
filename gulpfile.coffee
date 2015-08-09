# Dependencies
gulp = require "gulp"
watch = require "gulp-watch"
uglify = require "gulp-uglify"
source = require "vinyl-source-stream"
browserify = require "browserify"
watchify = require "watchify"
# reactify = require "reactify"
streamify = require "gulp-streamify"
jade = require "gulp-jade"
stylus = require "gulp-stylus"
coffeelint = require "gulp-coffeelint"
coffeeify = require "coffeeify"
coffee_reactify = require "coffee-reactify"
plumber = require "gulp-plumber"
gulpif = require "gulp-if"
autoprefixer = require "gulp-autoprefixer"
minifyCss = require "gulp-minify-css"
rename = require "gulp-rename"
chalk = require "chalk"
notify = require "gulp-notify"
# modernizr = require "gulp-modernizr"

express = require "express"
connect = require "connect-livereload"
livereload = require "gulp-livereload"
lr = require("tiny-lr")()
open = require "open"

nib = require "nib"

# Configuration

config = 
  port: 9000
  build: "./public/"
  src: "./src/"
  production: false

handleErrors = (err...) ->
  args = err
  notify.onError
    title: "Compile Error"
    message: "<%= error %>"
  .apply this, args

  this.emit "end"


# copy files
# 
gulp.task "copy-files", ->
  gulp.src config.src + "vendor/**/*"
  .pipe gulp.dest config.build + "scripts/vendor"

# lint coffeescript

gulp.task "coffeelint", ->
  coffeeFiles = config.src + "coffeescript/**/*.coffee"

  watch coffeeFiles, ->      
    gulp.src coffeeFiles
    .pipe plumber()
    .pipe coffeelint()
    .pipe coffeelint.reporter()
  

# Compile coffeescript and transform jsx

gulp.task "jsCompile", ->

  watcher = watchify browserify
    entries: [config.src + "coffeescript/main.coffee"]
    # extensions: [".cjsx"]
    transform: [coffee_reactify]
    # debug: true
    # cache: {}, packageCache: {}, fullPaths: true

  rebundle = ->
    watcher
    .bundle()
    .on "error", handleErrors
    .pipe plumber()
    .pipe source("main.js")
    .pipe gulpif config.production, streamify(uglify())
    .pipe gulpif config.production, rename("main.min.js")
    .pipe gulp.dest config.build + "scripts"  

  watcher
  .on "update", ->
    console.log "browserify starting..."
    rebundle()
    console.log "browserify updated!"

  # initial bundle when this task starts
  rebundle()

# Compile jade

gulp.task "jade", ->
  gulp.src config.src + "jade/*.jade"
  .pipe plumber()
  .pipe jade
    pretty: true
  .pipe gulp.dest config.build

gulp.task "jadeWatch", ->
  watch config.src + "jade/**/*.jade", ->    
    gulp.start "jade"

# Compile stylus

gulp.task "stylus", ->
  gulp.src config.src + "stylus/main.styl"
  .pipe plumber()
  .pipe stylus
    use: nib()
    compress: false
    "include css": true
  .pipe autoprefixer "last 1 version", "> 1%"
  .pipe gulpif config.production, minifyCss()
  .pipe rename "main.css"
  .pipe gulp.dest config.build + "styles"  

gulp.task "stylusWatch", ->
  watch config.src + "stylus/**/*.styl", ->
    gulp.start "stylus"

# Watch for changes of files and notify livereload
# http://rhumaric.com/2014/01/livereload-magic-gulp-style/

gulp.task "livereload", ->
  gulp.watch [
    config.build + "scripts/**/*.js"
    config.build + "styles/**/*.css"
    config.build + "*.html"
  ], (event) ->
    gulp.src event.path, {read: false}
    .pipe livereload(lr)
    console.log chalk.yellow "server reloaded!"

# test server

gulp.task "server", ->
  app = express()
  app.use connect()
  app.use express.static config.build
  app.listen config.port
  lr.listen 35729
  setTimeout ->
    open "http://localhost:" + config.port + "/shop.html"
  , 3000

# default task

gulp.task "default", ["jadeWatch", "stylusWatch", "jsCompile", "server", "livereload"]