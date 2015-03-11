# trading-cards

middleman project to help generate personas for sharing and collaboration.

Essentially you clone this repo 

```git
git clone https://github.com/Allyooop/trading-cards.git
```

Install Middleman

```ruby
gem install middleman
```

And then move into the project folder

```bash
cd trading-cards
```

and install the project-specific gems with the following command:

```bash
bundle install
```

This is now ready for you to overite anything you want.

You make the generic HTML files by running the Middleman build command within the ```/trading-cards/``` folder like so:

```bash
middleman build
```

This will create or overrite a folder called ```/build/``` which will contain your personas.

## Creating Personas

#### Short answer

To create personas you just fill in the related yml file (located in ```/data/```).

#### Long answer

The HTML view is auto-generated from this file ```/data/personas.yml```, so you can have one persona or a million (though that may get a little hard to use!).

The process makes use of [Middleman's proxy process](https://middlemanapp.com/advanced/dynamic_pages/).

> I am writing a short Middleman book where I will go through building a proxy step by step. It is currently very much Alpha. If you need some help get in touch via twitter for now. I am @AndrewDuck_

The ```config.rb``` file includes the lines:

```ruby
data.personas.persona.each do |persona|
  proxy "/cards/#{persona.slug}.html", "/cards/template.html", :locals => { :persona => persona }, :ignore => true
end
```

This block of code takes a file located in the ```/data/``` directory, opens the ```personas.yml``` file and locates the persona yaml object within. Namely it looks for:

```yaml
persona:
```

Underneath that object is a list of key-value pairs like so:

```yaml
  - title: ""
    slug: ""
    img: ""
    name: ""
    age: ""
    sex: ""
    job-title: ""
    job-desc: ""
    personality: ""
    goals: ""
    skills: ""
    quote: ""
```

An individual persona starts with the ```-title: ""``` and each subsiquent key value belongs to it.

> Remember, white space is extremely important in a yaml file so don't mess up the indenting or you'll break things.

To add a new persona, just fill in the "" with the relevant information.

> Naturally, you can customize everything in here, but to make it turn up you have to edit the template file as well. That is located in ```/source/cards/template.html.erb```

Each ```- title: ""``` will create a distinct ```.html``` file. The HTML file gets its name from the slug key-value pair. So, the following:

```yaml
  - title: "Worried patient"
    slug: "patient"
```

Would create a HTML file called ```patient.html``` with all of the values assigned to it (title being "Worried patient"). How does this work?

Back to our ruby block now we go.

It looked like:

```ruby
data.personas.persona.each do |persona|
  proxy "/cards/#{persona.slug}.html", "/cards/template.html", :locals => { :persona => persona }, :ignore => true
end
```

So, this takes our Yaml file and all of the personas and grabs the ```slug: ""``` information and injects it into the first URL you see.

The second line ```"/cards/template.html"``` just tells Middleman where the template it should use is. The template file is actually an ERB file, but for some reason you don't add ```.html.erb```.

The last bit, the ```:locals => { :persona => persona }, :ignore => true``` injects into that template the ability to use ERB with the name of persona to access the Yaml file's values.

That is, we can now in our template do something like ```<%= persona['title'] %>``` and be allowed access to the Yaml value of ```- title: "Worried patient"```.

The real value here, and you may have worked this out, is that the ruby block repeats the process, so that every persona you create in the Yaml file will inject it's data attributes into the template.

So, we can therefore mass create personas with just a little but of YAML! Huzzah!

> I am writing a short Middleman book where I will go through building a proxy step by step. It is currently very much Alpha. If you need some help get in touch via twitter for now. I am @AndrewDuck_

## Things to do

wireframe index page
wireframe alternative view pages?

## Colour Scheme

Feel free to change. I like it. I've never built something with pink before so this was my excuse.

Pink: ```#D42F73```
Purple: ```#B1219A```
deep-purple: ```#8738B7```
White: ```#F7F4EF```
Black: ```#403F45```
Yellow: ```#FEF343```
green: ```#007072```
orange: ```#FA7913```
