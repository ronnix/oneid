from pprint import pprint
import json

from pyramid.events import BeforeRender, subscriber
from pyramid.exceptions import NotFound
from pyramid.view import view_config

from oneid.namecoin import NamecoinProxy


@subscriber(BeforeRender)
def add_renderer_globals(event):
    event['project'] = 'OneID'


@view_config(route_name='home', renderer='templates/home.mako')
def home(request):
    return {
    }


@view_config(route_name='info', renderer='json')
def info(request):
    proxy = NamecoinProxy()
    return proxy.getinfo()


@view_config(route_name='profile', renderer='templates/profile.mako')
def profile(request):
    data = {
        'id': request.matchdict['id'],
    }
    if data['id'] == 'test':
        data.update({
            'name': 'Ronan Amicel',
            'email': [
                'ronan@amicel.net',
                'ronan@pocketsensei.net',
            ],
            'bitcoin': [
                '1NnZFxcyFoM8MBiNckhXh3jDRrjz3n43ZU',
                '1NnZFxcyFoM8MBiNckhXh3jDRrjz3n43ZU',
            ],
            'namecoin': [
                'MyRZ5YHpqGiS288smQfpXtN62W9a3ZoDEg',
                'MyRZ5YHpqGiS288smQfpXtN62W9a3ZoDEg',
            ],
            'photo_url': "http://www.gravatar.com/avatar/b06b5d4777e2734feb91298062539ec8?s=256",
        })
    else:
        proxy = NamecoinProxy()
        try:
            response = proxy.name_show('id/{}'.format(request.matchdict['id']))
        except KeyError:
            raise NotFound
        pprint(response)
        value = response.get('value')
        try:
            data.update(json.loads(value))
        except ValueError:
            raise NotFound
    return data
