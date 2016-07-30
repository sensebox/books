The openSenseMap provides a REST API, which can be used to query data and post data.
The endpoint is [`https://api.opensensemap.org/`](https://api.opensensemap.org/).

This documentation can also be found [here](http://sensebox.github.io/openSenseMap-API) in a improved layout.

---

# <%= project.name %>

<%= project.description %>

<% Object.keys(data).sort().forEach(function (group) { -%>
- [<%= group %>](#<%=: group | mlink %>)
  <% Object.keys(data[group]).sort(function(a, b) { return data[group][a][0].title.localeCompare(data[group][b][0].title) }).forEach(function (sub) { -%>
- [![](<%=: data[group][sub][0].type | badge %>) <%= data[group][sub][0].title %>](#<%=: data[group][sub][0].title | mlink %>-)
  <% }); -%>

<% }); %>

<% if (prepend) { -%>
<%- prepend %>
<% } -%>
<% Object.keys(data).sort().forEach(function (group) { -%>
# <%= group %>

<% Object.keys(data[group]).sort(function(a, b) { return data[group][a][0].title.localeCompare(data[group][b][0].title) }).forEach(function (sub) { -%>
## <%= data[group][sub][0].title %> ![<%=: data[group][sub][0].type | upcase %>](<%=: data[group][sub][0].type | badge %>)

<% if (data[group][sub][0].description) { -%>
> <%-: data[group][sub][0].description %>
<% } -%>

```
<%-: data[group][sub][0].type | upcase %> <%= data[group][sub][0].url %>
```

<% if (data[group][sub][0].header && data[group][sub][0].header.fields.Header.length) { -%>
### Headers

| Name    | Type      | Description                          |
|---------|-----------|--------------------------------------|
<% data[group][sub][0].header.fields.Header.forEach(function (header) { -%>
| <%- header.field %> | <%- header.type %> | <%- header.optional ? '**optional**' : '' %><%- header.description %>|
<% }); //forech parameter -%>
<% } //if parameters -%>
<% if (data[group][sub][0].parameter) { -%>

<% Object.keys(data[group][sub][0].parameter.fields).forEach(function(g) { -%>

### <%= g %> Parameters

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
<% }); //forech (group) parameter -%>
<% }); //forech param parameter -%>
<% } //if parameters -%>
<% if (data[group][sub][0].examples && data[group][sub][0].examples.length) { -%>
### Examples

<% data[group][sub][0].examples.forEach(function (example) { -%>
<%= example.title %>

```json
<%- example.content %>
```
<% }); //foreach example -%>
<% } //if example -%>

<% if (data[group][sub][0].success && data[group][sub][0].success.examples && data[group][sub][0].success.examples.length) { -%>
### Success Response

<% data[group][sub][0].success.examples.forEach(function (example) { -%>
<%= example.title %>

```
<%- example.content %>
```
<% }); //foreach success example -%>
<% } //if examples -%>

<% if (data[group][sub][0].success && data[group][sub][0].success.fields) { -%>
<% Object.keys(data[group][sub][0].success.fields).forEach(function(g) { -%>
### <%= g %>

| Name     | Type       | Description                           |
|:---------|:-----------|:--------------------------------------|
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
### Error Response

<% data[group][sub][0].error.examples.forEach(function (example) { -%>
<%= example.title %>

```
<%- example.content %>
```
<% }); //foreach error example -%>
<% } //if examples -%>
---
<% }); //foreach sub  -%>
<% }); //foreach group -%>
