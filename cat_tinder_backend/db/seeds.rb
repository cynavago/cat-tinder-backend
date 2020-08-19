# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cats = [
    {
        name: "Mittens",
        age: 5,
        enjoys: "Sunshine and warm spots",
        story: "Some of this cute cats favorite things are to sunbathe, lay on keyboards, and get into mischief. Her favorite snacks are pudding and tuna(not together). Her least favorite things are cucumbers and exercise.",
        image: "https://i.imgur.com/byaT7g1.jpg"
    },
    {
        name: "Raisins",
        age: 4,
        enjoys: "Scaring the dogs",
        story: "This friscy feline loves to show incabable canines who's boss. Her favorite sncack is love and her sworn enemy is the vaccum.",
        image: "https://i.imgur.com/PhooSlF.jpg"
    },
    {
        name: "Toast",
        age: 1,
        enjoys: "Getting all the attention",
        story: "Human pets are this cats idea of a vacation. His favorite snack is buttered toast and his least favorite snack is celery.",
        image: "https://i.imgur.com/HvwDddU.jpg"
    },
    {
        name: "Beans",
        age: 12,
        enjoys: "Kinda gassy",
        story: "This exotic gentelman loves to show off for the ladies. His favorite foods are canned beans and live zebra. His biggest fear is water.",
        image: "https://i.imgur.com/QeQOd5Q.jpg"
    }
]

cats.each do |attributes| 
    Cat.create attributes
    puts "Creating cat #{attributes}"
end