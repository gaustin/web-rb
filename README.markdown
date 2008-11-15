**Web.rb:** *Web.py for Ruby*

This is only a toy project at the moment. It's an exercise for me to learn more about Ruby.

**Example Application:**
`urls = { 
  '/', 'index',
  '/users', 'users',
}

class Index
  def get
    "<b>hello there, gentlemen!</b>"
  end
end

class Users
  def get
    "<b> you don't need this</b>"
  end
end

Web.start(urls)`