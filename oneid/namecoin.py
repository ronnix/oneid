import os

from bitcoin.rpc import Proxy, JSONRPCException


class NameCoinProxy(Proxy):

    def __init__(self, **kwargs):
        nmc_conf_file = os.path.expanduser('~/.namecoin/namecoin.conf')
        Proxy.__init__(self, btc_conf_file=nmc_conf_file, **kwargs)

    def name_show(self, key):
        try:
            return self._call('name_show', key)
        except JSONRPCException:
            raise KeyError
