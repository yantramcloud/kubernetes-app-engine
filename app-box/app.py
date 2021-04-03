#!/usr/bin/python
# -*- coding: utf-8 -*-
# Copyright: (c) 2020, Jayant Kaushal <jayant@yantram.cloud>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

from flask import Flask

app = Flask(__name__)

import os

class App:
    @app.route('/')
    def hello(self):
        count = 1
        return 'Hello World! I have been seen {} times.\n'.format(count)

    def __init__(self):
        self.deployment_configuration = ["terraform", "workspace","delete"]
