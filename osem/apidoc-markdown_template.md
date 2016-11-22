The openSenseMap provides a REST API, which can be used to query & post senseBox metadata & measurements.
The endpoint is [`https://api.opensensemap.org/`](https://api.opensensemap.org/).

This documentation can also be found [here](http://sensebox.github.io/openSenseMap-API) with an improved layout.

---

# <%= project.name %>

<%= project.description %>

<% // sort groups alphabetically and methods by order in project.order %>
<% Object.keys(data).sort().forEach(function (group) { -%>
<% project.order.forEach(function(method, i, arr) { -%>
<% if (data[group][method]) data[group][method].order = i; -%>
<% }); -%>

[**<%= group %>**](#<%=: group | mlink %>)
  <% Object.keys(data[group]).sort(function(a, b) { return (data[group][a].order || Number.POSITIVE_INFINITY) > data[group][b].order; }).forEach(function (sub) { -%>
- [![](<%=: data[group][sub][0].type | badge %>) <%= data[group][sub][0].title %>](#<%=: data[group][sub][0].title | mlink %>-)
  <% }); -%>
<% }); %>

<% if (prepend) { -%>
<%- prepend %>
<% } -%>

<% Object.keys(data).sort().forEach(function (group) { -%>
# <%= group %>
<% Object.keys(data[group]).sort(function(a, b) { return (data[group][a].order || Number.POSITIVE_INFINITY) > data[group][b].order; }).forEach(function (sub) { -%>

---

{% method %}
## <%= data[group][sub][0].title %> ![<%=: data[group][sub][0].type | upcase %>](<%=: data[group][sub][0].type | badge %>)

<% if (data[group][sub][0].description) { -%>
<%-: data[group][sub][0].description %>
<% } -%>

```
<%-: data[group][sub][0].type | upcase %> <%- data[group][sub][0].url %>
```

<% if (data[group][sub][0].header && data[group][sub][0].header.fields.Header.length) { -%>
### Headers

| Name    | Type      | Description                          |
|:--------|:----------|:-------------------------------------|
<% data[group][sub][0].header.fields.Header.forEach(function (header) { -%>
| <%- header.field %> | <%- header.type %> | <%- header.optional ? '**optional**' : '' %><%- header.description %>|
<% }); //forech parameter -%>
<% } //if parameters -%>
<% if (data[group][sub][0].parameter) { -%>

<% Object.keys(data[group][sub][0].parameter.fields).forEach(function(g) { -%>

### <%= g %>

| Name     | Type       | Description                           |
|:---------|:-----------|:--------------------------------------|
<% data[group][sub][0].parameter.fields[g].forEach(function (param) { -%>
| <%- param.field %> | <%- param.type %> | <%- param.optional ? '**optional**' : '' %><%- param.description -%>
<% if (param.defaultValue) { -%>
_Default value: <%= param.defaultValue %>_<br><% } -%>
<% if (param.size) { -%>
_Size range: <%- param.size %>_<br><% } -%>
<% if (param.allowedValues) { -%>
_Allowed values: <%- param.allowedValues %>_<% } %>|
<% }); //foreach (group) parameter -%>
<% }); //foreach param parameter -%>
<% } //if parameters -%>

<% if (data[group][sub][0].examples && data[group][sub][0].examples.length) { -%>
{% common %}
### Examples

<% data[group][sub][0].examples.forEach(function (example) { -%>
{% sample lang="<%= example.type %>" %}
<%= example.title %>

```json
<%- example.content %>
```
<% }); //foreach example -%>
<% } //if example -%>

<% if (data[group][sub][0].success && data[group][sub][0].success.examples && data[group][sub][0].success.examples.length) { -%>
{% common %}
### Success Response

<% data[group][sub][0].success.examples.forEach(function (example) { -%>
{% sample lang="<%= example.type %>" %}
<%= example.title %>

```
<%- example.content %>
```
<% }); //foreach success example -%>
<% } //if examples -%>

<% if (data[group][sub][0].success && data[group][sub][0].success.fields) { -%>
<% Object.keys(data[group][sub][0].success.fields).forEach(function(g) { -%>
{% common %}
### <%= g %>

| Name     | Type       | Description    |
|:---------|:-----------|:---------------|
<% data[group][sub][0].success.fields[g].forEach(function (param) { -%>
| <%- param.field %> | <%- param.type %> | <%- param.optional ? '**optional**' : '' %><%- param.description -%>
<% if (param.defaultValue) { -%>
_Default value: <%- param.defaultValue %>_<br><% } -%>
<% if (param.size) { -%>
_Size range: <%- param.size -%>_<br><% } -%>
<% if (param.allowedValues) { -%>
_Allowed values: <%- param.allowedValues %>_<% } %>|
<% }); //forech (group) parameter -%>
<% }); //forech field -%>
<% } //if success.fields -%>

<% if (data[group][sub][0].error && data[group][sub][0].error.examples && data[group][sub][0].error.examples.length) { -%>
{% common %}
### Error Response

<% data[group][sub][0].error.examples.forEach(function (example) { -%>
{% sample lang="<%= example.type %>" %}

<%= example.title %>

```
<%- example.content %>
```
<% }); //foreach error example -%>
<% } //if examples -%>
{% common %}

{% endmethod %}
<% }); //foreach sub  -%>
<% }); //foreach group -%>
