{%- set PRODUCT_SCOPES = set_product_scopes () -%}
{%- set EXTENDED_SCOPES = set_extended_scopes () -%}
{%- set FAVORITE_COLUMN_VALUES = set_generic_favorite_column_values () -%}
{%- set COOKIE_ID = set_cookie_id () -%}

Product Scopes: {{ PRODUCT_SCOPES ["tv_non_premium"]}}
Extended Scopes: {{  EXTENDED_SCOPES['IM']   }}
{#  Favorite column browser, be: {{ FAVORITE_COLUMN_VALUES ['be']['browser']    }}  #}
Favorite column browser, be: {{ FAVORITE_COLUMN_VALUES    }}

test: {{ test_for() }}
