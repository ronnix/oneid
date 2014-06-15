<%inherit file="base.mako"/>

<%block name="title">${id} — OneID</%block>

<div class="row">
  <div class="col-md-2 col-md-offset-1">
    <img class="logo img-responsive" src="${request.static_url('oneid:static/pyramid.png')}" alt="pyramid web framework">
  </div>
  <div class="col-md-8 col-md-offset-1">
    <div class="content">

      <h1>${id}</h1>

      <%self:entry name="name" title="Name">
          <i class="fa fa-user"></i>
      </%self:entry>
      <%self:entry name="email" title="Email">
          <i class="fa fa-envelope-o"></i>
      </%self:entry>
      <%self:entry name="bitcoin" title="Bitcoin">
          <i class="fa fa-bitcoin"></i>
      </%self:entry>
      <%self:entry name="namecoin" title="Namecoin">
          <i class="fa fa-bitcoin"></i>
      </%self:entry>
    </div>
  </div>
</div>


<%def name="entry(name, title)">
  <%
    data = context.get(name)
    items = data if isinstance(data, list) else [data]
  %>
  % if data is not None:
    <div class="row entry">
      <div class="col-md-2">
        <h2>${title}</h2>
      </div>
      <div class="col-md-10">
      % for item in items:
        <div class="item">${caller.body()}${item}</div>
      % endfor
      </div>
    </div>
  % endif
</%def>
