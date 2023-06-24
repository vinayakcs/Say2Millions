# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u=User.new
u.name="wolverine1"
u.email="wolverine1@ea.com"
u.gender="male"
u.last_name="loop1"
u.provider="facebook"
u.uid="12345665"
u.user_description="hey 0000yo sup<br> po This file should contain all the record creation needed to seed the database with its default values."
u.save

u=User.new
u.name="wolverine2"
u.email="wolverine2@ea.com"
u.gender="male"
u.last_name="loop2"
u.provider="facebook"
u.uid="12345666"
u.user_description="hey AAAAyo sup<br> po This file should contain all the record creation needed to seed the database with its default values."
u.save

u=User.new
u.name="wolverine3"
u.email="wolverine3@ea.com"
u.gender="male"
u.last_name="loop3"
u.provider="facebook"
u.uid="12345667"
u.user_description="hey BBBBByo sup<br> po This file should contain all the record creation needed to seed the database with its default values."
u.save


a=Article.new
a.category="Technology"
a.description=" soft copy of the premium receipt will be available on www.cp.hdfclife.com within 2 working days.In case you have paid the premium in advance, the premium amount will get settled in the policy only on the premium due date.soft copy of the premium receipt will be available on www.cp.hdfclife.com within 2 working days.In case you have paid the premium in advance, the premium amount will get settled in the policy only on the premium due date.soft copy of the premium receipt will be available on www.cp.hdfclife.com within 2 working days.In case you have paid the premium in advance, the premium amount will get settled in the policy only on the premium due date.soft copy of the premium receipt will be available on www.cp.hdfclife.com within 2 working days.In case you have paid the premium in advance, the premium amount will get settled in the policy only on the premium due date.soft copy of the premium receipt will be available on www.cp.hdfclife.com within 2 working days.In case you have paid the premium in advance, the premium amount will get settled in the policy only on the premium due date.soft copy of the premium receipt will be available on www.cp.hdfclife.com within 2 working days.In case you have paid the premium in advance, the premium amount will get settled in the policy only on the premium due date.soft copy of the premium receipt will be available on www.cp.hdfclife.com within 2 working days.In case you have paid the premium in advance, the premium amount will get settled in the policy only on the premium due date.soft copy of the premium receipt will be available on www.cp.hdfclife.com within 2 working days.In case you have paid the premium in advance, the premium amount will get settled in the policy only on the premium due date."
a.fbuid="12345665"
a.image_url=""
a.is_visible=true
a.title="POOL"
u=User.find(1)
u.articles << a
u.save

a=Article.new
a.category="Career"
a.description="Most of us take to blogs to render our thoughts and let the popular platforms do the html for us. Let me direct your kind attention to gitbook.
Here's what they have to say for themselves:
GitBook is a command line tool (and Node.js library) for building beautiful books using GitHub/Git and Markdown.You can publish book easily online using gitbook.io and an editor is available for Windows, Mac and Linux. You can follow @GitBookIO on Twitter. Complete documentation is available at help.gitbook.io.
Another gift from the node fraternity, this really is a cool thing if you are comfortable with little bit of markdown. Also you have the option of having your book as a static website (our own personal blog, responsive too) or a portable format (pdf, ePub, MOBI), all the while using git for version control. 
They also have a monetization platform, allowing the authors to distribute their work in prominent marketplaces after putting a price tag to their work."
a.fbuid="12345666"
a.image_url=""
a.is_visible=true
a.title="QWERTY"
u=User.find(2)
u.articles << a
u.save

a=Article.new
a.category="Politics"
a.description="You can check out the jsdoc rendered page from comments or have a quick bite here

```
eventEmitter.addListener(event,listener) AKA eventEmitter.on(event,listener)
```
Adds listener to the end of the listener array for the mentioned event, returns eventEmitter object. This will also cause 'newListener' event to be triggered provided there is a listener subscribing for the same

```
eventEmitter.once(event,listener)
```
Adds listener mentioned event,but this listener will be invoked only once returns eventEmitter object

```
eventEmitter.removeListener(event,listener)
```
Removes the provided listener for the given event, will emit the 'removeListener' event if any listeners is subscribing for it.
"
a.fbuid="12345667"
a.image_url=""
a.is_visible=true
a.title="LPOI"
u=User.find(3)
u.articles << a
u.save




a=Article.new
a.category="Career"
a.description="Most of us take to blogs to render our thoughts and let the popular platforms do the html for us. Let me direct your kind attention to gitbook.
Here's what they have to say for themselves:
GitBook is a command line tool (and Node.js library) for building beautiful books using GitHub/Git and Markdown.You can publish book easily online using gitbook.io and an editor is available for Windows, Mac and Linux. You can follow @GitBookIO on Twitter. Complete documentation is available at help.gitbook.io.
Another gift from the node fraternity, this really is a cool thing if you are comfortable with little bit of markdown. Also you have the option of having your book as a static website (our own personal blog, responsive too) or a portable format (pdf, ePub, MOBI), all the while using git for version control. 
They also have a monetization platform, allowing the authors to distribute their work in prominent marketplaces after putting a price tag to their work."
a.fbuid="12345666"
a.image_url=""
a.is_visible=true
a.title="QWERTY1"
u=User.find(2)
u.articles << a
u.save

a=Article.new
a.category="Career"
a.description="Most of us take to blogs to render our thoughts and let the popular platforms do the html for us. Let me direct your kind attention to gitbook.
Here's what they have to say for themselves:
GitBook is a command line tool (and Node.js library) for building beautiful books using GitHub/Git and Markdown.You can publish book easily online using gitbook.io and an editor is available for Windows, Mac and Linux. You can follow @GitBookIO on Twitter. Complete documentation is available at help.gitbook.io.
Another gift from the node fraternity, this really is a cool thing if you are comfortable with little bit of markdown. Also you have the option of having your book as a static website (our own personal blog, responsive too) or a portable format (pdf, ePub, MOBI), all the while using git for version control. 
They also have a monetization platform, allowing the authors to distribute their work in prominent marketplaces after putting a price tag to their work."
a.fbuid="12345666"
a.image_url=""
a.is_visible=true
a.title="QWERTY2"
u=User.find(2)
u.articles << a
u.save

a=Article.new
a.category="Politics"
a.description="You can check out the jsdoc rendered page from comments or have a quick bite here

```
eventEmitter.addListener(event,listener) AKA eventEmitter.on(event,listener)
```
Adds listener to the end of the listener array for the mentioned event, returns eventEmitter object. This will also cause 'newListener' event to be triggered provided there is a listener subscribing for the same

```
eventEmitter.once(event,listener)
```
Adds listener mentioned event,but this listener will be invoked only once returns eventEmitter object

```
eventEmitter.removeListener(event,listener)
```
Removes the provided listener for the given event, will emit the 'removeListener' event if any listeners is subscribing for it.
"
a.fbuid="12345667"
a.image_url=""
a.is_visible=true
a.title="LPOI1"
u=User.find(3)
u.articles << a
u.save

a=Article.new
a.category="Politics"
a.description="You can check out the jsdoc rendered page from comments or have a quick bite here

```
eventEmitter.addListener(event,listener) AKA eventEmitter.on(event,listener)
```
Adds listener to the end of the listener array for the mentioned event, returns eventEmitter object. This will also cause 'newListener' event to be triggered provided there is a listener subscribing for the same

```
eventEmitter.once(event,listener)
```
Adds listener mentioned event,but this listener will be invoked only once returns eventEmitter object

```
eventEmitter.removeListener(event,listener)
```
Removes the provided listener for the given event, will emit the 'removeListener' event if any listeners is subscribing for it.
"
a.fbuid="12345667"
a.image_url=""
a.is_visible=true
a.title="LPOI2"
u=User.find(3)
u.articles << a
u.save
