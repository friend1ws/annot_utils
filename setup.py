#!/usr/bin/env python

from distutils.core import setup

setup(name='annot_utils',
      version='0.1.0rc1',
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

