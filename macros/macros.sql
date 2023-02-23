
{#

This macro is used to replace any Null values in a column with 0

#}

{% macro coalesce_nulls(column_name, data_type) %}

COALESCE(CAST({{ column_name }} AS {{ data_type }}), 0) AS {{ column_name }}

{% endmacro %}
