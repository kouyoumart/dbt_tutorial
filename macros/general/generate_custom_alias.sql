{%- macro generate_alias_name(custom_alias_name=none, node=none) -%}

    {%- if custom_alias_name is none -%}

        {{ node.name }}

    {%- else -%}
        {# {% set custom_alias_name = '20220218'%} #}
        {# {% set custom_alias_name = 'test'%} #}
        {{ node.name }}_{{ custom_alias_name}}

    {%- endif -%}

{%- endmacro %}
