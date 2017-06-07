.PHONY: bootstrap install clean

ROOTDIR ?= .
VIRTUALENVPATH = venv/bin
FOCSADMINPATH ?= $(ROOTDIR)/apps/admin
FOCSCOREPATH ?= $(ROOTDIR)/apps/core
FOCSUIPATH ?= $(ROOTDIR)/apps/ui
MODULES = apps
MYPATH = $(ROOTDIR):$(PYTHONPATH)
PIP ?= $(VIRTUALENVPATH)/pip


bootstrap:
	python3 -m venv venv
	source venv/bin/activate
	pip install pip -U
	make install

install:
	PYTHONPATH=$(MYPATH) $(PIP) install -r requirements.txt

clean: clean-build clean-pyc

clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr *.egg-info
	rm -fr *.egg
	rm -rf __pycache__
	find . -name 'focs-0.1-py3.5.egg' -exec rm -rf -d {} +
	find . -name 'focs-0.1-py3.6.egg' -exec rm -rf -d {} +
	find . -name 'focs.egg-link' -exec rm -d {} +

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fd {} +

lint:
	flake8 $(MODULES) --max-complexity 24 --statistics  --config=./setup.cfg
