<%inherit file="base.mako"/>

<%block name="title">${request.matchdict['id']} — OneID</%block>

<div class="row">
  <div class="col-md-4">
    <% photo_url = context.get('photo_url') or 'http://www.gravatar.com/avatar/00000000000000000000000000000000?s=165&d=mm&f=y' %>
    <div class="photo" style="background-image: url('${photo_url}');">
      <img src="${photo_url}">
    </div>
  </div>
  <div class="col-md-8">
    <div class="content">

      <h1>${request.matchdict['id']}</h1>

      <%self:entry name="name" title="Name">
          <i class="fa fa-user"></i>
      </%self:entry>
      <%self:entry name="email" title="Email" link="mailto">
          <i class="fa fa-envelope-o"></i>
      </%self:entry>
      <%self:entry name="xmpp" title="XMPP" link="xmpp">
          <i class="fa fa-comment-o"></i>
      </%self:entry>
      <%self:entry name="weblog" title="Weblog" link="url">
          <i class="fa fa-link"></i>
      </%self:entry>
      <%self:entry name="bitcoin" title="Bitcoin">
          <i class="fa fa-bitcoin"></i>
      </%self:entry>
      <%self:entry name="namecoin" title="Namecoin">
          <i>N</i>
      </%self:entry>
      <%self:entry name="gpg" title="GPG">
          <i class="fa fa-key"></i>
      </%self:entry>
    </div>
  </div>
</div>


<%def name="entry(name, title, link=None)">
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
        <div class="item">${caller.body()}
        % if link == 'url':
        <a href="${item}">${item}</a>
        % elif link == 'mailto':
        <a href="mailto:${item}">${item}</a>
        % elif link == 'xmpp':
        <a href="xmpp:${item}">${item}</a>
        % else:
        ${item}
        % endif
        </div>
      % endfor
      </div>
    </div>
  % endif
</%def>
