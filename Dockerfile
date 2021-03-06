# Generated by precisionFDA exporter (v1.0.3) on 2018-06-14 06:03:06 +0000
# The asset download links in this file are valid only for 24h.

# Exported app: varsim-vcfcompare, revision: 20, authored by: marghoob.mohiyuddin
# https://precision.fda.gov/apps/app-By99jq00q38XZV2Y8jk0GyJ9

# For more information please consult the app export section in the precisionFDA docs

# Start with Ubuntu 14.04 base image
FROM ubuntu:14.04

# Install default precisionFDA Ubuntu packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
	aria2 \
	byobu \
	cmake \
	cpanminus \
	curl \
	dstat \
	g++ \
	git \
	htop \
	libboost-all-dev \
	libcurl4-openssl-dev \
	libncurses5-dev \
	make \
	perl \
	pypy \
	python-dev \
	python-pip \
	r-base \
	ruby1.9.3 \
	wget \
	xz-utils

# Install default precisionFDA python packages
RUN pip install \
	requests==2.5.0 \
	futures==2.2.0 \
	setuptools==10.2

# Add DNAnexus repo to apt-get
RUN /bin/bash -c "echo 'deb http://dnanexus-apt-prod.s3.amazonaws.com/ubuntu trusty/amd64/' > /etc/apt/sources.list.d/dnanexus.list"
RUN /bin/bash -c "echo 'deb http://dnanexus-apt-prod.s3.amazonaws.com/ubuntu trusty/all/' >> /etc/apt/sources.list.d/dnanexus.list"
RUN curl https://wiki.dnanexus.com/images/files/ubuntu-signing-key.gpg | apt-key add -

# Install app-specific Ubuntu packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
	openjdk-7-jre-headless

# Download app assets
RUN curl https://dl.dnanex.us/F/D/5Gg6gKQ8YgGKpjf663z5xb3J8JJj5gjppVZXqgP0/grch37-fasta.tar.gz | tar xzf - -C / --no-same-owner --no-same-permissions
RUN curl https://dl.dnanex.us/F/D/7VXYZKfFq4BvyXbj4Z352g5vJB9qXFGk2Xj33zfB/hs37d5-fasta.tar.gz | tar xzf - -C / --no-same-owner --no-same-permissions
RUN curl https://dl.dnanex.us/F/D/20K7bVJ73gYjbqJ12zKjP3XXyjvY0F2zV1V0k2PF/htslib-1.2.1.tar.gz | tar xzf - -C / --no-same-owner --no-same-permissions
RUN curl https://dl.dnanex.us/F/D/GyyFVq6v1vkyQ7qB2K55K4yJg1Y8XX8YBBQJ3jgF/varsim-0.5.4.tar.gz | tar xzf - -C / --no-same-owner --no-same-permissions

# Download helper executables
RUN curl https://dl.dnanex.us/F/D/0K8P4zZvjq9vQ6qV0b6QqY1z2zvfZ0QKQP4gjBXp/emit-1.0.tar.gz | tar xzf - -C /usr/bin/ --no-same-owner --no-same-permissions
RUN curl https://dl.dnanex.us/F/D/bByKQvv1F7BFP3xXPgYXZPZjkXj9V684VPz8gb7p/run-1.2.tar.gz | tar xzf - -C /usr/bin/ --no-same-owner --no-same-permissions

# Write app spec and code to root folder
RUN ["/bin/bash","-c","echo -E \\{\\\"spec\\\":\\{\\\"input_spec\\\":\\[\\{\\\"name\\\":\\\"true_vcf\\\",\\\"class\\\":\\\"file\\\",\\\"optional\\\":false,\\\"label\\\":\\\"Truth\\ VCF\\\",\\\"help\\\":\\\"Truth\\ VCF\\ generated\\ by\\ VarSim\\\"\\},\\{\\\"name\\\":\\\"test_vcf\\\",\\\"class\\\":\\\"file\\\",\\\"optional\\\":false,\\\"label\\\":\\\"Test\\ VCF\\\",\\\"help\\\":\\\"VCF\\ to\\ be\\ tested\\ for\\ accuracy\\\"\\},\\{\\\"name\\\":\\\"bed\\\",\\\"class\\\":\\\"file\\\",\\\"optional\\\":true,\\\"label\\\":\\\"BED\\ \\\",\\\"help\\\":\\\"BED\\ file\\ for\\ regions\\ of\\ interest\\\"\\},\\{\\\"name\\\":\\\"wiggle\\\",\\\"class\\\":\\\"int\\\",\\\"optional\\\":true,\\\"label\\\":\\\"Wiggle\\\",\\\"help\\\":\\\"Wiggle\\ allowance\\ for\\ validation\\\",\\\"default\\\":20\\},\\{\\\"name\\\":\\\"overlap\\\",\\\"class\\\":\\\"float\\\",\\\"optional\\\":true,\\\"label\\\":\\\"Overlap\\ ratio\\\",\\\"help\\\":\\\"Minimum\\ reciprocal\\ overlap\\ ratio\\ for\\ matching\\\",\\\"default\\\":0.8\\},\\{\\\"name\\\":\\\"prefix\\\",\\\"class\\\":\\\"string\\\",\\\"optional\\\":false,\\\"label\\\":\\\"Prefix\\\",\\\"help\\\":\\\"Output\\ prefix\\ name\\\"\\},\\{\\\"name\\\":\\\"refname\\\",\\\"class\\\":\\\"string\\\",\\\"optional\\\":true,\\\"label\\\":\\\"Refname\\\",\\\"help\\\":\\\"Reference\\ name\\\",\\\"default\\\":\\\"hs37d5\\\",\\\"choices\\\":\\[\\\"hs37d5\\\",\\\"grch37\\\",\\\"none\\\"\\]\\},\\{\\\"name\\\":\\\"other_opts\\\",\\\"class\\\":\\\"string\\\",\\\"optional\\\":true,\\\"label\\\":\\\"Other\\ options\\\",\\\"help\\\":\\\"Other\\ options\\ to\\ vcfcompare\\\"\\}\\],\\\"output_spec\\\":\\[\\{\\\"name\\\":\\\"report\\\",\\\"class\\\":\\\"file\\\",\\\"optional\\\":false,\\\"label\\\":\\\"Report\\\",\\\"help\\\":\\\"Comparison\\ report\\ in\\ HTML\\ format\\\"\\}\\],\\\"internet_access\\\":false,\\\"instance_type\\\":\\\"baseline-32\\\"\\},\\\"assets\\\":\\[\\\"file-Bk5xvzQ0qVb5k0VYzZQG7BXJ\\\",\\\"file-Bk5y43Q0qVb0gjfqY8f9k4g8\\\",\\\"file-Bk5K5zQ0qVb7ZjyyzjpB4F9g\\\",\\\"file-By99YvQ0X24Q3JKKZJQ9KKXK\\\"\\],\\\"packages\\\":\\[\\\"openjdk-7-jre-headless\\\"\\]\\} \u003e /spec.json"]
RUN ["/bin/bash","-c","echo -E \\{\\\"code\\\":\\\"\\[\\ \\!\\ -z\\ \\\\\\\"\\$bed\\\\\\\"\\ \\]\\ \\\\u0026\\\\u0026\\ bedopts\\=\\\\\\\"-bed\\ \\$bed_path\\\\\\\"\\\\n\\\\nvarsim_jar\\=\\\\\\\"/usr/bin/VarSim.jar\\\\\\\"\\\\n\\\\n\\[\\ \\\\\\\"\\$refname\\\\\\\"\\ \\!\\=\\ \\\\\\\"none\\\\\\\"\\ \\]\\ \\\\u0026\\\\u0026\\ ref_opts\\=\\\\\\\"-reference\\ \\$refname.fa\\\\\\\"\\\\n\\\\njava\\ -jar\\ \\$varsim_jar\\ vcfcompare\\ \\$ref_opts\\ -true_vcf\\ \\\\\\\"\\$true_vcf_path\\\\\\\"\\ -prefix\\ \\\\\\\"\\$prefix\\\\\\\"\\ -wig\\ \\\\\\\"\\$wiggle\\\\\\\"\\ -over\\ \\\\\\\"\\$overlap\\\\\\\"\\ \\$bedopts\\ \\$other_opts\\ \\$test_vcf_path\\\\n\\\\njava\\ -jar\\ \\$varsim_jar\\ json_inserter\\ -html\\ variant_compare.html\\ \\\\\\\"\\$prefix\\\\\\\"_report.json\\\\n\\\\ncp\\ \\\\\\\"\\$prefix\\\\\\\"_report_variant_compare.html\\ \\\\\\\"\\$prefix\\\\\\\"_report.html\\\\n\\\\nemit\\ report\\ \\\\\\\"\\$prefix\\\\\\\"_report.html\\\"\\} | python -c 'import sys,json; print json.load(sys.stdin)[\"code\"]' \u003e /script.sh"]

# Create directory /work and set it to $HOME and CWD
RUN mkdir -p /work
ENV HOME="/work"
WORKDIR /work

# Set entry point to container
ENTRYPOINT ["/usr/bin/run"]

VOLUME /data
VOLUME /work