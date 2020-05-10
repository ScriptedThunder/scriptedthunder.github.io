#! / bin / bash
ART_KB = "https://help.wnpower.com/hc/es/articles/360018540771-Como-instalar-Node-js"

NODE_VERSIONS = $ (wget -O - https://nodejs.org/dist/ 2> / dev / null | sed 's / <[^>] \ +> // g' | grep "latest. * /" | awk '{print $ 1}' | sed 's / latest - // g' | sed 's / latest // g' | sed 's / \ /// g' | sed ': a; N; $! ba ; s / \ n / / g ')

if (echo "$ NODE_VERSIONS" | grep "v. * /"> / dev / null); then
	echo "Unable to connect to https://nodejs.org/dist/, try manual installation: $ ART_KB"
the end

select VERSION in $ NODE_VERSIONS
do
	FILE = $ (wget -O - https://nodejs.org/dist/latest-$VERSION/ 2> / dev / null | sed 's / <[^>] \ +> // g' | grep "linux -arm64.tar.gz "| awk '{print $ 1}')
	BIN = $ (echo $ FILE | sed 's / .tar.gz $ //')
	echo "$ FILE will be downloaded ..."

	cd ~
	
	echo "Downloading https: //nodejs.org/dist/latest-$VERSION/$FILE ..."
	wget https://nodejs.org/dist/latest-$VERSION/$FILE -O ./$FILE

	echo "Unzipping $ FILE ..."
	tar xvfz $ FILE

	if [-d "./nodes"]; then
		echo "Node.JS installation already detected, replace? [s / n]"
		read PROMPT
		if echo "$ PROMPT" | grep -iq "^ s"; then
			rm -rf "./nodes"
		else
			echo "Aborting."
			exit 1
		the end
	the end

	mv $ BIN nodes
	rm -f $ FILE

	mkdir ~ / bin
	cp nodes / bin / node ~ / bin
	cd ~ / bin
	ln -s ../nodejs/lib/node_modules/npm/bin/npm-cli.js npm

	echo "Adding PATH ..."

	sed -i '/ PATH = \ $ PATH: \ $ HOME \ / bin / d' ~ / .bashrc
	sed -i '/ export PATH / d' ~ / .bashrc
 
	echo 'PATH = $ PATH: $ HOME / bin' >> ~ / .bashrc
	echo 'export PATH' >> ~ / .bashrc
 
	PATH = $ PATH: $ HOME / bin
	export PATH

	echo "Checking installation ..."

	echo -n "node --version:"
	node --version
	echo -n "npm --version:"
	npm --version

	echo "Ready !. For more info and sample code enter $ ART_KB"

	exit 1
done
