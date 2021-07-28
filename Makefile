download=venv/bin/pip download -r /dev/stdin --dest . --platform windows --python-version 3.9 --only-binary :all:

venv:
	virtualenv venv
	venv/bin/pip install --upgrade pip


update: | venv
	curl -s https://raw.githubusercontent.com/opensafely-core/release-hatch/main/requirements.prod.txt | $(download)
	# doesn't work because of ruamel.yaml
	#curl -s https://raw.githubusercontent.com/opensafely-core/job-runner/master/requirements.txt | $(download)