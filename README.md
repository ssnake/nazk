# Nazk

Гем для работы с сайтом https://public.nazk.gov.ua и его api 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nazk', github: 'ssnake/nazk'
```

And then execute:

```ruby
  $ bundle
```


## Usage

### Api

Api НАЗК не умеет работать с параметрами:

* page
* declarationType
* declarationYear
* documentType
* dtStart
* dtEnd
* isRisk
* responsiblePositions

```ruby
api = Nazk::Api.new
results = api.search('Володимирович').go
result.items # -> json элементы текущей страницы
result.items[0] # -> {"id"=>"9a594c78-28c2-49bf-a7ba-44cd9c8e649a", "firstname"=>"Василь Васильович", "lastname"=>"Бабак", "placeOfWork"=>"Головне управління Національної поліції в Київській області", "position"=>"Начальник відділу контролю за обігом зброї у сфері дозвільної системи Управління превентивної діяльності ГУНП в Київській області", "linkPDF"=>"https://public.nazk.gov.ua/storage/documents/pdf/9/a/5/9/9a594c78-28c2-49bf-a7ba-44cd9c8e649a.pdf"}
result.page_number # -> текущий номер страницы
result.total_size # -> всего элементов в запросе
result2 = result.next # -> переход на следущую страницу. в данный момент api назк не умеет ходить по страницам
```


### Site

Сайт  НАЗК не умеет работать с параметрами:

* page

```ruby
site = Nazk::Site.new
#site.<parameter_name1(value)>.<parameter_name2(value)>.go
result = site.responsiblePositions([1,2]).search('').go #-> выдает результаты для Президент України, Прем’єр-міністр України, член Кабінету Міністрів України, перший заступник або заступник міністра та народний депутат України
result.items # -> элементы текущей страницы
result.items[0] # -> {:id=>"8608bf95-082e-4490-9183-418cfbf945c7", :name=>"Шкіря Ігор Миколайович"}
result.page_number # -> текущий номер страницы
result.total_size # -> всего элементов в запросе
```

## Development


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ssnake/nazk.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

