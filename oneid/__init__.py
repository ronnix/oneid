from decimal import Decimal

from pyramid.config import Configurator
from pyramid.renderers import JSON


def configure_custom_json_renderer(config):
    json_renderer = JSON()
    def decimal_adapter(obj, request):
        return str(obj)
    json_renderer.add_adapter(Decimal, decimal_adapter)
    config.add_renderer('json', json_renderer)


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    config = Configurator(settings=settings)
    config.include('pyramid_mako')
    config.include('pyramid_cachebust')
    configure_custom_json_renderer(config)
    config.add_static_view('static', 'static', cache_max_age=3600)
    config.add_route('home', '/')
    config.add_route('info', '/_info')
    config.add_route('profile', '/{id}')
    config.scan()
    return config.make_wsgi_app()
