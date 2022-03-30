{% set cool_string = 'wow' %}
{% set cool_number = 3.14 %}

{{ cool_string }}, Pi, {{cool_number}} is cool

{% set my_animals = ['dog', 'cat', 'panther', 'rabbit'] %}

My favorite animal is {{my_animals[0]}}

{% for animal in my_animals%}
    My favorite animal is the {{animal}}
{%- endfor -%}


{% set temperature = 65 %}

{% if temperature < 45 %}
    Time for a cappucino.
{% else %}
    Time for a beer. 
{%- endif -%}