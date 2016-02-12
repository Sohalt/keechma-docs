docs: clearguides \
			copyguides \
			buildapidocs \
			copyapidocs \
			buildcounterdocs \
			copycounterdocs \
			buildtodomvcdocs \
			copytodomvcdocs \
			build

clearguides:
	rm -rf docs
	rm -rf dest

copyguides:
	mkdir -p docs
	cp -r ../keechma/guides/* docs

buildapidocs:
	cd ../keechma && lein codox

copyapidocs:
	cp -r ../keechma/target/doc docs/api

buildcounterdocs:
	cd ../keechma-counter && lein marg

copycounterdocs:
	mkdir -p docs/annotated
	cp ../keechma-counter/docs/uberdoc.html docs/annotated/counter.html

buildtodomvcdocs:
	cd ../keechma-todomvc && lein marg

copytodomvcdocs:
	mkdir -p docs/annotated
	cp ../keechma-todomvc/docs/uberdoc.html docs/annotated/todomvc.html

build:
	node index.js