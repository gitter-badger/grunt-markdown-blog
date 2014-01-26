spy = jasmine.createSpy
Posts = require('sandboxed-module').require '../lib/posts',
  requires:
    './post': Post = spy('Post')


describe "Posts", ->

  describe "is array-like", ->
    markdownFiles = [ spy(), spy() ]

    Given -> @subject = new Posts(markdownFiles, spy())
    Then -> @subject instanceof Posts
    And -> @subject instanceof Array
    And -> @subject.length == 2


  describe "builds posts", ->
    markdownFiles = [ post1 = spy('post1') ]
    config = htmlDir: spy('htmlDir'), dateFormat: spy('dateFormat')

    Given -> @subject = new Posts(markdownFiles, config)
    Then -> @subject.length == 1
    Then -> @subject[0] instanceof Post
    Then -> expect(Post).toHaveBeenCalledWith(post1, config.htmlDir, config.dateFormat)
