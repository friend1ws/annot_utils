#!/usr/bin/env python

"""
from distutils.core import setup

setup(name='annot_utils',
      version='0.1.1',
      description='Python programs for processing gene annotation files',
      author='Yuichi Shiraishi',
      author_email='friend1ws@gamil.com',
      url='https://github.com/friend1ws/annot_utils',
      package_dir = {'': 'lib'},
      package_data={'': ['data/*', 'data/*/*']},
      packages=['annot_utils'],
      scripts=['annot_utils'],
      license='GPL-3'
     )
"""

from setuptools import setup, find_packages
from codecs import open
from os import path

here = path.abspath(path.dirname(__file__))

with open(path.join(here, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

setup(
    name = 'annot_utils',
    version = '0.2.0a1',
    description='Python programs for processing gene annotation files',
    url = 'https://github.com/friend1ws/annot_utils',
    author = 'Yuichi Shiraishi',
    author_email = 'friend1ws@gamil.com',
    license = 'GPLv3',

    classifiers = [
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Science/Research',
        'License :: OSI Approved :: GNU General Public License v3 (GPLv3)',
        'Operating System :: Unix',
        'Programming Language :: Python :: 2.7',
        'Topic :: Scientific/Engineering :: Bio-Informatics'
    ],

    packages = find_packages(exclude = ['resource']),
    package_data={'annot_utils': ['data/*/*']},

    install_requires = [],
    entry_points = {'console_scripts': ['annot_utils = annot_utils:main']}

)


