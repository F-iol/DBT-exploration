{% set apples = ['Gala', 'Fuji', 'Honeycrisp','Red Delicious'] %}

{% for apple in apples %}
    
    {% if apple != 'Honeycrisp'%}
        {{apple}}

    {% else %}

        {{apple + " is expensive"}} 

    {% endif %}
{% endfor %}
    