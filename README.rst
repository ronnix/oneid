OneID: Namecoin-based identity
==============================


What is Namecoin?
-----------------

`Namecoin <http://namecoin.info>`_ is a distributed key-value
store based on the Bitcoin technology.

Namecoin's most common use is the .bit top-level domain, that
uses the ``d/`` namespace.

But you can also use it to securely store your public profile
data (name, email address, bitcoin address, GPG public key...)
in the ``id/`` namespace.


What is OneID?
-----------------

OneID acts as a presentation layer on top of the Namecoin
identity data.

It is a simple way to display a public profile, and it makes
it easy to share it using a short URL.


How do I create a profile on OneID?
-----------------------------------

You cannot create your profile through OneID at the moment.
You have to register your profile in Namecoin directly.

Your OneID profile will be available as soon as your Namecoin
identity profile has been registered.


How do I register my profile in Namecoin?
-----------------------------------------

You need to choose a username and register it in Namecoin under
the ``id/`` namespace.

The value associated with that key should be a JSON object that
contains your profile data. The required format is described in
the `Namecoin wiki <https://wiki.namecoin.info/index.php?title=Identity>`_.

Example value:

.. code-block::

    {
        "name": "Ronan Amicel",
        "email": "ronan@pocketsensei.net",
        "bitcoin": "1NnZFxcyFoM8MBiNckhXh3jDRrjz3n43ZU",
        "namecoin": "MyRZ5YHpqGiS288smQfpXtN62W9a3ZoDEg",
        "photo_url": "http://www.gravatar.com/avatar/b06b5d4777e2734feb91298062539ec8?s=256"
    }

If you are running your own Namecoin node, you can use the following
command to register your username:

.. code-block::

    $ namecoind name_new id/<username>

Make a note of the short hexadecimal number in the response
(``<rand>``), as you will need to use it in the next command.

It is then recommended that you wait for at least 12 blocks
before you first update the name:

.. code-block::

    $ namecoind name_firstupdate id/<username> <rand> '<json-value>'

Further updates will simply be:

.. code-block::

    $ namecoind name_update id/<username> '<json-value>'

Please note that a name expire after 36,000 blocks (~250 days),
so you'll need to update it periodically to reset the
expiration time.

You can also follow `these detailed instructions <http://dot-bit.org/HowToRegisterAndConfigureBitDomains>`_
that describe to how to register a Namecoin domain name.
Just make sure to replace the ``d/`` prefix (*domains*) with
``id/`` (*identity*) in the examples.


About
-----

OneID was built by `Ronan Amicel <http://oneid.io/ronan>`_ during
the first `Paris Bitcoin Hackathon <http://lamaisondubitcoin.fr/hackathon>`_.

It was built with `Python <http://www.python.org/>`_,
the `Pyramid <http://www.pylonsproject.org>`_ web framework
and the `python-bitcoinlib <https://pypi.python.org/pypi/python-bitcoinlib>`_ library.

Thanks to
---------

- Thomas Miedema for helping me shape the idea and for the
  great time we had at the hackathon
- `Stéphane Bortzmeyer <http://oneid.io/bortzmeyer>`_
  for early feedback and testing


Related projects
----------------

- `OneName <http://onename.io/>`_: Namecoin-based profiles using the ``u/`` namespace.
