<%inherit file="base.mako"/>

<div class="row">
  <div class="col-md-2 col-md-offset-1">
    <img class="logo img-responsive" src="${request.static_url('oneid:static/pyramid.png')}" alt="pyramid web framework">
  </div>
  <div class="col-md-9">
    <div class="content">
      <h1><span class="font-semi-bold">OneID</span> <span class="smaller">Namecoin-based identity</span></h1>

      <p class="lead"><a href="http://namecoin.info">Namecoin</a> can store your public identity in a trusted way.</p>
      <p class="lead"><span class="font-normal">${project}</span> makes it easy to display and share this identity.</p>
      <div class="thanks">
        <p><span class="font-normal">${project}</span> was built by <a href="/ronan">ronan</a> during the first <a href="http://lamaisondubitcoin.fr/hackathon">Paris Bitcoin Hackathon</a>.</p>
        <p>It was built with <a href="http://www.python.org/">Python</a>, the <a href="http://www.pylonsproject.org">Pyramid</a> web framework and the <a href="https://pypi.python.org/pypi/python-bitcoinlib">python-bitcoinlib</a> library.</p>
      </div>
    </div>
  </div>
</div>
